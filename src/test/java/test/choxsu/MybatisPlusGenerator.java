package test.choxsu;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableField;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.jfinal.kit.JavaKeyword;
import org.junit.Test;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
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
        String[] tablePrefix = new String[] { };

        AutoGenerator generator = new AutoGenerator();
        generator.setGlobalConfig(globalConfig());
        generator.setDataSource(dataSourceConfig());
        StrategyConfig strategy = new StrategyConfig();
        strategy.setTablePrefix(tablePrefix);// 此处可以修改为您的表前缀
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        strategy.setInclude("dr_activity"); // 需要生成的表
        strategy.setEntityTableFieldAnnotationEnable(true);
        strategy.setEntityLombokModel(true);
        strategy.setNameConvert(new INameConvert() {
            @Override
            public String entityNameConvert(TableInfo tableInfo) {
                return NamingStrategy.capitalFirst(processName(tableInfo.getName(), strategy.getNaming(), tablePrefix));
            }
            @Override
            public String propertyNameConvert(TableField field) {
                String fieldName = processName(field.getName(), strategy.getNaming(), strategy.getFieldPrefix());
                fieldName = JavaKeyword.me.contains(fieldName) ? "_" + fieldName : fieldName;
                field.setPropertyName(strategy, fieldName);
                return fieldName;
            }
        });
        generator.setStrategy(strategy);
        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.zskj.job.executor")
                .setModuleName("")
                .setEntity("entity.mp")
                .setMapper("core.mapper")
                .setService("service.mp")
                .setServiceImpl("service.mp.impl");

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

    private String processName(String name, NamingStrategy strategy, String[] prefix) {
        boolean removePrefix = false;
        if (prefix != null && prefix.length != 0) {
            removePrefix = true;
        }
        String propertyName;
        if (removePrefix) {
            if (strategy == NamingStrategy.underline_to_camel) {
                // 删除前缀、下划线转驼峰
                propertyName = NamingStrategy.removePrefixAndCamel(name, prefix);
            } else {
                // 删除前缀
                propertyName = NamingStrategy.removePrefix(name, prefix);
            }
        } else if (strategy == NamingStrategy.underline_to_camel) {
            // 下划线转驼峰
            propertyName = NamingStrategy.underlineToCamel(name);
        } else {
            // 不处理
            propertyName = name;
        }
        return propertyName;
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
        dataSourceConfig.setUrl("jdbc:mysql://192.168.3.131:3306/drt-test?useUnicode=true&useSSL=false&characterEncoding=utf8");
        dataSourceConfig.setDriverName("com.mysql.jdbc.Driver");
        dataSourceConfig.setUsername("root");
        dataSourceConfig.setPassword("123456");
        return dataSourceConfig;
    }

}
