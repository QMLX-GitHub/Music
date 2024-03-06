package com.qmlx.dao;

import com.qmlx.mapper.pojo.Admin;

import java.util.List;

public interface AdminDao {
    //查询所有管理员
    List<Admin> selectAllAdmin();
}
