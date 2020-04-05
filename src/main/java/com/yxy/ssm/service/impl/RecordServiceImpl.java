package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.RecordMapper;
import com.yxy.ssm.model.Record;
import com.yxy.ssm.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordMapper recordMapper;
    @Override
    public Record selectByDate(Map params){
        return recordMapper.selectByDate(params);
    }
    @Override
    public void addRecord(Map params,Integer userid){
        params.put("user",userid);
        recordMapper.addRecord(params);
    }
}
