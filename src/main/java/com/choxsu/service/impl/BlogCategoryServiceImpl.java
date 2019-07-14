package com.choxsu.service.impl;

import com.choxsu.common.entity.BlogCategory;
import com.choxsu.common.mapper.BlogCategoryMapper;
import com.choxsu.service.IBlogCategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 类别表 服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class BlogCategoryServiceImpl extends ServiceImpl<BlogCategoryMapper, BlogCategory> implements IBlogCategoryService {

}
