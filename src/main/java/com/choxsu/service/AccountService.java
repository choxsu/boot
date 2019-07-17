package com.choxsu.service;

import com.choxsu.common.entity.Account;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
public interface AccountService extends IService<Account>, UserDetailsService {

    /**
     * 获取账号通过username
     * @param username  用户名
     * @return
     */
    Account findAccountByUsername(String username);
}
