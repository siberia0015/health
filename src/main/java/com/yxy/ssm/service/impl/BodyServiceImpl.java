package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.BodyMapper;
import com.yxy.ssm.model.Body;
import com.yxy.ssm.service.BodyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.rmi.server.InactiveGroupException;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class BodyServiceImpl implements BodyService {
    @Autowired
    private BodyMapper bodyMapper;
    @Override
    public Body selectByUser(Integer userid){
        Body body = bodyMapper.selectByUser(userid);
        return body;
    }
    @Override
    public void addOriginInfo(Integer userid){
        bodyMapper.addOriginInfo(userid);
    }
    @Override
    public void updateByUser(Integer userid, Map params){
        params.put("userid",userid);
        bodyMapper.updateByUser(params);
    }
}
