package com.choxsu.service;

import com.choxsu.common.entity.Permission;
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
public interface PermissionService extends IService<Permission> {

    /**
     * 获取所有权限
     * @return
     */
    List<Permission> getAllPermission();

    /**
     * 获取权限通过角色id
     * @param roleId
     * @return
     */
    List<Permission> findByRoleId(Integer roleId);
}
