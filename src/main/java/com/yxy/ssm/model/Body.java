package com.yxy.ssm.model;

import java.util.Date;

public class Body {
    private Integer id;

    private Integer user;

    private Double weight;

    private Double goalweight;

    private Date goalweightdate;

    private Double height;

    private Double bust;

    private Double waist;

    private Double hip;

    private String blood;

    private String pressure;

    private String suger;

    private String fat;

    private String pulse;

    private Double lefteye;

    private Double righteye;

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

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getGoalweight() {
        return goalweight;
    }

    public void setGoalweight(Double goalweight) {
        this.goalweight = goalweight;
    }

    public Date getGoalweightdate() {
        return goalweightdate;
    }

    public void setGoalweightdate(Date goalweightdate) {
        this.goalweightdate = goalweightdate;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Double getBust() {
        return bust;
    }

    public void setBust(Double bust) {
        this.bust = bust;
    }

    public Double getWaist() {
        return waist;
    }

    public void setWaist(Double waist) {
        this.waist = waist;
    }

    public Double getHip() {
        return hip;
    }

    public void setHip(Double hip) {
        this.hip = hip;
    }

    public String getBlood() {
        return blood;
    }

    public void setBlood(String blood) {
        this.blood = blood == null ? null : blood.trim();
    }

    public String getPressure() {
        return pressure;
    }

    public void setPressure(String pressure) {
        this.pressure = pressure == null ? null : pressure.trim();
    }

    public String getSuger() {
        return suger;
    }

    public void setSuger(String suger) {
        this.suger = suger == null ? null : suger.trim();
    }

    public String getFat() {
        return fat;
    }

    public void setFat(String fat) {
        this.fat = fat == null ? null : fat.trim();
    }

    public String getPulse() {
        return pulse;
    }

    public void setPulse(String pulse) {
        this.pulse = pulse == null ? null : pulse.trim();
    }

    public Double getLefteye() {
        return lefteye;
    }

    public void setLefteye(Double lefteye) {
        this.lefteye = lefteye;
    }

    public Double getRighteye() {
        return righteye;
    }

    public void setRighteye(Double righteye) {
        this.righteye = righteye;
    }
}