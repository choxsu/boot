package com.choxsu.service.impl;

import com.choxsu.common.entity.Images;
import com.choxsu.common.mapper.ImagesMapper;
import com.choxsu.service.IImagesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 图片上厂记录表 服务实现类
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Service
public class ImagesServiceImpl extends ServiceImpl<ImagesMapper, Images> implements IImagesService {

}
