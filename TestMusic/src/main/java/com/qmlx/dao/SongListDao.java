package com.qmlx.dao;

import com.qmlx.mapper.pojo.Songlist;

import java.util.List;

public interface SongListDao {
    //根据类型查询所有歌单
    Songlist selectSongListByType(String type);


    //查询所有歌单
    List<Songlist> selectAllSongList();
}
