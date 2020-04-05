package com.yxy.ssm.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HospitalService {
    List<Map<Object,Object>> selectByPlace(Map place);
}
