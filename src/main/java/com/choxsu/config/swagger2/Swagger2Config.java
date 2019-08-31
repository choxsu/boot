package com.choxsu.config.swagger2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.RequestMethod;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Arrays;
import java.util.List;

/**
 * swagger2 config
 *
 * @author choxsu
 * @date 2019/8/31
 */
@Configuration
@EnableSwagger2
public class Swagger2Config {

    // 配置全局参数返回状态
    private static final List<ResponseMessage> resMsgList = Arrays.asList(
            new ResponseMessageBuilder().code(200).message("成功！").build(),
            new ResponseMessageBuilder().code(-1).message("业务验证失败，需要弹窗提示用户").build(),
            new ResponseMessageBuilder().code(-2).message("业务验证失败，不需要弹窗提示").build(),
            new ResponseMessageBuilder().code(401).message("参数校验错误！").build(),
            new ResponseMessageBuilder().code(403).message("没有权限操作，请后台添加相应权限！").build(),
            new ResponseMessageBuilder().code(500).message("服务器内部异常，请稍后重试！").build(),
            new ResponseMessageBuilder().code(501).message("请登录！").build());

    @Bean
    @Profile("dev")
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.choxsu.blog"))
                .paths(PathSelectors.regex("/.*"))
                .build()
                .globalResponseMessage(RequestMethod.GET, resMsgList)
                .globalResponseMessage(RequestMethod.POST, resMsgList)
                .globalResponseMessage(RequestMethod.PUT, resMsgList)
                .globalResponseMessage(RequestMethod.DELETE, resMsgList);
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("ChoxsuBlog系统Restful API")
                .description("ChoxsuBlog系统Restful API")
                .termsOfServiceUrl("http://127.0.0.1:8080/")
                .contact(new Contact("choxsu", "https://choxsu.cn", "choxsu@163.com"))
                .version("1.0")
                .build();
    }
}
