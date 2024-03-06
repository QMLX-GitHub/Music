package com.qmlx.dao.impl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qmlx.dao.SingerDao;
import com.qmlx.mapper.SingerMapper;
import com.qmlx.mapper.SongMapper;
import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Singer;
import com.qmlx.mapper.pojo.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class SingerDaoImpl implements SingerDao {
    @Autowired
    private SingerMapper singerMapper;
    @Autowired
    private SongMapper songMapper;

    @Override
    public List<Singer> getAllSinger() {
        List<Singer> singerList = singerMapper.selectList(null);
        return singerList;
    }

    //保存歌手信息
    @Override
    public int saveSinger(Singer singer) {
        int insert = singerMapper.insert(singer);
        return insert;
    }

    //根据id批量删除歌手
    @Override
    public int deleteByIds(List<Long> ids) {
        int i = singerMapper.deleteBatchIds(ids);
        return i;
    }

    //实现分页查询
    @Override
    public PageBean<Singer> SelectByPage(int begin, int size) {
        IPage page=new Page(begin,size);//第几页，每页几条
       // userDao.selectPage(page,null);
        IPage page1 = singerMapper.selectPage(page, null);
        long total = page1.getTotal();
        List records = page1.getRecords();

        PageBean<Singer> singerPageBean = new PageBean<>();
        singerPageBean.setTotalCount(total);
        singerPageBean.setRows(records);

        return singerPageBean;
      /*  System.out.println(page.getPages());//总共有多少页
        System.out.println(page.getCurrent());//当前是第几页
        System.out.println(page.getTotal());//获取总记录数
        System.out.println(page.getSize());//每页显示数
        System.out.println(page.getRecords());*/
    }

    //根据歌手名查询歌手信息
    @Override
    public Singer selectSingerByName(String singername) {
        LambdaQueryWrapper<Singer> lqw=new LambdaQueryWrapper<>();
        lqw.eq(null!=singername,Singer::getName,singername);
        Singer singer = singerMapper.selectOne(lqw);
        return singer;
    }

    //根据歌曲名查询歌手名
    @Override
    public String selectSingerBySongName(String songname) {
        LambdaQueryWrapper<Song> lqw=new LambdaQueryWrapper<>();
        lqw.eq(null!=songname,Song::getSongname,songname);
        List<Song> songs = songMapper.selectList(lqw);

        String name = songs.get(0).getName();
        return name;
    }

    //实现歌手条件查询包括分页以及模糊查询模糊查询
    @Override
    public PageBean<Singer> selectByPageAndCondtion(int begin, int size, Singer singer) {
        IPage page=new Page(begin,size);//第几页，每页几条
        LambdaQueryWrapper<Singer> lqw=new LambdaQueryWrapper<>();
        //歌手名模糊
        lqw.like(null!=singer.getName(),Singer::getName,singer.getName());
        //性别模糊
        lqw.like(null!= singer.getSex(),Singer::getSex,singer.getSex());
        //代表作
        lqw.like(null!=singer.getLocation(),Singer::getLocation,singer.getLocation());

        IPage page1 = singerMapper.selectPage(page, lqw);
        long total = page1.getTotal();//总记录数量
        List records = page1.getRecords();//总记录数据

        PageBean<Singer> singerPageBean = new PageBean<>();
        singerPageBean.setTotalCount(total);
        singerPageBean.setRows(records);

        return singerPageBean;
    }
}
