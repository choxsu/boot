package com.choxsu.blog.index;

import com.choxsu.common.BaseController;
import com.choxsu.common.ret.Ret;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Api(tags = {"首页接口"})
@RestController
public class IndexController extends BaseController {

    @Resource
    private IndexService indexService;

    @Resource
    private KafkaTemplate<String, Object> kafkaTemplate;

    @GetMapping("/message/send")
    public boolean sendMessage(String message) {
        kafkaTemplate.send("testTopic", message);
        return true;
    }


}
