package com.yxy.ssm.service;

import com.yxy.ssm.model.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    List<Map<Object,Object>> getAll(int page,int limit);
    Notice selectById(Integer id);
}
