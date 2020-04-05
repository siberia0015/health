package com.yxy.ssm.model;

import java.util.Date;

public class Topic {
    private Integer id;

    private Integer creater;

    private Integer reply;

    private String title;

    private Date createtime;

    private Date lastreplytime;

    private Boolean flag;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreater() {
        return creater;
    }

    public void setCreater(Integer creater) {
        this.creater = creater;
    }

    public Integer getReply() {
        return reply;
    }

    public void setReply(Integer reply) {
        this.reply = reply;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastreplytime() {
        return lastreplytime;
    }

    public void setLastreplytime(Date lastreplytime) {
        this.lastreplytime = lastreplytime;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}