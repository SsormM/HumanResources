package com.iotek.dao;

import com.iotek.entity.User;

public interface UserDao {
    public abstract User queryUserByNameAndPassword(User user);
}