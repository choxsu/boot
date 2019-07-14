package com.choxsu.service.impl;

import com.choxsu.common.entity.Session;
import com.choxsu.common.mapper.SessionMapper;
import com.choxsu.service.ISessionService;
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
public class SessionServiceImpl extends ServiceImpl<SessionMapper, Session> implements ISessionService {

}
