package com.choxsu.service.impl;

import com.choxsu.common.entity.SensitiveWords;
import com.choxsu.common.mapper.SensitiveWordsMapper;
import com.choxsu.service.SensitiveWordsService;
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
public class SensitiveWordsServiceImpl extends ServiceImpl<SensitiveWordsMapper, SensitiveWords> implements SensitiveWordsService {

}
