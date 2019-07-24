package com.choxsu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.choxsu.common.entity.Account;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
public interface AccountService extends IService<Account> {

    /**
     * 获取账号通过username
     * @param username  用户名
     * @return
     */
    Account findAccountByUsername(String username);
}
