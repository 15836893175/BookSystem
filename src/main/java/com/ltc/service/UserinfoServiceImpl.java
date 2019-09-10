package com.ltc.service;

import com.ltc.mapper.UserinfoMapper;
import com.ltc.pojo.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserinfoServiceImpl implements UserinfoService{

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Override
    public Userinfo login(Userinfo user) {
        return userinfoMapper.login(user);
    }

    @Override
    public List<Userinfo> finduser(Userinfo user) {
        return userinfoMapper.finduser(user);
    }

    @Override
    public Userinfo finduserbyname(Userinfo user) {
        return userinfoMapper.finduserbyname(user);
    }

    @Override
    public int zhuce(Userinfo user) {
        return userinfoMapper.zhuce(user);
    }

    @Override
    public int gaimi(Userinfo user) {
        return userinfoMapper.gaimi(user);
    }
}
