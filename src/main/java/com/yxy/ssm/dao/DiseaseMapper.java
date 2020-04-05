package com.yxy.ssm.dao;

import com.yxy.ssm.model.Disease;

public interface DiseaseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Disease record);

    int insertSelective(Disease record);

    Disease selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Disease record);

    int updateByPrimaryKeyWithBLOBs(Disease record);

    int updateByPrimaryKey(Disease record);
}