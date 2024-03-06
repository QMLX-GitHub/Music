package com.qmlx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qmlx.mapper.pojo.Song;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SongMapper extends BaseMapper<Song> {
}
