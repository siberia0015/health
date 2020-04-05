package com.yxy.ssm.model;

import java.util.Date;

public class Record {
    private Integer id;

    private Integer user;

    private Date date;

    private Double weight;

    private Double height;

    private Double bust;

    private Double waist;

    private Double hip;

    private String pressure;

    private String suger;

    private String fat;

    private String pulse;

    private Double lefteye;

    private Double righteye;

    private String sport;

    private String food;

    private String sleep;

    private String skin;

    private String energy;

    private String pain;

    private Double temperature;

    private String spirit;

    private Double worktime;

    private String goal;

    private String tips;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
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

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport == null ? null : sport.trim();
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food == null ? null : food.trim();
    }

    public String getSleep() {
        return sleep;
    }

    public void setSleep(String sleep) {
        this.sleep = sleep == null ? null : sleep.trim();
    }

    public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin == null ? null : skin.trim();
    }

    public String getEnergy() {
        return energy;
    }

    public void setEnergy(String energy) {
        this.energy = energy == null ? null : energy.trim();
    }

    public String getPain() {
        return pain;
    }

    public void setPain(String pain) {
        this.pain = pain == null ? null : pain.trim();
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public String getSpirit() {
        return spirit;
    }

    public void setSpirit(String spirit) {
        this.spirit = spirit == null ? null : spirit.trim();
    }

    public Double getWorktime() {
        return worktime;
    }

    public void setWorktime(Double worktime) {
        this.worktime = worktime;
    }

    public String getGoal() {
        return goal;
    }

    public void setGoal(String goal) {
        this.goal = goal == null ? null : goal.trim();
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips == null ? null : tips.trim();
    }
}