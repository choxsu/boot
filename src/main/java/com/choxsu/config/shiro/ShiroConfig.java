package com.choxsu.config.shiro;

import com.choxsu.common.jwt.JwtFilter;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author choxsu
 * @date 2019/7/20
 */
@Configuration
public class ShiroConfig {

    @Bean
    public Realm userRealm() {
        return new UserRealm();
    }

    @Bean
    protected CacheManager cacheManager() {
        return new MemoryConstrainedCacheManager();
    }

    @Bean
    public DefaultWebSecurityManager securityManager(ShiroCacheManager shiroCacheManager) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm());
        //关闭shiro自带的session
        DefaultSubjectDAO subjectDAO = new DefaultSubjectDAO();
        DefaultSessionStorageEvaluator defaultSessionStorageEvaluator = new DefaultSessionStorageEvaluator();
        defaultSessionStorageEvaluator.setSessionStorageEnabled(false);
        subjectDAO.setSessionStorageEvaluator(defaultSessionStorageEvaluator);
        securityManager.setSubjectDAO(subjectDAO);
        //自定义缓存管理
        securityManager.setCacheManager(shiroCacheManager);
        return securityManager;
    }

    /**
     * My Shiro Filter Chain Definition
     */
    @Bean
    public ShiroFilterChainDefinition shiroFilterChainDefinition() {
        DefaultShiroFilterChainDefinition chainDefinition = new DefaultShiroFilterChainDefinition();
        // swagger2
        chainDefinition.addPathDefinition("/swagger-ui.html", "anon");
        chainDefinition.addPathDefinition("/webjars/**", "anon");
        chainDefinition.addPathDefinition("/swagger-resources/**", "anon");
        chainDefinition.addPathDefinition("/v2/api-docs", "anon");
        chainDefinition.addPathDefinition("/csrf", "anon");
        // logged in users with the 'admin' role
        chainDefinition.addPathDefinition("/admin/**", "authc, roles[admin]");
        // logged in users with the 'document:read' permission
        chainDefinition.addPathDefinition("/docs/**", "authc, perms[document:read]");
        chainDefinition.addPathDefinition("/**/favicon.ico", "anon");
        // static resources ignore
        chainDefinition.addPathDefinition("/js/**", "anon");
        chainDefinition.addPathDefinition("/html/**", "anon");
        chainDefinition.addPathDefinition("/css/**", "anon");
        // login ignore
        chainDefinition.addPathDefinition("/auth/login", "anon");
        // all other paths require a logged in user
        chainDefinition.addPathDefinition("/**", "authc");
        return chainDefinition;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilter(DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);

        // 添加jwt过滤器
        Map<String, Filter> filterMap = new HashMap<>();
        filterMap.put("jwt", jwtFilter());
//        filterMap.put("logout", new SystemLogoutFilter());
        shiroFilter.setFilters(filterMap);

        //拦截器
        Map<String, String> filterRuleMap = new LinkedHashMap<>();
        filterRuleMap.put("/logout", "logout");
        filterRuleMap.put("/**", "jwt");
        shiroFilter.setFilterChainDefinitionMap(filterRuleMap);

        return shiroFilter;
    }

    @Bean
    public JwtFilter jwtFilter() {
        return new JwtFilter();// 此处为AccessToken
    }

}
