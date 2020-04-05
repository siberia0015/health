package com.yxy.ssm.utils.pwdUtils;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * Created by Administrator on 2018/8/22.
 */
public class MyAuthenticator extends Authenticator {

    private String username;
    private String password;

    /**
     *
     * @author panliang
     * @param username
     * @param password
     */
    public MyAuthenticator(String username, String password) {
        super();
        this.username = username;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username,password);
    }
}
