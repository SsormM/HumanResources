package com.iotek.service.Impl;

import com.iotek.dao.UserDao;
import com.iotek.entity.Role;
import com.iotek.entity.User;
import com.iotek.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public User login(User user) {
        return userDao.queryUserByNameAndPassword(user);
    }

    @Override
    public List<User> showUserList() {
        return userDao.queryAllUser();
    }

    @Override
    public User showUserById(Integer userId) {
        return userDao.queryUserById(userId);
    }

    @Override
    public Integer updateUserRole(User user, Role role) {
        Integer userId = user.getuId();
        Integer roleId = role.getRoleId();
        return userDao.updateUserRole(userId, roleId);
    }

}