package com.yxy.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxy.ssm.model.Disease;
import com.yxy.ssm.service.DiseaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/disease",produces = {"application/json;charset=UTF-8"})
public class DiseaseController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    DiseaseService diseaseService;
    /*添加记录*/
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(@RequestParam Map params, HttpSession session){
        log.info("添加记录");
        try{
            params.put("user",session.getAttribute("SESSION_ID"));
            System.out.println(JSON.toJSONString(params));
            diseaseService.addDisease(params);
            return "success";
        }catch (Exception e){
            log.error(e);
            return "error";
        }
    }
    /*根据用户查找*/
    @RequestMapping(value = "/selectByUser",method = RequestMethod.GET)
    @ResponseBody
    public String selectByUser(int page,int limit,HttpSession session,@RequestParam Map params){
        log.info("根据用户查找");
        try{
            System.out.println("page="+page+",limit="+limit);
            System.out.println(JSON.toJSONString(params));
            JSONObject result = new JSONObject();
            params.put("user",session.getAttribute("SESSION_ID"));
            List<Map<Object,Object>> list = diseaseService.selectByUser(page,limit,params);
            result.put("code",0);
            result.put("msg","");
            List<Map<Object,Object>> list1 = diseaseService.selectByUser(1,9999,params);
            int count = list1.size();
            result.put("count",count);
            result.put("data",list);
            System.out.println(JSON.toJSONString(result));
            return result.toString();
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*查询病史详情*/
    @RequestMapping(value = "/getDetail",method = RequestMethod.GET)
    @ResponseBody
    public String getDetail(Integer id, HttpSession session){
        log.info("查询病史详情");
        try{
            Disease d = diseaseService.selectById(id);
            session.setAttribute("disease",d);
            System.out.println(d.getTitle());
            return null;
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*删除*/
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public void delete(@RequestParam Integer id){
        log.info("删除");
        try{
            diseaseService.delete(id);
        }catch (Exception e){
            log.error(e);
        }
    }
}
