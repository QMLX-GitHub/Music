package com.qmlx.service;

import com.qmlx.mapper.pojo.Admin;

import java.util.List;


public interface AdminService {

    //查询所有管理员
    public List<Admin> selectAllAdmin();
}
