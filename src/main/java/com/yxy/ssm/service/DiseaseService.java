package com.yxy.ssm.service;

import com.yxy.ssm.model.Disease;

import java.util.List;
import java.util.Map;

public interface DiseaseService {
    void addDisease(Map params);
    List<Map<Object,Object>> selectByUser(int page,int limit,Map params);
    Disease selectById(Integer id);
    void delete(Integer id);
}
