package com.yxy.ssm.service;

import com.yxy.ssm.model.Record;

import java.util.Map;

public interface RecordService {
    Record selectByDate(Map params);
    void addRecord(Map params,Integer userid);

}
