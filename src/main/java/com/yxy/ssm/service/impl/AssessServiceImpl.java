package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.AssessMapper;
import com.yxy.ssm.service.AssessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AssessServiceImpl implements AssessService {
    @Autowired
    AssessMapper assessMapper;
    @Override
    public List<Map<Object,Object>> selectByHospital(int page, int limit, Map params){
        int start = (page-1)*limit;
        params.put("start",start);
        params.put("limit",limit);
        List<Map<Object, Object>> assessList = assessMapper.selectByHospital(params);
        return assessList;
    }
    @Override
    public void add(Map params){
        assessMapper.add(params);
    }
    @Override
    public void agree(Map params){
        assessMapper.setAgree(params);
        Integer id = (Integer) params.get("id");
        assessMapper.agree(id);
    }
    @Override
    public boolean checkAgree(Map params){
        if(assessMapper.checkAgree(params)>=1){
            return false;
        }else{
            return true;
        }
    }
    @Override
    public void disagree(Map params){
        assessMapper.setDisagree(params);
        Integer id = (Integer) params.get("id");
        assessMapper.disagree(id);
    }
    @Override
    public boolean checkDisagree(Map params){
        if(assessMapper.checkDisagree(params)>=1){
            return false;
        }else{
            return true;
        }
    }
}
