package com.yxy.ssm.service;

import java.util.List;
import java.util.Map;

public interface AssessService {
    List<Map<Object,Object>> selectByHospital(int page, int limit, Map params);
    void add(Map params);
    void agree(Map params);
    boolean checkAgree(Map params);
    void disagree(Map params);
    boolean checkDisagree(Map params);

}
