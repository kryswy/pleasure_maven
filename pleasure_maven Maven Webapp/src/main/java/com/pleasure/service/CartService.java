package com.pleasure.service;



import java.util.List;
import java.util.Map;

import com.pleasure.dto.Cart;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface CartService {
    Cart getCartByID(int id);
    Cart getCartByCartID(int id);
    void createCart(int userID,String date);
    List<Map<String,Integer>> getProductList(int cartID);
    void changeAmount(int cartID,int productID,int amount);
    void deleteProduct(int cartID,int productID);
    void countPrice(double count,int cartID);
    Double getCount(int cartID);
    void emptyCart(int cartID);
	void addProcductToCart(int amount, int productID, int userID);

}
