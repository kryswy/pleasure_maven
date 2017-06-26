package com.pleasure.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.pleasure.dao.ProductDao;
import com.pleasure.dto.Product;
import com.pleasure.dto.User;
import com.pleasure.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductDao productDao;
	@Override
	public List<Product> getProductsByClassId(int classID) {
		// TODO Auto-generated method stub
		return productDao.getProductsByClassId(classID);
	}
	@Override
	  public Product getProductById(int id){
        return productDao.getProductById(id);
    }
	@Override
	public void UpdateProductHot(Integer productID, Integer amount) {
		// TODO Auto-generated method stub
		productDao.UpdateProductHot(productID,amount);
	}
	@Override
	public List<Product> getProductsTop10() {
		// TODO Auto-generated method stub
		return productDao.getProductsTop10();
	}
	@Override
	public List<Product> getProductsByDSQL(Integer class1, Integer class2,
			Integer class3, Integer minPrice, Integer maxPrice) {
		// TODO Auto-generated method stub
		return productDao.getProductsByDSQL(class1,class2,class3,minPrice,maxPrice);
	}
	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productDao.getAllProducts();
	}
	@Override
	public List<Product> SearchByStr(String searchStr) {
		// TODO Auto-generated method stub
		return productDao.SearchByStr(searchStr);
	}
	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
	}
	@Override
	public ArrayList<Product> searchProduct(String search) {
		// TODO Auto-generated method stub
		return productDao.searchProduct(search);	}
	@Override
	public void deleteProductByID(int id) {
		// TODO Auto-generated method stub
		productDao.deleteProductByID(id);

	}
	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);

	}
	@Override
	public List<Product> getCollections(User user) {
		// TODO Auto-generated method stub
		return productDao.getCollectionsByUserID(user.getUserID());
	}
	@Override
	public void addProcductToCollection(int productID, int userID) {
		// TODO Auto-generated method stub
		productDao.addProcductToCollection(productID,userID);
	}
	@Override
	public void deleteProcductFromCollection(int productID, int userID) {
		// TODO Auto-generated method stub
		productDao.deleteProcductFromCollection(productID,userID);
	}
	
}
