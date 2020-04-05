package com.yxy.ssm.dao;

import com.yxy.ssm.model.Hospital;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HospitalMapper {
    List<Map<Object,Object>> selectByPlace(Map params);

    int deleteByPrimaryKey(Integer id);

    int insert(Hospital record);

    int insertSelective(Hospital record);

    Hospital selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Hospital record);

    int updateByPrimaryKeyWithBLOBs(Hospital record);

    int updateByPrimaryKey(Hospital record);
}