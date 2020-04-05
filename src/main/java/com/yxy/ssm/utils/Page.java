package com.yxy.ssm.utils;

import lombok.Data;

import java.util.List;

/**
 * Created by panzx on 2017/12/22.
 */
@Data
public class Page {
    private int pageNo = 1;
    private int pageSize = 0;
    private int totalPage = 1;
    private int totalCount;
    private List data;

    public Page(Object pageNo, Object pageSize, List data) {
        this(pageNo, pageSize, 1, data);
    }

    public Page(Object pageNo, Object pageSize, Object pageDataMultiple, List data) {
        this(pageNo, pageSize, pageDataMultiple, data, data.size());
    }

    public Page(Object pageNo, Object pageSize, List data, Object totalCount) {
        this(pageNo, pageSize, 1, data, totalCount);
    }
    public Page(Object pageNo, Object pageSize, Object pageDataMultiple, List data, Object totalCount) {
        try {
            this.data = data;
            this.totalCount = Integer.parseInt(totalCount.toString());
            this.pageNo = Integer.parseInt(pageNo.toString());
            this.pageSize = Integer.parseInt(pageSize.toString());
            getPageData(Integer.parseInt(pageDataMultiple.toString()));
        }catch (Exception e){
            System.out.println(Page.class + ": " + e);
        }
    }

    private void getPageData(int pageDataMultiple){
        //  不做操作
        if (pageSize == 0) return;
        //  计算总页数
        int temp = this.totalCount % pageSize;
        if (temp == 0) {
            this.totalPage = this.totalCount / pageSize;
        } else {
            this.totalPage = this.totalCount / pageSize + 1;
        }
        //  分页
        if (this.totalCount > pageSize) {
            int start = (pageNo - 1) * pageSize;
            int end = start + pageSize * pageDataMultiple;
            if (end > this.totalCount) {
                end = this.totalCount;
            }
            this.data = this.data.subList(start, end);
        }
    }

    public int getPageNo() {
        return pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
