package com.qmlx.service;

import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Song;

import java.util.List;

public interface SongService {

    //实现歌曲分页查询
    PageBean<Song> selectSongByPage(int begin,int size);

    //根据id批量删除数据
    int deleteByIds(List<Long> ids);

    //按照条件分页查询歌曲
    public PageBean<Song> selectByPageAndCondtion(int begin, int size, Song song);
}
