package com.yxy.ssm.utils;

import org.apache.commons.lang.reflect.FieldUtils;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;

import java.util.HashMap;
import java.util.Map;

public class InterceptorType {

    private InterceptorType(){}

    public final static class Params {
        private Params(){}

        public final static long sign = 1;
        public static boolean run(MappedStatement mappedStatement, BoundSql boundSql){
            try {
                Map params = GeneralConditions.getParams();
                //  计数器
                GeneralConditions.Timer timer = null;
                if (params.get("timer") instanceof Integer){
                    timer = GeneralConditions.getTimer((Integer) params.get("timer"));
                }else if (params.get("timer") instanceof GeneralConditions.Timer){
                    timer = (GeneralConditions.Timer) params.get("timer");
                }
                if (timer != null){
                    HashMap time = timer.addMapperIdTimer(mappedStatement.getId());
                    params.put("timer", timer);
                    params.put("timerCount", time);
                }

                Map p = (Map) boundSql.getParameterObject();
                p.put("params", params);
                BoundSql newBoundSql = mappedStatement.getBoundSql(boundSql.getParameterObject());
                FieldUtils.writeField(boundSql, "sql", newBoundSql.getSql(), true);
                FieldUtils.writeField(boundSql, "parameterMappings", newBoundSql.getParameterMappings(), true);

            }catch (Exception e){
                e.printStackTrace();
                return false;
            }
            return true;
        }
    }
}

