package com.yxy.ssm.dao;

import com.yxy.ssm.model.Assess;

public interface AssessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Assess record);

    int insertSelective(Assess record);

    Assess selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Assess record);

    int updateByPrimaryKeyWithBLOBs(Assess record);

    int updateByPrimaryKey(Assess record);
}