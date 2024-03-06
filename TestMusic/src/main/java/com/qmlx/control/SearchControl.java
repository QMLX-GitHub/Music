package com.qmlx.control;

import com.qmlx.dao.SingerDao;
import com.qmlx.dao.SongDao;
import com.qmlx.mapper.pojo.*;

import com.qmlx.service.AdminService;
import com.qmlx.service.SingerService;
import com.qmlx.service.SongListService;
import com.qmlx.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SearchControl {

    @Autowired
    private SongDao songDao;

    @Autowired
    private SingerDao singerDao;
    @Autowired
    private SingerService singerService;

    @Autowired
    private SongService songService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private SongListService songListService;
    //根据关键词查询歌曲
    @GetMapping("/selectByKeyWord")
    public SearchResult selectByKeyWord(String keyword){
        //根据歌单搜索
        String[] type= {"安静","摇滚","国风","说唱","轻音乐","流行","民谣","乡村","金属","粤语","爵士"};
        for (String s : type) {
            if(s.equals(keyword)){
                //查询给歌单
                Songlist songlist = songListService.selectSongListByType(s);
                //查询歌曲
                List<Song> songs = songDao.selectByType(s);
                return SearchResult.successSongList(songlist,songs);
            }

        }


        System.out.println(keyword);
        List<Song> songs;
        //根据歌手搜索
        Singer singer =null;
        singer=singerService.selectSingerByName(keyword);
        if(singer!=null){
            songs = songDao.selectByKeyWord(keyword);
            return SearchResult.successSinger(singer,songs);
        }
        //根据歌曲搜索

        String singername = singerService.selectSingerBySongName(keyword);
         singer= singerService.selectSingerByName(singername);
        songs = songDao.selectByKeyWord(singername);
        return SearchResult.successSinger(singer,songs);
    }

    //实现歌手的分页查询
    @GetMapping("/SelectByPage")
    public Result SelectByPage(Integer begin,Integer size){
        System.out.println(begin+":"+size);
        PageBean<Singer> singerPageBean = singerService.SelectByPage(begin, size);
        return Result.success(singerPageBean);
    }

    //实现歌曲的分页查询
    @GetMapping("/SelectByPageSong")
    public Result SelectByPageSong(Integer begin,Integer size){
        System.out.println(begin+":"+size);
        PageBean<Song> songPageBean = songService.selectSongByPage(begin, size);
        return Result.success(songPageBean);
    }

    //实现歌手根据条件分页查询
    @PostMapping ("/selectByPageAndCondition")
    public Result selectByPageAndCondition(@RequestBody Singer singer){
        System.out.println(singer);
       /* System.out.println(currentPage);
        System.out.println(pageSize);*/
        PageBean<Singer> singerPageBean = singerService.selectByPageAndCondtion(1, 10, singer);
        return Result.success(singerPageBean);
    }

    //实现歌曲根据条件分页查询
    @PostMapping ("/selectSongByPageAndCondition")
    public Result selectByPageAndCondition(@RequestBody Song song){
        System.out.println(song);
        PageBean<Song> songPageBean = songService.selectByPageAndCondtion(1, 10, song);
        return Result.success(songPageBean);
    }

    ///实现歌手界面动态渲染
    @GetMapping("/selectSingerByNameToSingerPage")
    public Result selectSingerByNameToSingerPage(){
        List<Singer> allSinger = singerService.getAllSinger();
        return Result.success(allSinger);
    }

    //实现管理员查询
    @GetMapping("/selectAllAdmin")
    public Result selectAllAdmin(){
        List<Admin> admins = adminService.selectAllAdmin();
        return Result.success(admins);
    }

    //查询所有歌单进行渲染
    @GetMapping("/selectAllSongList")
    public Result selectAllSongList(){
        List<Songlist> songlists = songListService.selectAllSongList();
        return Result.success(songlists);
    }

}
