package com.yxy.ssm.service;

import com.baomidou.mybatisplus.service.IService;
import com.yxy.ssm.model.User;

import java.util.Map;

public interface UserService{
    User getUserByID(Integer id);
    User login(Map params);
    User register(Map params);
}
