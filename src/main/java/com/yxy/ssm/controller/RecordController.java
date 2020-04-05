package com.yxy.ssm.controller;

import com.yxy.ssm.model.Record;
import com.yxy.ssm.service.RecordService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/record",produces = {"application/json;charset=UTF-8"})
public class RecordController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    RecordService recordService;
    /*添加记录*/
    @RequestMapping(value = "/add",method = GET)
    public String add(HttpSession session, @RequestParam Map params){
        log.info("添加记录");
        try{
            Integer userid = (Integer) session.getAttribute("SESSION_ID");
            Date time= new java.sql.Date(new java.util.Date().getTime());
            params.put("date",time);
            recordService.addRecord(params,userid);
            return "home";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }
    /*查询记录*/
    @RequestMapping(value = "/select",method = GET)
    public String select(HttpSession session,@RequestParam Map params){
        log.info("查询记录");
        try{
            Integer userid = (Integer) session.getAttribute("SESSION_ID");
            params.put("userid",userid);
            Record record = recordService.selectByDate(params);
            session.setAttribute("RECORD_INFO",record);
            return "record";
        }catch (Exception e){
            e.printStackTrace();
            return "error";
        }
    }
}
