package com.yxy.ssm.controller;

import com.yxy.ssm.model.Body;
import com.yxy.ssm.service.BodyService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/body",produces = {"application/json;charset=UTF-8"})
public class BodyController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    BodyService bodyService;
    /*查询身体状况*/
    @RequestMapping(value = "/getInfo",method = GET)
    public String getInfo(HttpSession session){
        log.info("刷新身体状况");
        try {
            Integer userid = (Integer) session.getAttribute("SESSION_ID");
            Body body = bodyService.selectByUser(userid);
            if(body == null){
                bodyService.addOriginInfo(userid);
                body = bodyService.selectByUser(userid);
            }
            session.setAttribute("BODY_INFO", body);
            return "body";
        }catch (Exception e){
            log.error(e);
            return "error";
        }
    }
    /*修改信息*/
    @RequestMapping(value="/changeInfo",method = GET)
    public String changeInfo(HttpSession session, @RequestParam Map params){
        log.info("更改信息");
        try{
            Integer userid = (Integer) session.getAttribute("SESSION_ID");
            bodyService.updateByUser(userid,params);
            return "home";
        }catch (Exception e){
            log.error(e);
            return "error";
        }
    }
    /*返回body页*/
    @RequestMapping(value = "/goBody",method = GET)
    public String goBody(HttpSession session){
        log.info("查询身体状况");
        try {
            Integer userid = (Integer) session.getAttribute("SESSION_ID");
            Body body = bodyService.selectByUser(userid);
            if(body == null){
                bodyService.addOriginInfo(userid);
                body = bodyService.selectByUser(userid);
            }
            session.setAttribute("BODY_INFO", body);
            return "body";
        }catch (Exception e){
            log.error(e);
            return "error";
        }
    }
    /*去记录*/
    @RequestMapping(value = "/goMakeRecord",method = GET)
    public String goMakeRecord(){
        return "record";
    }
    /*去每日记录页*/
    @RequestMapping(value = "/goDailyRecord",method = GET)
    public String goDailyRecord(){return "body_dailyRecord";}
    /*去修改信息页*/
    @RequestMapping(value = "/goChangeInfo",method = GET)
    public String goChangeInfo(){
        return "body_changeInfo";
    }
}
