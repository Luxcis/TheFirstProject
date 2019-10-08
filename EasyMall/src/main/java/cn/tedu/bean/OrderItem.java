package cn.tedu.bean;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 19:12
 * @Version: 1.0
 * @Description:
 */
public class OrderItem {
    private String order_id;//--订单编号
    private String product_id;//--商品编号
    private int buynum;//--商品购买数量
    public String getOrder_id() {
        return order_id;
    }
    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
    public String getProduct_id() {
        return product_id;
    }
    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }
    public int getBuynum() {
        return buynum;
    }
    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }
}
