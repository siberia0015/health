package com.yxy.ssm.service;

import com.yxy.ssm.model.Body;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface BodyService {
    Body selectByUser(Integer userid);
    void addOriginInfo(Integer userid);
    void updateByUser(Integer userid, Map params);
}
