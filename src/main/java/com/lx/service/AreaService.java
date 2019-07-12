package com.lx.service;

import com.lx.entry.Area;

import java.util.List;

public interface AreaService {
    List<Area> selectAllArea();

    List<Area> getCityById(int id);

    List<Area> getCountry(int id);
}
