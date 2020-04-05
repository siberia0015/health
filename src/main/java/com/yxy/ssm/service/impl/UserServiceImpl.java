package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.UserMapper;
import com.yxy.ssm.model.Place;
import com.yxy.ssm.model.User;
import com.yxy.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User login(Map params){
        User user = userMapper.selectUser(params);
        return user;
    }
    @Override
    public User getUserByID(Integer id){
        return userMapper.selectByPrimaryKey(id);
    }
    @Override
    public User register(Map params){
        userMapper.addUser(params);
        User user = userMapper.selectByPrimaryKey(userMapper.getLastInsertID());
        return user;
    }
}
