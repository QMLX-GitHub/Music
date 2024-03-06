package com.qmlx.dao;

import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Singer;

import java.util.List;

public interface SingerDao {

    //查询所有歌手信息
    List<Singer> getAllSinger();

    //保存歌手信息
    int saveSinger(Singer singer);

    //根据id批量删除数据
    int deleteByIds(List<Long> ids);

    //歌手分页查询
    PageBean<Singer> SelectByPage(int begin, int size);
    //根据歌手名查询歌手信息
    Singer selectSingerByName(String singername);

    //根据歌曲名查询歌手名
    String selectSingerBySongName(String songname);

    //实现歌手条件查询包括分页以及模糊查询模糊查询
    PageBean<Singer> selectByPageAndCondtion(int begin,int size,Singer singer);
}
