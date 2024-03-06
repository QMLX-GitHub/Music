package com.qmlx.control;

import com.qmlx.dao.SingerDao;
import com.qmlx.dao.SongDao;
import com.qmlx.mapper.pojo.Result;
import com.qmlx.mapper.pojo.Singer;
import com.qmlx.mapper.pojo.Song;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@RestController
public class TestControl {
    @Autowired
    private SingerDao singerDao;

    @Autowired
    private SongDao songDao;

    @RequestMapping("/loginRequests")
    //@CrossOrigin
    public Result loginRequest(){
        List<Singer> singerList = singerDao.getAllSinger();
        return Result.success(singerList);
    }
//
 /*   @PostMapping("/tingge")
    public Result tingge(String keyword,User){
        System.out.println(keyword);
        List<Singer> singerList = singerDao.getallSinger();
        return Result.success(singerList);
    }*/

    @PostMapping("/saveSinger")
    public void saveSinger(@RequestBody Singer singer, HttpServletResponse response) throws IOException {
        // 保存用户信息的逻辑
        int i = singerDao.saveSinger(singer);
        if(i==1){
            response.getWriter().write("success");
        }
        //return "用户信息已成功保存";
    }




    //歌曲查询
    @GetMapping("/getAllSong")
    public Result getAllSong(){
        List<Song> allSong = songDao.getAllSong();
        return Result.success(allSong);
    }


    //根据条件查询歌曲
    @PostMapping("/selectByName")
    public int selectByName(String user,String region,String around){
        System.out.println(user+region+around);
        return 1;
    }

    //保存歌曲
    @PostMapping("/saveSong")
    public String saveSong(@RequestBody Song song){
        System.out.println(song);
        int i = songDao.saveSong(song);
        if(i!=1){
            return "歌曲信息保存失败";
        }
        return "歌曲信息保存成功";
    }

    @PostMapping("/api/upload")
    public ResponseEntity<String> handleFileUpload(@RequestBody MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            try (InputStream inputStream = file.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(new File("D:\\CODE-JAVA\\QQMUSIC\\TestMusic\\src\\main\\resources\\static\\music\\" + file.getOriginalFilename()))) {
                StreamUtils.copy(inputStream, outputStream);
                return ResponseEntity.ok("文件上传成功！");
            } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件上传失败！");
            }
        } else {
            return ResponseEntity.badRequest().body("文件为空！");
        }
    }


    @PostMapping("/upload")
    public ResponseEntity<String> upload(@RequestBody MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String projectPath = System.getProperty("user.dir");
            String savePath = projectPath + "/TestMusic/src/main/resources/static/music/" + file.getOriginalFilename();

            try (InputStream inputStream = file.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(new File(savePath))) {
                StreamUtils.copy(inputStream, outputStream);
                return ResponseEntity.ok("文件上传成功！");
            } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件上传失败！");
            }
        } else {
            return ResponseEntity.badRequest().body("文件为空！");
        }
    }

    @PostMapping("/your-backend-endpoint")
    public String handleFormUpload(@RequestParam("name") String name,
                                   @RequestParam("email") String email,
                                   @RequestPart("fileUpload") MultipartFile file) {

        System.out.println(name+email);
        if (file.isEmpty()) {
            return "请选择要上传的文件";
        }

        // 指定文件保存路径
        String uploadDir = "D:\\CODE-JAVA\\QQMUSIC\\TestMusic\\src\\main\\resources\\static\\music\\";

        // 创建目录（如果不存在）
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            // 文件名
            String fileName = StringUtils.cleanPath(file.getOriginalFilename());

            // 保存文件到指定路径
            File destFile = new File(uploadDir + fileName);
            file.transferTo(destFile);

            // 处理其他逻辑...

            return "文件上传成功";
        } catch (IOException e) {
            e.printStackTrace();
            return "文件上传失败";
        }
    }

}
