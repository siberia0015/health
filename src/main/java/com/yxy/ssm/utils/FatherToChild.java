package com.yxy.ssm.utils;

import java.lang.reflect.Field;

/**
 * Created by huhu on 2018/12/3.
 */
public class FatherToChild {
    public static <T, E extends T> E to(T father, Class<E> childCls) throws IllegalAccessException, InstantiationException{
        E child = childCls.newInstance();
        Class fatherCls = father.getClass();
        Field[] fields = fatherCls.getDeclaredFields();
        for (Field field : fields){
            field.setAccessible(true);
            Object value = field.get(father);
            field.set(child, value);
            field.setAccessible(false);
        }
        return child;
    }
}
