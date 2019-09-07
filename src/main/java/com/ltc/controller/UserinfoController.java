package com.ltc.controller;

import com.ltc.pojo.Userinfo;
import com.ltc.service.UserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserinfoController {
    @Autowired
    private UserinfoService userinfoService;

    @RequestMapping("/")
    public String indexPage(){
        return "login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String loginUser(Userinfo user, HttpSession session){
        Userinfo loginuser = userinfoService.login(user);
        if (null != loginuser) {
            session.setAttribute("loginuser" ,loginuser);
            return "yes";
        }else {
            return null;
        }
    }
    @RequestMapping("/zhuce")
    public String zhucePage(){
        return null;
    }
}
