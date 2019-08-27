package com.choxsu.blog.index;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@RestController
public class IndexController {

    @Resource
    private IndexService indexService;


}
