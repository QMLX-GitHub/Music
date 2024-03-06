package com.qmlx.service.impl;

import com.qmlx.dao.SongDao;
import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Song;
import com.qmlx.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongServiceImpl implements SongService {

    @Autowired
    private SongDao songDao;
    @Override
    //分页查询歌曲
    public PageBean<Song> selectSongByPage(int begin, int size) {
        PageBean<Song> songPageBean = songDao.selectSongByPage(begin,size);
        return songPageBean;
    }

    @Override
    public int deleteByIds(List<Long> ids) {
        int i = songDao.deleteByIds(ids);
        return i;
    }

    @Override
    public PageBean<Song> selectByPageAndCondtion(int begin, int size, Song song) {
        PageBean<Song> songPageBean = songDao.selectByPageAndCondtion(begin, size, song);
        return songPageBean;
    }
}
