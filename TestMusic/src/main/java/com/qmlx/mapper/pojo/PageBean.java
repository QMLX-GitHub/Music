package com.qmlx.mapper.pojo;

import lombok.Data;

import java.util.List;

@Data
public class PageBean<T> {

    private Long totalCount;//总记录数
    private List<T> rows;
}
