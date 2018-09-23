package com.iotek.dao;

import org.apache.ibatis.annotations.Param;

public interface RoleAnthortyDao {
    public abstract Integer deleteAnthortyByRoleId(Integer roleId);

    public abstract Integer addeAnthortyAndRole(@Param(value = "roleId") Integer roleId, @Param(value = "anthortyId") Integer anthortyId);

}