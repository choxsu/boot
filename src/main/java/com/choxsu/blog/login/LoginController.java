package com.choxsu.blog.login;

import com.choxsu.common.ret.Ret;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@RestController
public class LoginController {

    @PostMapping(value = "/auth/login")
    public Ret login() {

        return Ret.paramError();
    }

}
