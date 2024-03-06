package com.qmlx.dao;

import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Song;

import java.util.List;

public interface SongDao {

    //查询所有歌曲
    List<Song> getAllSong();

    //保存歌曲信息
    int saveSong(Song song);

    //根据类型查询歌曲
    List<Song> selectByType(String type);

    //根据歌手姓名查询
    List<Song> selectBySingerName(String name);

    //查询所有歌曲
    List<Song> selectAllSong();

    //根据关键字查询歌曲
    List<Song> selectByKeyWord(String keyword);

    //实现歌曲的分页查询
    PageBean<Song> selectSongByPage(int begin,int size);

    //根据id批量删除歌曲
    int deleteByIds(List<Long> ids);

    //根据歌曲信息实现按条件分页查询
    PageBean<Song> selectByPageAndCondtion(int begin, int size, Song song);
}
