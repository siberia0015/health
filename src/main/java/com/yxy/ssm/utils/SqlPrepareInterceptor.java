package com.yxy.ssm.utils;


import com.baomidou.mybatisplus.toolkit.PluginUtils;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import java.sql.Connection;
import java.util.Map;
import java.util.Properties;

@Intercepts({@Signature(method = "prepare", type = StatementHandler.class, args = {Connection.class, Integer.class})})
public class SqlPrepareInterceptor implements Interceptor {

    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler target = (StatementHandler) invocation.getTarget();
        StatementHandler handler = (StatementHandler) PluginUtils.realTarget(invocation.getTarget());
        MetaObject mo = SystemMetaObject.forObject(handler);
        MappedStatement mappedStatement = (MappedStatement) mo.getValue("delegate.mappedStatement");
//        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();
        //待执行的sql的包装对象
        BoundSql boundSql = target.getBoundSql();
        Object obj = boundSql.getParameterObject();
        if (obj instanceof Map){
            Map map = (Map) obj;
            try {
//                if ("SELECT".equals(sqlCommandType)){
                    if (map.get("InterceptorType") != null){
                        //  配置不同过滤器
                        if (map.get("InterceptorType").equals(InterceptorType.Params.sign)) {
                            InterceptorType.Params.run(mappedStatement, boundSql);
                        }
                    }
//                }
            }catch (Exception e){}
        }
        return invocation.proceed();
    }


    /**
     * 拦截器对应的封装原始对象的方法
     */
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    /**
     * 设置注册拦截器时设定的属性
     */
    public void setProperties(Properties properties) {
    }
}

