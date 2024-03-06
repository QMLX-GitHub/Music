package com.qmlx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qmlx.mapper.pojo.Singer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SingerMapper extends BaseMapper<Singer> {
}
