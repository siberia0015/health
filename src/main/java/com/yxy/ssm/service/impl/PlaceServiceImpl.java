package com.yxy.ssm.service.impl;

import com.yxy.ssm.dao.PlaceMapper;
import com.yxy.ssm.model.Place;
import com.yxy.ssm.service.PlaceService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class PlaceServiceImpl implements PlaceService {
    @Autowired
    private PlaceMapper placeMapper;
    @Override
    public Place getPlaceByID(Integer id){
        return placeMapper.selectByPrimaryKey(id);
    }
}
