package com.choxsu.service.impl;

import com.choxsu.common.entity.Permission;
import com.choxsu.common.mapper.PermissionMapper;
import com.choxsu.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
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
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

    @Override
    @Cacheable(cacheNames = "permission")
    public List<Permission> getAllPermission() {
        return list();
    }
}
