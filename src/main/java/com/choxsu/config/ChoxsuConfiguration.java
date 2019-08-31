package com.choxsu.config;

import com.choxsu.common._MappingKit;
import com.choxsu.common.jwt.JwtProperties;
import com.choxsu.config.cache.CaffeineCache;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.template.source.ClassPathSourceFactory;
import com.zaxxer.hikari.HikariDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.ConfigurableEnvironment;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.File;
import java.sql.Connection;
import java.util.Arrays;

/**
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@EnableCaching
@EnableConfigurationProperties(JwtProperties.class)
public class ChoxsuConfiguration {
    /**
     * 开发环境识别码
     */
    private static final String DEV = "dev";

    private static final Logger logger = LoggerFactory.getLogger(ChoxsuConfiguration.class);

    @Resource
    private HikariDataSource hikariDataSource;
    @Resource
    private ConfigurableEnvironment environment;

    /**
     * Initialization
     */
    @PostConstruct
    public void openConnection() {
        long begin = System.currentTimeMillis();
        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(hikariDataSource);
        arp.setDialect(new MysqlDialect());
        arp.setCache(CaffeineCache.me);
        arp.setTransactionLevel(Connection.TRANSACTION_READ_COMMITTED);
        arp.setDevMode(isDevelop());
        arp.setShowSql(isDevelop());
        arp.getEngine().setSourceFactory(new ClassPathSourceFactory());
        arp.start();
        //扫描sql模板
        getSqlTemplate(PathKit.getRootClassPath() + "/sql", arp);
        // 数据库表映射
        _MappingKit.mapping(arp);
        long end = System.currentTimeMillis();
        logger.info("JFinal active record plugin initialization completed in {} ms", end - begin);
    }

    /**
     * 获取开发模式
     *
     * @return true表示是开发模式
     */
    private boolean isDevelop() {
        String[] activeProfiles = environment.getActiveProfiles();
        return activeProfiles != null && Arrays.asList(activeProfiles).contains(DEV);
    }

    /**
     * 扫描指定路径下的sql模板
     *
     * @param path
     * @param arp
     */
    private void getSqlTemplate(String path, ActiveRecordPlugin arp) {
        File file = new File(path);
        if (!file.exists()) {
            return;
        }
        File[] files = file.listFiles();
        if (files != null && files.length > 0) {
            for (File childFile : files) {
                if (childFile.isDirectory()) {
                    getSqlTemplate(childFile.getAbsolutePath(), arp);
                } else {
                    String name = childFile.getName().toLowerCase();
                    if (name.endsWith(".sql")) {
                        arp.addSqlTemplate(childFile.getAbsolutePath().replace(PathKit.getRootClassPath(), "").replace("\\", "/"));
                    }
                }
            }
        }
    }
}
