package com.qmlx.mapper.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Singer {
    //@TableId(value = "id", type = IdType.AUTO)
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String name;
    private String sex;
    private String image;
    private String location;
    private String introduction;
}
