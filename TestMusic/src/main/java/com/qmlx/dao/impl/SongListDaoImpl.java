package com.qmlx.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.qmlx.dao.SongListDao;
import com.qmlx.mapper.SongListMapper;
import com.qmlx.mapper.pojo.Songlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SongListDaoImpl implements SongListDao {
    @Autowired
    private SongListMapper songListMapper;
    @Override
    public Songlist selectSongListByType(String type) {
        LambdaQueryWrapper<Songlist> lqw=new LambdaQueryWrapper<>();
        lqw.eq(null!=type,Songlist::getType,type);

        Songlist songlist = songListMapper.selectOne(lqw);
        return songlist;
    }

    @Override
    public List<Songlist> selectAllSongList() {

        List<Songlist> songlists = songListMapper.selectList(null);
        return songlists;
    }
}
