package com.yxy.ssm.model;

public class Assess {
    private Integer id;

    private Integer user;

    private Boolean anony;

    private Integer rank;

    private Integer agree;

    private Integer disagree;

    private Boolean flag;

    private String information;

    private Integer hospital;

    public Integer getHospital() {
        return hospital;
    }

    public void setHospital(Integer hospital) {
        this.hospital = hospital;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public Boolean getAnony() {
        return anony;
    }

    public void setAnony(Boolean anony) {
        this.anony = anony;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getAgree() {
        return agree;
    }

    public void setAgree(Integer agree) {
        this.agree = agree;
    }

    public Integer getDisagree() {
        return disagree;
    }

    public void setDisagree(Integer disagree) {
        this.disagree = disagree;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information == null ? null : information.trim();
    }
}