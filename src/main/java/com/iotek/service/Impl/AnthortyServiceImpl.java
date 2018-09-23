package com.iotek.service.Impl;

import com.iotek.dao.AnthortyDao;
import com.iotek.dao.RoleAnthortyDao;
import com.iotek.entity.Anthorty;
import com.iotek.service.AnthortyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AnthortyServiceImpl implements AnthortyService {
    @Autowired
    private AnthortyDao anthortyDao;
    @Autowired
    private RoleAnthortyDao roleAnthortyDao;

    @Override
    public List<Anthorty> showAllAnthorty() {
        return anthortyDao.queryAllAnthorty();
    }

    @Override
    public List<Anthorty> showAllParent() {
        return anthortyDao.queryAllParent();

    }

    @Override
    public Map<Anthorty, List<Anthorty>> showAnthortyMap() {
        Map<Anthorty, List<Anthorty>> anthortyMap = new TreeMap<>(new Comparator<Anthorty>() {
            @Override
            public int compare(Anthorty o1, Anthorty o2) {
                return o1.getAnthortyId()-o2.getAnthortyId();
            }
        });
        List<Anthorty> allAnthorty = showAllAnthorty();
        for (int i = 0; i < allAnthorty.size(); i++) {
            Anthorty anthorty = allAnthorty.get(i);
            if (anthorty.getAnthortyPid() == 1) {
                anthortyMap.put(anthorty, new ArrayList<Anthorty>());
            } else {
                for (Anthorty parent : anthortyMap.keySet()) {
                    if (parent.getAnthortyId() == anthorty.getAnthortyPid()) {
                        anthortyMap.get(parent).add(anthorty);
                    }
                }
            }
        }
        return anthortyMap;
    }

    @Override
    public Anthorty showAnthortyById(Integer anthortyId) {
        return anthortyDao.queryAnthortyId(anthortyId);
    }

    @Override
    public List<Anthorty> showAnthortyByRoleId(Integer roleId) {
        return anthortyDao.queryAnthortyByRoleId(roleId);

    }

    @Override
    public Integer updateAnthortyById(Anthorty anthorty) {
        return anthortyDao.update(anthorty);
    }

    @Override
    public Integer addAnthorty(Anthorty anthorty) {
        return anthortyDao.addAnthorty(anthorty);
    }

    @Override
    public Integer deleteAnthorty(Anthorty anthorty) {
        return anthortyDao.deleteAnthorty(anthorty);
    }

    @Override
    public Integer addAnthortyAndRole(Integer roleId, int[] anthortyId) {
        Integer deleteAnthortyByRoleId = roleAnthortyDao.deleteAnthortyByRoleId(roleId);
        Integer addeAnthortyAndRole = 0;
        for (int i : anthortyId) {
            addeAnthortyAndRole = roleAnthortyDao.addeAnthortyAndRole(roleId, i);
        }
        Integer result = 0;
        if (addeAnthortyAndRole>0&&deleteAnthortyByRoleId>0){
            result=1;
        }
        return result;
    }
}