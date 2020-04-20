package com.yxy.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.yxy.ssm.model.Hospital;
import com.yxy.ssm.model.Notice;
import com.yxy.ssm.service.NoticeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/notice",produces = {"application/json;charset=UTF-8"})
public class NoticeController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    NoticeService noticeService;
    /*查询所有公告*/
    @RequestMapping(value = "/getAll",method = GET)
    @ResponseBody
    public String getAll(int page,int limit){
        log.info("查询所有医院");
        try{
            System.out.println("page="+page+",limit="+limit);
            JSONObject result = new JSONObject();
            Map<String,Object> params = new HashMap();
            //params.put("place",2);
            List<Map<Object,Object>> list = noticeService.getAll(page,limit);
            result.put("code",0);
            result.put("msg","");
            List<Map<Object,Object>> list1 = noticeService.getAll(1,9999);
            int count = list1.size();
            result.put("count",count);
            result.put("data",list);
            return result.toString();
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*查询公告详情*/
    @RequestMapping(value = "/getDetail",method = GET)
    @ResponseBody
    public String getDetail(Integer id, HttpSession session){
        try{
            Notice n = noticeService.selectById(id);
            session.setAttribute("notice",n);
            System.out.println(n.getContent());
            return null;
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
}
