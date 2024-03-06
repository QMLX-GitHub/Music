package com.qmlx.service.impl;

import com.qmlx.dao.AdminDao;
import com.qmlx.mapper.AdminMapper;
import com.qmlx.mapper.pojo.Admin;
import com.qmlx.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public List<Admin> selectAllAdmin() {
        List<Admin> admins = adminMapper.selectList(null);
        return admins;
    }
}
