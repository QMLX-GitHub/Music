package com.qmlx.control;

import com.qmlx.service.SingerService;
import com.qmlx.service.SongService;
import com.qmlx.util.QmlxJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
public class DeleteControl {

    @Autowired
    private SingerService singerService;

    @Autowired
    private SongService songService;
    //批量删除歌手
    @PostMapping("/deleteByIds")
    public void deleteByIds(@RequestBody String selectionIds) throws IOException {
        System.out.println(selectionIds);
        //将字符串变化为一个int数组
        int[] intArray = QmlxJsonUtil.convertStringToIntArray(selectionIds);
        List<Long> ids=new ArrayList<>();
        // 处理int数组
        if (intArray != null) {
            for (int value : intArray) {
                ids.add((long) value);
            }
        }
        singerService.deleteByIds(ids);
    }

    //批量删除歌曲
    @PostMapping("/deleteSongByIds")
    public void deleteSongByIds(@RequestBody String selectionIds) throws IOException {
        System.out.println(selectionIds);
        //将字符串变化为一个int数组
        int[] intArray = QmlxJsonUtil.convertStringToIntArray(selectionIds);
        List<Long> ids=new ArrayList<>();
        // 处理int数组
        if (intArray != null) {
            for (int value : intArray) {
                ids.add((long) value);
            }
        }
        songService.deleteByIds(ids);
    }
}
