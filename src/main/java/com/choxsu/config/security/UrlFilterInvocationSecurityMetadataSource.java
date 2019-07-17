package com.choxsu.config.security;

import com.choxsu.common.entity.Permission;
import com.choxsu.common.entity.Role;
import com.choxsu.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * @author choxsu
 * @date 2019/7/17
 */
@Component
public class UrlFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    final PermissionService permissionService;

    final AntPathMatcher matcher = new AntPathMatcher();

    @Autowired
    public UrlFilterInvocationSecurityMetadataSource(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        //获取请求地址
        String requestUrl = ((FilterInvocation) o).getRequestUrl();
        if ("/login".equals(requestUrl)) {
            return null;
        }
        List<Permission> permissionList = permissionService.getAllPermission();
        for (Permission permission : permissionList) {
            if (matcher.match(permission.getActionKey(), requestUrl) && permission.getRoles().size() > 0) {
                List<Role> roles = permission.getRoles();
                int size = roles.size();
                String[] values = new String[size];
                for (int i = 0; i < size; i++) {
                    values[i] = roles.get(i).getName();
                }
                return SecurityConfig.createList(values);
            }
        }
        //没有匹配上的资源，都是登录访问
        return SecurityConfig.createList("ROLE_LOGIN");
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return FilterInvocation.class.isAssignableFrom(aClass);
    }
}
