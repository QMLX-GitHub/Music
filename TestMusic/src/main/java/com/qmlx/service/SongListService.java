package com.qmlx.service;

import com.qmlx.mapper.pojo.Songlist;

import java.util.List;

public interface SongListService {

    //根据类型查询歌单
    public Songlist selectSongListByType(String type);

    //查询所有歌单
    List<Songlist> selectAllSongList();
}
