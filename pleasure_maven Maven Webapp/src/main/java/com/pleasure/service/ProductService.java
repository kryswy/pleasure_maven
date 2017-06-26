package com.pleasure.service;

import java.util.ArrayList;
import java.util.List;

import com.pleasure.dto.Product;
import com.pleasure.dto.User;


public interface ProductService {
	List<Product> getProductsByClassId(int classID);
	Product getProductById(int id);
	void UpdateProductHot(Integer productID, Integer amount);
	List<Product> getProductsTop10();
	List<Product> getProductsByDSQL(Integer class1, Integer class2,
			Integer class3, Integer minPrice, Integer maxPrice);
	List<Product> getAllProducts();
	List<Product> SearchByStr(String searchStr);
	
	public void addProduct(Product product);
	public ArrayList<Product> searchProduct(String search);

	public void deleteProductByID(int id);

	public void updateProduct(Product product);
	List<Product> getCollections(User user);
	void addProcductToCollection(int productID, int userID);
	void deleteProcductFromCollection(int productID, int userID);
}
