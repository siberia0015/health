package com.yxy.ssm.dao;

import com.yxy.ssm.model.Route;

public interface RouteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Route record);

    int insertSelective(Route record);

    Route selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Route record);

    int updateByPrimaryKey(Route record);
}