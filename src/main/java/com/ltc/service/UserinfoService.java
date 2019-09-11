package com.ltc.service;

import com.ltc.pojo.Userinfo;

import java.util.List;

public interface UserinfoService {
    //登录方法
    Userinfo login(Userinfo user);
    //查询所有信息
    List<Userinfo> finduser(Userinfo user);
    //查询账号存在
    Userinfo finduserbyname(Userinfo user);
    //注册方法
    int zhuce(Userinfo user);
    //修改密码
    int gaimi(Userinfo user);
    //删除用户
    int delbyid(Integer ids);
    //修改信息
    int upuserlog(Userinfo user);
    //ID查询
    Userinfo findbyid(Integer ids);
}
