package com.ltc.mapper;


import com.ltc.pojo.Userinfo;
import org.springframework.stereotype.Repository;

@Repository("usermapper")
public interface UserinfoMapper {
   Userinfo login(Userinfo user);

}
