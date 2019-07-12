package com.lx.service.impl;

import com.lx.dao.AreaMapper;
import com.lx.entry.Area;
import com.lx.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImp implements AreaService {
    @Autowired
    AreaMapper areaMapper;


    @Override
    public List<Area> selectAllArea() {
        List<Area> areaList = areaMapper.selectAllArea();
        return areaList;
    }

    @Override
    public List<Area> getCityById(int id) {

        return areaMapper.getCityById(id);
    }

    @Override
    public List<Area> getCountry(int id) {

        return areaMapper.getCountry(id);
    }
}
