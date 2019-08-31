package com.choxsu.blog.index;

import com.choxsu.common.BaseController;
import io.swagger.annotations.Api;
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


}
