package com.yxy.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }
    @GetMapping(value = "to/{path}")
    public String to(@PathVariable String path){
        return path/*+"/index"*/;
    }
}
