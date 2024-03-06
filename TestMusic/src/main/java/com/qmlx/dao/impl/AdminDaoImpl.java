package com.qmlx.dao.impl;

import com.qmlx.dao.AdminDao;
import com.qmlx.mapper.AdminMapper;
import com.qmlx.mapper.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao {
    @Autowired
    private AdminMapper adminMapper;

    //查询所有管理员
    @Override
    public List<Admin> selectAllAdmin() {
        List<Admin> admins = adminMapper.selectList(null);
        return admins;
    }
}
