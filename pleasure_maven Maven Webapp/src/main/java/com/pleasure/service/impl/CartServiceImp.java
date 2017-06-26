package com.pleasure.service.impl;




import org.springframework.stereotype.Service;

import com.pleasure.dao.CartDao;
import com.pleasure.dto.Cart;
import com.pleasure.service.CartService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/12/29.
 */
@Service
public class CartServiceImp implements CartService {

	@Resource
    private CartDao cartDao;

    @Override
    public Cart getCartByID(int id) {
        return cartDao.getCartByID(id);
    }

    @Override
    public Cart getCartByCartID(int id) {
        return cartDao.getCartByCartID(id);
    }


    @Override
    public void createCart(int userID , String date) {
        cartDao.createCart(userID,date);
    }

    @Override
    public List<Map<String,Integer>> getProductList(int cartID) {
        return cartDao.getProductList(cartID);
    }

    @Override
    public void changeAmount(int cartID, int productID, int amount){
        cartDao.changeAmount(cartID,productID,amount);
    }

    @Override
    public void deleteProduct(int cartID, int productID) {
        cartDao.deleteProduct(cartID,productID);
    }

    @Override
    public void countPrice(double count,int cartID) {
        cartDao.countPrice(count,cartID);
    }

    @Override
    public Double getCount(int cartID) {
        return cartDao.getCount(cartID);
    }

    @Override
    public void emptyCart(int cartID) {
        cartDao.emptyCart(cartID);
    }

  

	@Override
	public void addProcductToCart(int amount, int productID, int userID) {
		// TODO Auto-generated method stub
		Cart cart=cartDao.getCartByID(userID);
		if(cart==null){
			Date d = new Date();
            String date=(new SimpleDateFormat("yyyy-MM-dd")).format(d);
			cartDao.createCart(userID, date);
			cart=cartDao.getCartByID(userID);
		}
		int cartID=cart.getCartID();
		Integer cart_p_id=cartDao.getProductIDByCartID(cartID,productID);
		if(cart_p_id==null){
			cartDao.addProcductToCart(cartID,productID,amount);
		}else{
			cartDao.UpdateProductAmount(cartID,productID,amount);
		}
		
	}
}
