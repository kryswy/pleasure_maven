package com.pleasure.dao;



import org.apache.ibatis.annotations.Param;

import com.pleasure.dto.Cart;


import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface CartDao {

    Cart getCartByID(@Param("id") int id);
    Cart getCartByCartID(@Param("id") int id);
    void createCart(@Param("userID") int userID,@Param("date") String date);

    List<Map<String,Integer>> getProductList(@Param("cartID") int cartID);

    void changeAmount(@Param("cartID") int cartID,@Param("productID") int productID,@Param("amount") int amount);

    void deleteProduct(@Param("cartID") int cartID,@Param("productID") int productID);

    void countPrice(@Param("count") double count,@Param("cartID") int cartID);

    Double getCount(@Param("cartID") int cartID);

    void emptyCart(@Param("cartID") int cartID);
	void addProcductToCart(@Param("cartID") int cartID, @Param("productID") int productID,@Param("amount")  int amount);
	Integer getProductIDByCartID(@Param("cartID") int cartID,@Param("productID") int productID);
	void UpdateProductAmount(@Param("cartID") int cartID, @Param("productID") int productID,@Param("amount")  int amount);


}
