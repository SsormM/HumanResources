package com.iotek.service;

import com.iotek.entity.Role;

import java.util.List;

public interface RoleService {
    public abstract List<Role> showRoleList();
    public abstract Role showRoleById(Integer roleId);
    public abstract Integer deleteRoleById(Integer roleId) throws Exception;
    public abstract Integer addRole(Role role);
    public abstract Integer updateRole(Role role);
    public abstract List<Role> findRole(Role role);

}