package com.yxy.ssm.utils;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * @author amy.guo on 2018/3/25
 */
public class MapUtil {
    public static int ObjectToInteger(String key, Map<String, Object> param) {
        return Integer.parseInt(param.get(key).toString());
    }

    /**
     * Map转Object
     *
     * @param map
     * @param clazz
     * @return
     * @throws Exception
     */
    public static Object mapToObject(Map<String, Object> map, Class<?> clazz) throws Exception {
        Object object = clazz.newInstance();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            String key = field.toString().substring(field.toString().lastIndexOf(".") + 1, field.toString().length());
            if (map.get(key) != null) {
                if (field.getType().getName().equals(Long.class.getName())) {
                    field.set(object, Long.parseLong(map.get(key).toString()));
                } else {
                    field.set(object, map.get(key));
                }
            }
        }
        return object;
    }
}
