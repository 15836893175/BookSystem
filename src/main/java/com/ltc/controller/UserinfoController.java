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

    /*
    首页跳转方法
     */
    @RequestMapping("/")
    public String indexPage(){
        return "login";
    }

    /*
    登录验证
     */
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
    /*
    注册验证
     */
    @RequestMapping("/zhuce")
    @ResponseBody
    public String zhucePage(Userinfo user){
        Userinfo finduser = userinfoService.finduserbyname(user);
        if (finduser == null) {
            return "yes";
        }
        return null;
    }
    /*
    注册验证用户是否存在
     */
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
    /*
    查询方法
     */
    @RequestMapping("/finduser")
    public String finduserPage(Userinfo user, Model model){
        List<Userinfo> userlist = userinfoService.finduser(user);
        model.addAttribute("userlist",userlist);
        return "systempage";
    }
    /*
    修改密码
     */
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
    /*
    删除方法
     */
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
    /*
    根据ID查询
     */
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
    /*
    修改信息
     */
    @RequestMapping("/upuser")
    @ResponseBody
    public String upuserPage(Userinfo user){
        int i = userinfoService.upuserlog(user);
        if (i==0){
            System.out.println("系统错误！");
            return null;
        }else {
            return "yes";
        }
    }
}
