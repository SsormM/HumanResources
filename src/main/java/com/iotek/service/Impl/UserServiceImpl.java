package com.iotek.service.Impl;

import com.iotek.dao.UserDao;
import com.iotek.entity.User;
import com.iotek.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public User login(User user) {
        return userDao.queryUserByNameAndPassword(user);
    }

}