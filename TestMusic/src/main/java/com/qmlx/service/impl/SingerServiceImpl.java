package com.qmlx.service.impl;

import com.qmlx.dao.SingerDao;
import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Singer;
import com.qmlx.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SingerServiceImpl implements SingerService {
    @Autowired
    private SingerDao singerDao;

    //获取所有歌手
    @Override
    public List<Singer> getAllSinger() {
        List<Singer> allSinger = singerDao.getAllSinger();
        return allSinger;
    }

    //根据id批量删除数据
    @Override
    public int deleteByIds(List<Long> ids) {
        int i = singerDao.deleteByIds(ids);
        return i;
    }

    @Override
    public PageBean<Singer> SelectByPage(int begin, int size) {
        PageBean<Singer> singerPageBean = singerDao.SelectByPage(begin, size);
        return singerPageBean;
    }

    @Override
    public Singer selectSingerByName(String singername) {
        Singer singer = singerDao.selectSingerByName(singername);
        return singer;
    }

    //根据歌曲名查询歌手名
    @Override
    public String selectSingerBySongName(String songname) {
        return singerDao.selectSingerBySongName(songname);
    }


    //实现歌手条件查询包括分页以及模糊查询模糊查询
    @Override
    public PageBean<Singer> selectByPageAndCondtion(int begin, int size, Singer singer) {
        PageBean<Singer> singerPageBean = singerDao.selectByPageAndCondtion(begin, size, singer);
        return singerPageBean;
    }
}
