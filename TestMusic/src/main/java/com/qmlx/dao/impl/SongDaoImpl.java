package com.qmlx.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qmlx.dao.SongDao;
import com.qmlx.mapper.SongMapper;
import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class SongDaoImpl implements SongDao {

    @Autowired
    private SongMapper songMapper;
    @Override
    public List<Song> getAllSong() {
        List<Song> songs = songMapper.selectList(null);
        return songs;
    }

    @Override
    public int saveSong(Song song) {
        int insert = songMapper.insert(song);
        return insert;
    }

    /*按照类型查询歌曲*/
    @Override
    public List<Song> selectByType(String type) {
        //绑定条件
        LambdaQueryWrapper<Song> lqw=new LambdaQueryWrapper<>();
        lqw.eq(Song::getType,type);
        List<Song> songs = songMapper.selectList(lqw);
        return songs;
    }

    //根据 歌手姓名查询歌曲
    @Override
    public List<Song> selectBySingerName(String name) {
        //绑定条件
        LambdaQueryWrapper<Song> lqw=new LambdaQueryWrapper<>();
        lqw.eq(Song::getName,name);
        List<Song> songs = songMapper.selectList(lqw);
        return songs;
    }

    //查询所有歌曲
    @Override
    public List<Song> selectAllSong() {
        List<Song> songs = songMapper.selectList(null);
        return songs;
    }

    @Override
    public List<Song> selectByKeyWord(String keyword) {
        LambdaQueryWrapper<Song> lqw=new LambdaQueryWrapper<>();
        lqw.eq(Song::getName,keyword);
        List<Song> songs = songMapper.selectList(lqw);
        return songs;
    }

    //歌曲分页查询
    @Override
    public PageBean<Song> selectSongByPage(int begin, int size) {
        IPage page=new Page(begin,size);//第几页，每页几条
        // userDao.selectPage(page,null);
        IPage pages = songMapper.selectPage(page, null);

        //IPage page1 = singerMapper.selectPage(page, null);
        long total = pages.getTotal();
        List records = pages.getRecords();

        PageBean<Song> singerPageBean = new PageBean<>();
        singerPageBean.setTotalCount(total);
        singerPageBean.setRows(records);

        return singerPageBean;
    }

    @Override
    public int deleteByIds(List<Long> ids) {
        int i = songMapper.deleteBatchIds(ids);
        return i;
    }

    //按照条件分页查询歌曲
    @Override
    public PageBean<Song> selectByPageAndCondtion(int begin, int size, Song song) {
        IPage page=new Page(begin,size);//第几页，每页几条
        LambdaQueryWrapper<Song> lqw=new LambdaQueryWrapper<>();
        //歌曲名模糊
        lqw.like(null!=song.getSongname(),Song::getSongname,song.getSongname());
        //类别
        lqw.like(null!= song.getType(),Song::getType,song.getType());
        //作者
        lqw.like(null!=song.getName(),Song::getName,song.getName());

        IPage page1 = songMapper.selectPage(page, lqw);
        long total = page1.getTotal();//总记录数量
        List records = page1.getRecords();//总记录数据

        PageBean<Song> singerPageBean = new PageBean<>();
        singerPageBean.setTotalCount(total);
        singerPageBean.setRows(records);

        return singerPageBean;
    }
}
