package com.yxy.ssm.dao;

import com.yxy.ssm.model.Record;

import java.util.Map;

public interface RecordMapper {
    Record selectByDate(Map params);
    void addRecord(Map params);

    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
}