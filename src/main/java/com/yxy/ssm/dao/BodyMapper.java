package com.yxy.ssm.dao;

import com.yxy.ssm.model.Body;

import java.util.Map;

public interface BodyMapper {
    Body selectByUser(Integer userid);
    void updateByUser(Map params);
    void addOriginInfo(Integer userid);
    /**/
    int deleteByPrimaryKey(Integer id);

    int insert(Body record);

    int insertSelective(Body record);

    Body selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Body record);

    int updateByPrimaryKey(Body record);
}