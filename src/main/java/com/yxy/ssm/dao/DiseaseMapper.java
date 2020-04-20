package com.yxy.ssm.dao;

import com.yxy.ssm.model.Disease;

import java.util.List;
import java.util.Map;

public interface DiseaseMapper {
    List<Map<Object,Object>> selectByUser(Map params);

    void add(Map params);

    int deleteByPrimaryKey(Integer id);

    int insert(Disease record);

    int insertSelective(Disease record);

    Disease selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Disease record);

    int updateByPrimaryKeyWithBLOBs(Disease record);

    int updateByPrimaryKey(Disease record);
}