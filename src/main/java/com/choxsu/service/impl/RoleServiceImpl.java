package com.choxsu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.AccountRole;
import com.choxsu.common.entity.Role;
import com.choxsu.common.mapper.RoleMapper;
import com.choxsu.service.AccountRoleService;
import com.choxsu.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    AccountRoleService accountRoleService;

    @Override
    public List<Role> listByAccount(Account account) {
        if (Objects.isNull(account)) {
            return null;
        }
        LambdaQueryWrapper<AccountRole> arWrapper = new LambdaQueryWrapper<>();
        arWrapper.eq(AccountRole::getAccountId, account.getId());
        List<AccountRole> list = accountRoleService.list(arWrapper);
        List<Role> roleList = new ArrayList<>();
        for (AccountRole accountRole : list) {
            Role role = getById(accountRole.getRoleId());
            if (Objects.nonNull(role)) {
                roleList.add(role);
            }
        }
        return roleList;
    }
}
