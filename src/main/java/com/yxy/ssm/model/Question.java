package com.yxy.ssm.model;

public class Question {
    private Integer id;

    private String name;

    private Integer paper;

    private String type;

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

    public Integer getPaper() {
        return paper;
    }

    public void setPaper(Integer paper) {
        this.paper = paper;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
}