package com.yxy.ssm.model;

public class Answer {
    private Integer id;

    private Integer user;

    private Integer select;

    private String answer;

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

    public Integer getSelect() {
        return select;
    }

    public void setSelect(Integer select) {
        this.select = select;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }
}