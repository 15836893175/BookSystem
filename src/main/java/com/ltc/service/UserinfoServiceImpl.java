package com.ltc.service;

import com.ltc.mapper.UserinfoMapper;
import com.ltc.pojo.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserinfoServiceImpl implements UserinfoService{

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Override
    public Userinfo login(Userinfo user) {
        return userinfoMapper.login(user);
    }
}
