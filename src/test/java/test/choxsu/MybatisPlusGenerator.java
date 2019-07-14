package test.choxsu;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.Test;

import javax.sql.DataSource;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @author choxsu
 * @date 2019/7/14
 */
public class MybatisPlusGenerator {


    @Test
    public void codeGenerator() {
        AutoGenerator generator = new AutoGenerator();
        generator.setGlobalConfig(globalConfig());
        generator.setDataSource(dataSourceConfig());
        StrategyConfig strategy = new StrategyConfig();
//        strategy.setTablePrefix(new String[] { "user_" });// 此处可以修改为您的表前缀
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
//        strategy.setInclude("user"); // 需要生成的表
        strategy.setEntityTableFieldAnnotationEnable(true);
        strategy.setEntityLombokModel(true);
        generator.setStrategy(strategy);
        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.choxsu")
                .setModuleName("")
                .setEntity("common.entity")
                .setMapper("common.mapper");
        generator.setPackageInfo(pc);
        generator.setCfg(new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<>();
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        });
        generator.execute();
    }

    private GlobalConfig globalConfig() {
        GlobalConfig globalConfig = new GlobalConfig();
        globalConfig.setActiveRecord(true);
        globalConfig.setOutputDir("C:\\Users\\Administrator\\Desktop\\generator");
        globalConfig.setAuthor("choxsu");
        globalConfig.setOpen(false);
        globalConfig.setServiceName("%sService");
        return globalConfig;
    }

    private DataSourceConfig dataSourceConfig() {
        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setUrl("jdbc:mysql://localhost:3306/choxsu?useUnicode=true&useSSL=false&characterEncoding=utf8");
        dataSourceConfig.setDriverName("com.mysql.jdbc.Driver");
        dataSourceConfig.setUsername("root");
        dataSourceConfig.setPassword("root");
        return dataSourceConfig;
    }

}
