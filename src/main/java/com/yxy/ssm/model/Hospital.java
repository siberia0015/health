package com.yxy.ssm.model;

public class Hospital {
    private Integer id;

    private String name;

    private Integer place;

    private String information;

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

    public Integer getPlace() {
        return place;
    }

    public void setPlace(Integer place) {
        this.place = place;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information == null ? null : information.trim();
    }
}