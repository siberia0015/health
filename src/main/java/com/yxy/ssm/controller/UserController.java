package com.yxy.ssm.controller;

import com.yxy.ssm.model.User;
import com.yxy.ssm.service.UserService;
import com.yxy.ssm.utils.MemoryData;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping(value = "user",produces = {"application/json;charset=UTF-8"})
public class UserController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    UserService userService;
    /*登陆*/
    @RequestMapping(value = "login",method = RequestMethod.POST)
    //@ResponseBody作用其实是将java对象转为json格式的数据
    public String login(@RequestParam Map params, HttpSession session){
        log.info("登陆");
        try{
            User user = userService.login(params);
            if (user == null){
                return "error";
            } else {
                HttpSession oldSession = MemoryData.getSessionMap(user.getUserid().toString());
                if (oldSession != null) {
                    logout(oldSession);
                }
                session.setAttribute("userInfo", user);
                session.setAttribute("SESSION_USERNAME", user.getUsername());
                session.setAttribute("SESSION_ID", user.getUserid());
                MemoryData.setSessionMap(user.getUserid().toString(), session);
                return "home";
            }
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*注册*/
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(@RequestParam Map params, HttpSession session){
        log.info("注册");
        try{
            User user = userService.register(params);
            if (user == null){
                return "registFail";
            } else {
                HttpSession oldSession = MemoryData.getSessionMap(user.getUserid().toString());
                if (oldSession != null) {
                    logout(oldSession);
                }
                session.setAttribute("userInfo", user);
                session.setAttribute("SESSION_USERNAME", user.getUsername());
                session.setAttribute("SESSION_ID", user.getUserid());
                MemoryData.setSessionMap(user.getUserid().toString(), session);
                return "registSuccess";
            }
        }catch (Exception e){
            log.info(e);
            return "registFail";
        }
    }
    /*登出*/
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        log.info("登出");
        User user = null;
        try {
            user = (User) session.getAttribute("userInfo");
        } catch (Exception e){
            log.info(e);
        }
        if (user != null){
            MemoryData.remove(user.getUserid().toString());
            //session.invalidate();
        }
        return "login";
    }
    /*去登陆页*/
    @RequestMapping(value = "goLogin")
    public String goLogin(){return "login";}
    /*去身体状况信息页*/
    @RequestMapping(value = "goBody")
    public String goBody(){return "body";}
    /*去医疗资源信息页*/
    @RequestMapping(value = "goMedical")
    public String goMedical(){return "medical";}
    /*去推荐信息页*/
    @RequestMapping(value = "goRecommend")
    public String goRecommend(){return "recommend";}
    /*去个人主页*/
    @RequestMapping(value = "goHome")
    public String goHome(){return "home";}
    /*去首页*/
    @RequestMapping(value = "goIndex")
    public String goIndex(){
        return "index";
    }
    /*去测试页*/
    @RequestMapping(value = "goTest")
    public String goTest(){
        return "test";
    }
}
