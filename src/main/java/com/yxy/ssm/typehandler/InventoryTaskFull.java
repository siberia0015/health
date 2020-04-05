package com.yxy.ssm.typehandler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InventoryTaskFull extends BaseTypeHandler {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, Object o, JdbcType jdbcType) throws SQLException {

    }

    @Override
    public Object getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return resultSet.wasNull() ? null : resultSet.getDate(s);
    }

    @Override
    public Object getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return null;
    }

    @Override
    public Object getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return null;
    }
}
