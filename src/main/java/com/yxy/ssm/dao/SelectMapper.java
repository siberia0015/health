package com.yxy.ssm.dao;

import com.yxy.ssm.model.Select;

public interface SelectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Select record);

    int insertSelective(Select record);

    Select selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Select record);

    int updateByPrimaryKey(Select record);
}