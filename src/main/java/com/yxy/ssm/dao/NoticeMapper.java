package com.yxy.ssm.dao;

import com.yxy.ssm.model.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    List<Map<Object,Object>> getAll(Map params);

    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);
}