package com.lx.controller;

import com.lx.entry.Area;
import com.lx.service.impl.AreaServiceImp;
import com.lx.utils.JedisClient;
import com.lx.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AreaController {
    @Autowired
    AreaServiceImp areaServiceImp;

    @Autowired
    JedisClient jedisClient;

    @RequestMapping("/provinceServlet")
    @ResponseBody
    public List<Area> provin() {

        List<Area> areaList = null;
        Boolean isExites = jedisClient.exists("PROVINCE");
        if (isExites) {
            String provinceJson = jedisClient.get("PROVINCE");
            areaList = JsonUtils.jsonToList(provinceJson, Area.class);
        } else {
            areaList =  areaServiceImp.selectAllArea();
            jedisClient.set("PROVINCE",JsonUtils.objectToJson(areaList));
        }
        return areaList;
    }

    @RequestMapping("/getCity")
    @ResponseBody
    public List<Area> getCity(int id) {

        return areaServiceImp.getCityById(id);
    }

    @RequestMapping("/getCountry")
    @ResponseBody
    public List<Area> getCountry(int id) {

        return areaServiceImp.getCountry(id);
    }
}
