package com.iotek.dao;

import com.iotek.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    public abstract User queryUserByNameAndPassword(User user);

    public abstract Integer deleteUserByRoleId(Integer roleId);

    public abstract List<User> queryAllUser();

    public abstract User queryUserById(Integer userId);

    public abstract Integer updateUserRole(@Param("userId") Integer userId, @Param("roleId") Integer roleId);
}