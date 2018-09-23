package com.iotek.service;

import com.iotek.entity.Anthorty;

import java.util.List;
import java.util.Map;


public interface AnthortyService {

   public abstract List<Anthorty> showAllAnthorty();
   public abstract List<Anthorty> showAllParent();
   public abstract Map<Anthorty,List<Anthorty>> showAnthortyMap();
   public abstract Anthorty showAnthortyById(Integer anthortyId);
   public abstract List<Anthorty> showAnthortyByRoleId(Integer roleId);
   public abstract Integer updateAnthortyById(Anthorty anthorty);
   public abstract Integer addAnthorty(Anthorty anthorty);
   public abstract Integer deleteAnthorty(Anthorty anthorty);
   public abstract Integer addAnthortyAndRole(Integer roleId, int[] anthortyId);

}