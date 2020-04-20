package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.DiseaseMapper;
import com.yxy.ssm.model.Disease;
import com.yxy.ssm.service.DiseaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DiseaseServiceImpl implements DiseaseService {
    @Autowired
    DiseaseMapper diseaseMapper;

    @Override
    public void addDisease(Map params) {
        diseaseMapper.add(params);
    }

    @Override
    public List<Map<Object, Object>> selectByUser(int page, int limit, Map params) {
        int start = (page - 1) * limit;
        params.put("start", start);
        params.put("limit", limit);
        return diseaseMapper.selectByUser(params);
    }

    @Override
    public Disease selectById(Integer id) {
        return diseaseMapper.selectByPrimaryKey(id);
    }

    @Override
    public void delete(Integer id) {
        diseaseMapper.deleteByPrimaryKey(id);
    }
}
