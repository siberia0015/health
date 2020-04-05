package com.yxy.ssm.dao;

import com.yxy.ssm.model.Place;

public interface PlaceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Place record);

    int insertSelective(Place record);

    Place selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Place record);

    int updateByPrimaryKey(Place record);
}