package com.pleasure.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;

import com.pleasure.dao.OrderDao;
import com.pleasure.dto.Order;
import com.pleasure.service.OrderService;

/**
 * Created by Administrator on 2016/12/30.
 */
@Service
public class OrderServiceImp implements OrderService {

	@Resource
    OrderDao orderDao;

    @Override
    public void createOrder(Order order) {
        orderDao.createOrder(order);
    }

    @Override
    public Order getLastOrder() {
        return orderDao.getLastOrder();
    }

    @Override
    public void addProducts(int oderID, int productID, int amount) {
        orderDao.addProducts(oderID,productID,amount);
    }

    @Override
	public int getUserIDByID(int id) {
		return orderDao.getUserIDByID(id);
	}

	@Override
	public ArrayList<Integer> getProductsIDByID(int id) {
		return orderDao.getProductsIDByID(id);
	}

	@Override
	public Order getOrderByID(int id) {
		return orderDao.getOrderByID(id);
	}

	@Override
	public ArrayList<Integer> getOrderByUserID(int id) {
		return orderDao.getOrderByUserID(id);
	}

	@Override
	public void deleteOrderByID(int id) {
		orderDao.deleteOrderByID(id);
	}
}
