package com.qmlx.control;

import com.qmlx.dao.SongDao;
import com.qmlx.mapper.pojo.PageBean;
import com.qmlx.mapper.pojo.Result;
import com.qmlx.mapper.pojo.Song;
import com.qmlx.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@RestController
public class SongControl {
    @Autowired
    private SongDao songDao;

    @Autowired
    private SongService songService;

    /*第二个歌单请求路径*/
    @GetMapping("/recommend")
    public Result recommend(){
        List<Song> saysong = songDao.selectByType("摇滚");
        return Result.success(saysong);
    }
    /*第二个歌单请求路径*/
    @GetMapping("/recommend2")
    public Result recommend2(){
        List<Song> saysong2 = songDao.selectByType("说唱");
        return Result.success(saysong2);
    }

    /*第三个歌单请求路径*/
    @GetMapping("/recommend3")
    public Result recommend3(){
        List<Song> saysong3 = songDao.selectByType("轻音乐");
        return Result.success(saysong3);
    }

    /*第四个歌单请求路径*/
    @GetMapping("/recommend4")
    public Result recommend4(){
        List<Song> saysong4 = songDao.selectByType("安静");
        return Result.success(saysong4);
    }

    /*第五个歌单请求路径*/
    @GetMapping("/recommend5")
    public Result recommend5(){
        List<Song> saysong5 = songDao.selectByType("国风");
        return Result.success(saysong5);
    }

    //周杰伦歌曲请求路径
    @GetMapping("/jielun")
    public Result jielun(){
        List<Song> jielun = songDao.selectBySingerName("周杰伦");
        return Result.success(jielun);
    }

    //邓紫棋歌曲请求路径
    @GetMapping("/ziqi")
    public Result ziqi(){
        List<Song> ziqi = songDao.selectBySingerName("邓紫棋");
        return Result.success(ziqi);
    }
    //薛之谦歌曲请求路径
    @GetMapping("/laoxue")
    public Result laoxue(){
        List<Song> laoxue = songDao.selectBySingerName("薛之谦");
        return Result.success(laoxue);
    }

    //Taylor歌曲请求路径
    @GetMapping("/Taylor")
    public Result Taylor(){
        List<Song> Taylor = songDao.selectBySingerName("Taylor");
        return Result.success(Taylor);
    }

    //排行榜歌曲请求数据
    @GetMapping("/Top")
    public Result Top(){
        PageBean<Song> songPageBean = songService.selectSongByPage(1, 100);
         List<Song> allSong =new ArrayList<>();
        for (Song row : songPageBean.getRows()) {
            allSong.add(row);
        }
        Collections.shuffle(allSong);
        return Result.success(allSong);
    }



}
