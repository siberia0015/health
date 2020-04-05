package com.yxy.ssm.utils;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Mr yu on 2017/4/27.
 */
public class MemoryData {
    private static Map<String, HttpSession> sessionMap = new HashMap<String, HttpSession>();

    public static HttpSession getSessionMap(String name){
        return sessionMap.get(name);
    }

    public static void setSessionMap(String name, HttpSession session) {
        MemoryData.sessionMap.put(name, session);
    }

    public static void remove(String name){
        sessionMap.remove(name);
    }
}
