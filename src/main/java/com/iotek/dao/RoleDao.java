package com.iotek.dao;


import com.iotek.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    public abstract List<Role> queryAllRole();
    public abstract Role queryRoleByRoleId(Integer roleId);
    public abstract Integer deleteRoleByRoleId(Integer roleId);
    public abstract Integer addRole(Role role);
    public abstract Integer updateRole(Role role);
    public abstract List<Role> queryRole(Role role);
}
