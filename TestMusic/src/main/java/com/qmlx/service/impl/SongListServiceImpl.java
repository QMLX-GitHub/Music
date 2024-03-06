package com.qmlx.service.impl;

import com.qmlx.dao.SongListDao;
import com.qmlx.mapper.pojo.Songlist;
import com.qmlx.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongListServiceImpl implements SongListService {
    @Autowired
    private SongListDao songListDao;
    @Override
    public Songlist selectSongListByType(String type) {
        Songlist songlist = songListDao.selectSongListByType(type);
        return songlist;
    }

    @Override
    public List<Songlist> selectAllSongList() {

        List<Songlist> songlists = songListDao.selectAllSongList();
        return songlists;
    }
}
