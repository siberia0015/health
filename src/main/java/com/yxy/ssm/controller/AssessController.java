package com.yxy.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxy.ssm.service.AssessService;
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

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping(value = "/assess",produces = {"application/json;charset=UTF-8"})
public class AssessController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    AssessService assessService;
    /*根据医院查询评价*/
    @RequestMapping(value = "/getByHospital",method = GET)
    @ResponseBody
    public String getByHospital(int page, int limit, HttpSession session){
        log.info("根据医院查询评价");
        try {
            System.out.println("page="+page+",limit="+limit);
            JSONObject result = new JSONObject();
            Map<String,Object> params = new HashMap();
            System.out.println(session.getAttribute("hospital_id"));
            params.put("hospital",session.getAttribute("hospital_id"));
            List<Map<Object,Object>> list = assessService.selectByHospital(page,limit,params);
            result.put("code",0);
            result.put("msg","");
            List<Map<Object,Object>> list1 = assessService.selectByHospital(1,9999,params);
            int count = list1.size();
            result.put("count",count);
            result.put("data",list);
            return result.toString();
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*点赞*/
    @RequestMapping(value = "/agree",method = GET)
    public void agree(Integer id,HttpSession session){
        log.info("点赞");
        try{
            Map params = new HashMap();
            params.put("id",id);
            params.put("userid",session.getAttribute("SESSION_ID"));
            if(assessService.checkAgree(params)){
                assessService.agree(params);
            }
        }catch (Exception e){
            log.error(e);
        }
    }
    /*点赞*/
    @RequestMapping(value = "/disagree",method = GET)
    public void disagree(Integer id,HttpSession session){
        log.info("反对");
        try{
            Map params = new HashMap();
            params.put("id",id);
            params.put("userid",session.getAttribute("SESSION_ID"));
            if(assessService.checkDisagree(params)){
                assessService.disagree(params);
            }
        }catch (Exception e){
            log.error(e);
        }
    }
    /*添加评价*/
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(@RequestParam Map params,HttpSession session){
        log.info("添加评价");
        try{
            params.put("user",session.getAttribute("SESSION_ID"));
            params.put("hospital",session.getAttribute("hospital_id"));
            System.out.println(JSON.toJSONString(params));
            assessService.add(params);
            return "success";
        }catch (Exception e){
            log.error(e);
            return "error";
        }

    }
}
