package com.yxy.ssm.model;

public class Organization {
    private Integer id;

    private String name;

    private Integer creater;

    private Integer manager;

    private Boolean flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCreater() {
        return creater;
    }

    public void setCreater(Integer creater) {
        this.creater = creater;
    }

    public Integer getManager() {
        return manager;
    }

    public void setManager(Integer manager) {
        this.manager = manager;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
}