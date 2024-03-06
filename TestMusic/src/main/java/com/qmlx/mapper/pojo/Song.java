package com.qmlx.mapper.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.List;

@Data
public class Song {

    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String name;
    private String image;
    private String url;
    private String songname;
    private String time;
    private String type;

}
