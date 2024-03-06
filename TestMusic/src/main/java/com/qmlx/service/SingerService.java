package com.qmlx.service;

import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Singer;

import java.util.List;


public interface SingerService {
    //查询所有歌手信息
    List<Singer> getAllSinger();

    //根据id批量删除数据
    int deleteByIds(List<Long> ids);

    //分页查询
    PageBean<Singer> SelectByPage(int begin, int size);

    //根据歌手姓名查询歌手
    Singer selectSingerByName(String singername);

    //根据歌曲名查询歌手名
    String selectSingerBySongName(String songname);

    //实现歌手条件查询包括分页以及模糊查询模糊查询
    public PageBean<Singer> selectByPageAndCondtion(int begin, int size, Singer singer);
}
