package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.NoticeMapper;
import com.yxy.ssm.model.Notice;
import com.yxy.ssm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    NoticeMapper noticeMapper;
    @Override
    public List<Map<Object,Object>> getAll(int page,int limit){
        int start = (page-1)*limit;
        Map params = new HashMap();
        params.put("start",start);
        params.put("limit",limit);
        return noticeMapper.getAll(params);
    }
    @Override
    public Notice selectById(Integer id){
        return noticeMapper.selectByPrimaryKey(id);
    }
}
