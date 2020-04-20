package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.HospitalMapper;
import com.yxy.ssm.model.Hospital;
import com.yxy.ssm.service.HospitalService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HospitalServiceImpl implements HospitalService {
    @Autowired
    HospitalMapper hospitalMapper;
    @Override
    public List<Map<Object,Object>> selectByPlace(int page,int limit,Map params){
        int start = (page-1)*limit;
        params.put("start",start);
        params.put("limit",limit);
        List<Map<Object, Object>> hospitalList = hospitalMapper.selectByPlace(params);
        return hospitalList;
    }
    @Override
    public Hospital selectById(Integer id){
        return hospitalMapper.selectByPrimaryKey(id);
    }
}
