package com.qmlx.mapper.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Songlist {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String type;
    private String introduce;
    private String tip;
    private String num;
    private String image;
}
