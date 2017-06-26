package com.pleasure.service;

import java.util.ArrayList;

import com.pleasure.dto.Order;



/**
 * Created by Administrator on 2016/12/30.
 */
public interface OrderService {
    void createOrder(Order order);
    Order getLastOrder();
    void addProducts(int orderID,int productID,int amount);
    int getUserIDByID(int id);
	ArrayList<Integer> getProductsIDByID(int id);
	Order getOrderByID(int id);
	ArrayList<Integer> getOrderByUserID(int id);
	void deleteOrderByID(int id);
}
