package com.choxsu.service.impl;

import com.choxsu.common.entity.AuthCode;
import com.choxsu.common.mapper.AuthCodeMapper;
import com.choxsu.service.IAuthCodeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class AuthCodeServiceImpl extends ServiceImpl<AuthCodeMapper, AuthCode> implements IAuthCodeService {

}
