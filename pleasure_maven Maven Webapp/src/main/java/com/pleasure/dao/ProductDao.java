package com.pleasure.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pleasure.dto.Product;



public interface ProductDao {

	List<Product> getProductsByClassId(int classID);
	Product getProductById(int id);
	void UpdateProductHot(@Param("productID") int productID, @Param("amount") int amount);
	List<Product> getProductsTop10();
	List<Product> getProductsByDSQL(@Param("class1") Integer class1,@Param("class2")  Integer class2,@Param("class3")  Integer class3, 
							@Param("minPrice") Integer minPrice,@Param("maxPrice")  Integer maxPrice);
	List<Product> getAllProducts();
	List<Product> SearchByStr(String searchStr);
	
	int addProduct(Product product);
	ArrayList<Product> searchProduct(String search);

	void deleteProductByID(int id);

	void updateProduct(Product product);
	List<Product> getCollectionsByUserID(@Param("userID") int userID);
	void addProcductToCollection(@Param("productID") int productID, @Param("userID") int userID);
	void deleteProcductFromCollection(@Param("productID") int productID, @Param("userID") int userID);
}
