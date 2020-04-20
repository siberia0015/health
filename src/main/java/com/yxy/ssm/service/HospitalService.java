package com.yxy.ssm.service;

import com.yxy.ssm.model.Hospital;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HospitalService {
    List<Map<Object,Object>> selectByPlace(int page,int limit,Map params);
    Hospital selectById(Integer id);
}
