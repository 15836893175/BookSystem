package com.ltc.mapper;


import com.ltc.pojo.Userinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("usermapper")
public interface UserinfoMapper {
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
}
