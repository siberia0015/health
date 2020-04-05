package com.yxy.ssm.utils;

import java.util.*;

/**
 * Created by huhu on 2018/8/9.
 */
public class Page2<T> {
    private T data;
    private Map added;
    private Integer totalCount;
    private Integer totalPage;
    private Integer pageSize;
    private Integer currentPage;
    private Integer pageDataMultiple = 1;
    private Range range;

    private class Range{
        private int start;
        private int end;

        protected Range(){
            //  计算总页数
            double d = Math.ceil(totalCount / Double.valueOf(pageSize.toString()));
            totalPage = (int) d;
            //  分页
            if (totalCount > pageSize) {
                start = (currentPage - 1) * pageSize;
                end = start + pageSize * pageDataMultiple - 1;
                if (end > totalCount) {
                    end = totalCount - 1;
                }
            }
        }

        public int getStart() {
            return start;
        }

        public int getEnd() {
            return end;
        }
    }

    public Page2(T data, Object currentPage, Object pageSize) throws Exception{
        this(data, currentPage, pageSize, false, 1);
    }

    public Page2(T data, Object currentPage, Object pageSize, boolean rangeOnly) throws Exception {
        this(data, currentPage, pageSize, rangeOnly, 1);
    }

    public Page2(T data, Object currentPage, Object pageSize, int pageDataMultiple) throws Exception {
        this(data, currentPage, pageSize, false, pageDataMultiple);
    }

    public Page2(T data, Object currentPage, Object pageSize, boolean rangeOnly, int pageDataMultiple) throws Exception{
        this.data = data;
        if (!checkType()) return;
        try {
            this.pageDataMultiple = pageDataMultiple;
            this.currentPage = Integer.parseInt(currentPage.toString());
            this.pageSize = Integer.parseInt(pageSize.toString());
            if (data instanceof List){
                this.totalCount = ((List) data).size();
            }else if (data instanceof LinkedHashMap){
                this.totalCount = ((LinkedHashMap) data).size();
            }
        }catch (Exception e){
            System.out.println(Page.class + ": " + e);
        }

        //  不做操作
        if (this.pageSize == null || this.pageSize == 0) return;

        range = new Range();

        if (rangeOnly || range.getEnd() == 0) return;

        if (data instanceof List){
            getList(range);
        }else if (data instanceof LinkedHashMap){
            getMap(range);
        }
    }

    private void getList(Range range){
        data = (T) ((List) data).subList(range.getStart(), range.getEnd() + 1);
    }

    private void getMap(Range range){
        try {
            T newData = (T) data.getClass().newInstance();
            Iterator<Map.Entry<String, LinkedHashMap<String, T>>> iterator = ((LinkedHashMap) data).entrySet().iterator();
            int index = 0;
            while (iterator.hasNext()){
                Map.Entry<String, LinkedHashMap<String, T>> data = iterator.next();
                if (index >= range.getStart()){
                    ((LinkedHashMap) newData).put(data.getKey(), data.getValue());
                }
                if (index >= range.getEnd()) break;
            }
            data = newData;
        }catch (InstantiationException ie){
            ie.printStackTrace();
        }catch (IllegalAccessException ile){
            ile.printStackTrace();
        }
    }


    private boolean checkType(){
        if (data instanceof List || data instanceof LinkedHashMap){
            return true;
        }else {
            return false;
        }
    }

    public Page2<T> setData(T data) {
        this.data = data;
        return this;
    }

    public void addAdded(Object key, Object value){
        if (added == null) added = new HashMap();
        added.put(key, value);
    }

    public T getData() {
        return data;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public Range getRange() {
        return range;
    }

    public Map getAdded() {
        return added;
    }
}
