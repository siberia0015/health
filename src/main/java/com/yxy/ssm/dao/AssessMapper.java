package com.yxy.ssm.dao;

import com.yxy.ssm.model.Assess;

import java.util.List;
import java.util.Map;

public interface AssessMapper {
    List<Map<Object,Object>> selectByHospital(Map params);
    void add(Map params);

    void agree(Integer id);
    void setAgree(Map params);
    Integer checkAgree(Map params);
    void disagree(Integer id);
    void setDisagree(Map params);
    Integer checkDisagree(Map params);

    int deleteByPrimaryKey(Integer id);

    int insert(Assess record);

    int insertSelective(Assess record);

    Assess selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Assess record);

    int updateByPrimaryKeyWithBLOBs(Assess record);

    int updateByPrimaryKey(Assess record);
}