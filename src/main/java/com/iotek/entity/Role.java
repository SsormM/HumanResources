package com.iotek.entity;

import java.util.Set;

public class Role {
    private Integer roleId;
    private String roleName;
    private String roleDesc;
    private Integer roleState;
    private Set<Anthorty> anthortySet;


    @Override
    public String toString() {
        return "Role{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", roleState=" + roleState +
                ", anthortySet=" + anthortySet +
                '}';
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public Integer getRoleState() {
        return roleState;
    }

    public void setRoleState(Integer roleState) {
        this.roleState = roleState;
    }

    public Set<Anthorty> getAnthortySet() {
        return anthortySet;
    }

    public void setAnthortySet(Set<Anthorty> anthortySet) {
        this.anthortySet = anthortySet;
    }
}