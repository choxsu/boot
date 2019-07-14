package com.choxsu.service.impl;

import com.choxsu.common.entity.BlogTag;
import com.choxsu.common.mapper.BlogTagMapper;
import com.choxsu.service.BlogTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 标签表 服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class BlogTagServiceImpl extends ServiceImpl<BlogTagMapper, BlogTag> implements BlogTagService {

}
