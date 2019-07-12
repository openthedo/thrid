package com.lx.dao;

import com.lx.entry.Area;

import java.util.List;

public interface AreaMapper {
    List<Area> selectAllArea();

    List<Area> getCityById(int id);

    List<Area> getCountry(int id);
}
