package com.choxsu.service.impl;

import com.choxsu.common.entity.UploadCounter;
import com.choxsu.common.mapper.UploadCounterMapper;
import com.choxsu.service.IUploadCounterService;
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
public class UploadCounterServiceImpl extends ServiceImpl<UploadCounterMapper, UploadCounter> implements IUploadCounterService {

}
