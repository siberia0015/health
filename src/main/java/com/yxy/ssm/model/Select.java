package com.yxy.ssm.model;

public class Select {
    private Integer id;

    private String content;

    private Integer question;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getQuestion() {
        return question;
    }

    public void setQuestion(Integer question) {
        this.question = question;
    }
}