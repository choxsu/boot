package com.choxsu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.Role;
import com.choxsu.common.mapper.AccountMapper;
import com.choxsu.service.AccountService;
import com.choxsu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements AccountService {

    @Resource
    RoleService roleService;

    @Cacheable(cacheNames = "account", key = "#username")
    @Override
    public Account findAccountByUsername(String username) {
        LambdaQueryWrapper<Account> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Account::getUserName, username);
        wrapper.last("limit 1");
        Account account = baseMapper.selectOne(wrapper);
        if (account == null) {
            return null;
        }
        // 查询用户关联的所有角色信息
        List<Role> roleList = roleService.listByAccount(account);
        account.setRoles(roleList);
        return account;
    }
}
