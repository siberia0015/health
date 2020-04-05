package com.yxy.ssm.model;

import java.util.Date;

public class Paper {
    private Integer id;

    private String name;

    private String illustration;

    private Integer creater;

    private Integer manager;

    private Date createdate;

    private Date begindate;

    private Date enddate;

    private Boolean flag;

    private Integer organization;

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

    public String getIllustration() {
        return illustration;
    }

    public void setIllustration(String illustration) {
        this.illustration = illustration == null ? null : illustration.trim();
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

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public Integer getOrganization() {
        return organization;
    }

    public void setOrganization(Integer organization) {
        this.organization = organization;
    }
}