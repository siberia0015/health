package com.yxy.ssm.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huhu on 2018/8/8.
 */
public class GeneralConditions {
    private GeneralConditions(){}

    private static Timer timer;

    public static Timer getTimer(int time){
        return timer = new Timer(time);
    }
    public static class Timer{
        int time = 0;
        private HashMap<Object, HashMap> mapperId = new HashMap<Object, HashMap>();
        List<Object> mapperIdList = new ArrayList<Object>();
        HashMap<Object, Integer> mapperIdIndex = new HashMap<Object, Integer>();

        public Timer(int time){
            this.time = time;
        }

        public int getTime() {
            return time;
        }

        public HashMap getMapperIdTimer(Object id) {
            return mapperId.get(id);
        }

        public void removeMapperIdTimer(Object id){
            mapperId.remove(id);
            mapperIdList.remove(id);
            mapperIdIndex = new HashMap<Object, Integer>();
            for (int i = 0; i < mapperIdList.size(); i++){
                mapperIdIndex.put(mapperIdList.get(i), i);
            }
        }

        public HashMap addMapperIdTimer(Object id){
            if (mapperId.get(id) == null){
                HashMap<String, Object> t = new HashMap<String, Object>();
                t.put("current", time);
                mapperId.put(id, t);
                mapperIdIndex.put(id, mapperIdList.size());
                mapperIdList.add(id);
                if (mapperIdIndex.get(id) != null){
                    if (mapperIdIndex.get(id) - 1 >= 0) {
                        //  设置上一个
                        t.put("prev", mapperId.get(mapperIdList.get(mapperIdIndex.get(id) - 1)));
                        //  给上一个设置下一个
                        mapperId.get(mapperIdList.get(mapperIdIndex.get(id) - 1)).put("next", mapperId.get(id));
                    }
                }
            }else {
                mapperId.get(id).put("current", ((Integer) mapperId.get(id).get("current")) + 1);
            }
            return mapperId.get(id);
        }

    }

    public final static class Stop{
        private Stop(){}

        public final static Integer NotStop = null;
        public final static String Transport = "Transport";
        public final static String CustomerContractDetails = "CustomerContractDetails";
        public final static String Commodity = "Commodity";
        public final static String CargoInfo = "CargoInfo";
        public final static String ValuationType = "ValuationType";
        public final static String AdditionalFees = "AdditionalFees";
        public final static String SpecialSettleFactor = "SpecialSettleFactor";
        public final static String ValuationTypeValue = "ValuationTypeValue";
        public final static String AdditionalValue = "AdditionalValue";
        public final static String Employee = "Employee";
    }
    private static Map params;

    public static Map getParams() {
        return params;
    }

    public static void setParams(Map params) {
        GeneralConditions.params = params;
    }
}
