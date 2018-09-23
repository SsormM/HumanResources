package com.iotek.service;

import com.iotek.entity.Role;
import com.iotek.entity.User;

import java.util.List;

public interface UserService {
    public abstract User login(User user);

    public abstract List<User> showUserList();

    public abstract User showUserById(Integer userId);

    public abstract Integer updateUserRole(User user, Role role);
}
