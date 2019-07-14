package com.choxsu.config;

import com.choxsu.common._MappingKit;
import com.choxsu.config.cache.CaffeineCache;
import com.choxsu.utils.BaseUtil;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.hikaricp.HikariCpPlugin;
import com.jfinal.template.source.ClassPathSourceFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.io.File;
import java.sql.Connection;

/**
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@EnableAutoConfiguration(exclude = DataSourceAutoConfiguration.class)
public class ChoxsuConfiguration {

    private static final Logger logger = LoggerFactory.getLogger(ChoxsuConfiguration.class);

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    /**
     * Initialization
     */
    @PostConstruct
    public void openConnection() {
        HikariCpPlugin hikariCpPlugin = new HikariCpPlugin(url, username, password);
        hikariCpPlugin.start();
        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(hikariCpPlugin);
        arp.setDialect(new MysqlDialect());
        arp.setCache(CaffeineCache.me);
        arp.setTransactionLevel(Connection.TRANSACTION_READ_COMMITTED);
        arp.setShowSql(BaseUtil.isDevelop());
        arp.getEngine().setSourceFactory(new ClassPathSourceFactory());
        arp.start();
        //扫描sql模板
        getSqlTemplate(PathKit.getRootClassPath() + "/sql", arp);
        // 数据库表映射
        _MappingKit.mapping(arp);
        logger.info("JFinal active record plugin initialization completed");
    }

    /**
     * 扫描指定路径下的sql模板
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
