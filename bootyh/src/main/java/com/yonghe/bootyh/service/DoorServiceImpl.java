package com.yonghe.bootyh.service;

import com.yonghe.bootyh.mapper.DoorMapper;
import com.yonghe.bootyh.pojo.Door;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/29 14:49
 * @description
 */
@Service
public class DoorServiceImpl implements DoorService{
    @Autowired(required = false)
    private DoorMapper dr;

    @Override
    public List<Door> findAll() {
        return dr.findAll();
    }

    @Override
    public void addDoor(Door door) {
        dr.addDoor(door);
    }

    @Override
    public void deleteById(Integer id) {
        dr.deleteById(id);
    }

    @Override
    public void updateById(Door door) {
        dr.updateById(door);
    }

    @Override
    public Door findById(Integer id) {
        return dr.findById(id);
    }
}
