package com.choxsu.service.impl;

import com.choxsu.common.entity.IpRepository;
import com.choxsu.common.mapper.IpRepositoryMapper;
import com.choxsu.service.IIpRepositoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * IP库 服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class IpRepositoryServiceImpl extends ServiceImpl<IpRepositoryMapper, IpRepository> implements IIpRepositoryService {

}
