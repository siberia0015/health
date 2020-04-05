package com.yxy.ssm.dao;

import com.yxy.ssm.model.User;

import java.util.Map;

public interface UserMapper {
    User selectUser(Map params);
    void addUser(Map params);
    Integer getLastInsertID();
/**/
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}