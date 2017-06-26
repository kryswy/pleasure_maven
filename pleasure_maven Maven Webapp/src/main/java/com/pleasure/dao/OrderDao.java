package com.pleasure.dao;

import java.util.ArrayList;



import org.apache.ibatis.annotations.Param;

import com.pleasure.dto.Order;

/**
 * Created by Administrator on 2016/12/30.
 */
public interface OrderDao {
    void createOrder(Order order);
    Order getLastOrder();
    void addProducts(@Param("orderID") int oderID,@Param("productID") int productID,@Param("amount") int amount);
    int getUserIDByID(int id);

	ArrayList<Integer> getProductsIDByID(int id);

	Order getOrderByID(int id);

	ArrayList<Integer> getOrderByUserID(int id);

	void deleteOrderByID(int id);
}
