package com.choxsu.service;

import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
public interface RoleService extends IService<Role> {
    /**
     * 通过账户信息查询角色信息
     * @param account
     * @return
     */
    List<Role> listByAccount(Account account);
}
