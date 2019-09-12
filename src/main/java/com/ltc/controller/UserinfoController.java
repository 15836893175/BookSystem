package com.ltc.controller;

import com.ltc.pojo.Userinfo;
import com.ltc.service.UserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    @ResponseBody
    public String zhucePage(Userinfo user){
        Userinfo finduser = userinfoService.finduserbyname(user);
        if (finduser == null) {
            return "yes";
        }
        return null;
    }
    @RequestMapping("/zhuceuser")
    @ResponseBody
    public String zhuceuserPage(Userinfo user){
        int zhuuser = userinfoService.zhuce(user);
        if (zhuuser == 0) {
            return null;
        }else {
            return "yes";
        }
    }
    @RequestMapping("/finduser")
    public String finduserPage(Userinfo user, Model model){
        List<Userinfo> userlist = userinfoService.finduser(user);
        model.addAttribute("userlist",userlist);
        return "systempage";
    }
    @RequestMapping("/gaimiurl")
    @ResponseBody
    public String gaimiPage(Userinfo user){
        int gaimi = userinfoService.gaimi(user);
        if (gaimi == 0) {
            return null;
        }else {
            return "yes";
        }
    }
    @RequestMapping("/deleteuser")
    public String deletePage(Integer ids){
        System.out.println("执行删除");
        int delbyid = userinfoService.delbyid(ids);
        if (delbyid == 0) {
            return null;
        }else {
            return "forward:/finduser";
        }
    }
    @RequestMapping("/findbyid")
    @ResponseBody
    public Userinfo findidPage(Integer ids){
        Userinfo findfromuser = userinfoService.findbyid(ids);
        if (findfromuser == null) {
            return null;
        }else {
            return findfromuser;
        }
    }
}
