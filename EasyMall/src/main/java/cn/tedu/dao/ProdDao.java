package cn.tedu.dao;

import cn.tedu.bean.Product;

import java.util.List;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 20:39
 * @Version: 1.0
 * @Description:
 */
public interface ProdDao {

    /**
     * 修改指定商品的库存数量
     * @param pid	商品id
     * @param pnum	商品的库存数量
     * @return boolean true 修改成功!
     */
    boolean updatePnum(String pid, int pnum);
    /**
     * 根据商品的id查询指定的商品
     * @param pid	商品id
     * @return	Product
     */
    Product findProdById(String pid);
    /**修改商品的库存
     * @param product_id：商品id
     * @param pnumAdd：商品库存的增量
     */
    void changePnum(String product_id, int pnumAdd);

}
