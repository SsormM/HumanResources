package com.iotek.service.Impl;

import com.iotek.dao.RoleDao;
import com.iotek.dao.UserDao;
import com.iotek.entity.Role;
import com.iotek.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private UserDao userDao;

    @Override
    public List<Role> showRoleList() {
        return roleDao.queryAllRole();
    }

    @Override
    public Role showRoleById(Integer roleId) {
        return roleDao.queryRoleByRoleId(roleId);
    }

    @Override
    public Integer deleteRoleById(Integer roleId) throws  Exception {
        return  userDao.deleteUserByRoleId(roleId);
    }

    @Override
    public Integer addRole(Role role) {
        return roleDao.addRole(role);
    }

    @Override
    public Integer updateRole(Role role) {
        return roleDao.updateRole(role);
    }

    @Override
    public List<Role> findRole(Role role) {
        return roleDao.queryRole(role);
    }


}