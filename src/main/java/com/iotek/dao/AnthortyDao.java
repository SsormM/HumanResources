package com.iotek.dao;

import com.iotek.entity.Anthorty;

import java.util.List;

public interface AnthortyDao {

    public abstract List<Anthorty> queryAllAnthorty();
    public abstract List<Anthorty> queryAllParent();
    public abstract Anthorty queryAnthortyId(Integer anthortyId);
    public abstract Integer update(Anthorty anthorty);
    public abstract Integer addAnthorty(Anthorty anthorty);
    public abstract Integer deleteAnthorty(Anthorty anthorty);
    public abstract List<Anthorty> queryAnthortyByRoleId(Integer roleId);

}