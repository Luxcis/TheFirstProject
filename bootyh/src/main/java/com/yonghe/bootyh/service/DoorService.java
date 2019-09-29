package com.yonghe.bootyh.service;

import com.yonghe.bootyh.pojo.Door;

import java.util.List;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/29 14:45
 * @description
 */
public interface DoorService {
    /**查询所有门店*/
    List<Door> findAll();
    /**新增
     * @param: door 门店信息参数
     * */
    void addDoor(Door door);
    /**删除
     * @param: id id
     * */
    void deleteById(Integer id);
    /**修改
     * @param: id id
     * */
    void updateById(Door door);

    Door findById(Integer id);
}
