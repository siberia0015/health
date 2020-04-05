package com.yxy.ssm.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by huhu on 2018/12/10.
 */
public class Common {
    /**
     * 过滤列表中某项不存在的数据，相似匹配，一般用于mybatis自查询后还需要模糊匹配
     * @param data  列表数据
     * @param field 字段名称
     * @param s 字段匹配的值
     * @param <E>   模型类
     * @param <L>   某种List
     * @return  data类型的数据
     * @throws NoSuchFieldException 字段不存在
     * @throws IllegalAccessException   字段不可开放
     * @throws InstantiationException   类不可实例化
     */
    public static <E, L extends List<E>> L like(L data, String field, String s) throws NoSuchFieldException, IllegalAccessException, InstantiationException{
        if (s == null) return data;
        Class l = data.getClass();
        List<E> returnL = (L) l.newInstance();
        Class c = null;
        for (E e : data){
            if (c == null) c = e.getClass();
            Field f = c.getDeclaredField(field);
            if (like(f, e, s)){
                returnL.add(e);
            }
        }
        return (L) returnL;
    }

    /**
     * 过滤列表中某项不存在的数据，相似匹配，一般用于mybatis自查询后还需要模糊匹配
     * @param data  列表数据
     * @param fields 字段名称和匹配的值
     * @param <E>   模型类
     * @param <L>   某种List
     * @return  data类型的数据
     * @throws NoSuchFieldException 字段不存在
     * @throws IllegalAccessException   字段不可开放
     * @throws InstantiationException   类不可实例化
     */
    public static <E, L extends List<E>> L like(L data, Map<String, String> fields) throws NoSuchFieldException, IllegalAccessException, InstantiationException{
        if (fields == null) return data;
        Class l = data.getClass();
        List<E> returnL = (L) l.newInstance();
        Class c = null;
        Set<String> keys = fields.keySet();
        for (E e : data){
            if (c == null) c = e.getClass();
            boolean like = true;
            for (String field : keys){
                String s = fields.get(field);
                Field f = c.getDeclaredField(field);
                if (!(like = Common.like(f, e, s))) break;
            }
            if (like) returnL.add(e);
        }
        return (L) returnL;
    }

    private static boolean like(Field f, Object o, String s) throws IllegalAccessException{
        f.setAccessible(true);
        Object value = f.get(o);
        f.setAccessible(false);
        if (value == null) return false;
        if (value instanceof String){
            if (((String) value).indexOf(s) != -1) return true;
            else return false;
        } else {
            return false;
        }
    }

    /**
     * 假删时根据dis获得对应类的list
     * @param ids   输入的id数组
     * @param cls   转换的模型类
     * @param field 字段名称
     * @param value 字段值
     * @param <T>   模型类
     * @return  获得对应类的list
     * @throws NoSuchFieldException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public static <T> List<T> getIdsForUpdateFlag(List ids, Class<T> cls, String field, Object value) throws NoSuchFieldException, InstantiationException, IllegalAccessException{
        List<T> tList = new ArrayList<>();
        for (Object id : ids){
            T t = cls.newInstance();
            Field f = cls.getDeclaredField(field);
            f.setAccessible(true);
            f.set(t, value);
            f.setAccessible(false);
            f = cls.getDeclaredField("id");
            f.setAccessible(true);
            f.set(t, id);
            f.setAccessible(false);
            tList.add(t);
        }
        return tList;
    }

    /**
     * * 假删时根据dis获得对应类的list
     * @param ids   输入的id数组
     * @param cls   转换的模型类
     * @param field 字段名称
     * @param <T>
     * @return
     * @throws NoSuchFieldException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public static <T> List<T> getIdsForUpdateFlag(List ids, Class<T> cls, String field) throws NoSuchFieldException, InstantiationException, IllegalAccessException{
        return getIdsForUpdateFlag(ids, cls, field, 1);
    }

    /**
     * 假删时根据dis获得对应类的list
     * @param ids   输入的id数组
     * @param cls   转换的模型类
     * @param <T>
     * @return
     * @throws NoSuchFieldException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public static <T> List<T> getIdsForUpdateFlag(List ids, Class<T> cls) throws NoSuchFieldException, InstantiationException, IllegalAccessException{
        return getIdsForUpdateFlag(ids, cls, "flag");
    }


}
