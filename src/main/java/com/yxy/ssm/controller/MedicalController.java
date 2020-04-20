package com.yxy.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yxy.ssm.model.Hospital;
import com.yxy.ssm.service.HospitalService;
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
@RequestMapping(value = "/medical",produces = {"application/json;charset=UTF-8"})
public class MedicalController {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    HospitalService hospitalService;
    /*查询所有医院*/
    @RequestMapping(value = "/getAll",method = GET)
    @ResponseBody
    public String getAll(int page,int limit){
        log.info("查询所有医院");
        try{
            System.out.println("page="+page+",limit="+limit);
            JSONObject result = new JSONObject();
            Map<String,Object> params = new HashMap();
            List<Map<Object,Object>> list = hospitalService.selectByPlace(page,limit,params);
            result.put("code",0);
            result.put("msg","");
            List<Map<Object,Object>> list1 = hospitalService.selectByPlace(1,9999,params);
            int count = list1.size();
            result.put("count",count);
            result.put("data",list);
            return result.toString();
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
    /*查询医院详情*/
    @RequestMapping(value = "/getDetail",method = GET)
    @ResponseBody
    public String getDetail(Integer id, HttpSession session){
        try{
            Hospital h = hospitalService.selectById(id);
            session.setAttribute("hospital_id",h.getId());
            session.setAttribute("hospital",h);
            System.out.println(h.getAddress());
            return null;
        }catch (Exception e){
            log.error(e);
            return null;
        }
    }
}
