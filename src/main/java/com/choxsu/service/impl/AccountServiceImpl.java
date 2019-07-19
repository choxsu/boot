package com.choxsu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.Role;
import com.choxsu.common.mapper.AccountMapper;
import com.choxsu.service.AccountService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.choxsu.service.RoleService;
import com.jfinal.kit.StrKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements AccountService {

    @Autowired
    RoleService roleService;

    @Cacheable(cacheNames = "account", key = "#username")
    @Override
    public Account findAccountByUsername(String username) {
        LambdaQueryWrapper<Account> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Account::getUsername, username);
        Account account = baseMapper.selectOne(wrapper);
        // 查询用户关联的所有角色信息
        List<Role> roleList = roleService.listByAccount(account);
        account.setRoles(roleList);
        return account;
    }


    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        if (StrKit.isBlank(s)) {
            throw new UsernameNotFoundException("用户名不能为空");
        }
        Account account = findAccountByUsername(s);
        if (account == null) {
            throw new UsernameNotFoundException("用户名不正确");
        }
        return account;
    }
}
