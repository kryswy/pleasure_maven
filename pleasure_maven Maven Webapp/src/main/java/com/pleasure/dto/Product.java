package com.pleasure.dto;

public class Product {
	private int productID;
	private String name;
	private String imageURL1;
	private String imageURL2;
	private String imageURL3;
	private double price;
	private String description;
	private String addition;
	private int class1;
	private int class2;
	private int class3;
	private String address;
	private int hot;
	public Product() {
		super();
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageURL1() {
		return imageURL1;
	}
	public void setImageURL1(String imageURL1) {
		this.imageURL1 = imageURL1;
	}
	public String getImageURL2() {
		return imageURL2;
	}
	public void setImageURL2(String imageURL2) {
		this.imageURL2 = imageURL2;
	}
	public String getImageURL3() {
		return imageURL3;
	}
	public void setImageURL3(String imageURL3) {
		this.imageURL3 = imageURL3;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddition() {
		return addition;
	}
	public void setAddition(String addition) {
		this.addition = addition;
	}
	public int getClass1() {
		return class1;
	}
	public void setClass1(int class1) {
		this.class1 = class1;
	}
	public int getClass2() {
		return class2;
	}
	public void setClass2(int class2) {
		this.class2 = class2;
	}
	public int getClass3() {
		return class3;
	}
	public void setClass3(int class3) {
		this.class3 = class3;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	@Override
	public String toString() {
		return "Product [productID=" + productID + ", name=" + name
				+ ", price=" + price + ", hot=" + hot + "]";
	}
	public Product(String name, String imageURL1, String imageURL2,
			String imageURL3, double price, String description,
			String addition, int class1, int class2, int class3, String address) {
		super();
		this.name = name;
		this.imageURL1 = imageURL1;
		this.imageURL2 = imageURL2;
		this.imageURL3 = imageURL3;
		this.price = price;
		this.description = description;
		this.addition = addition;
		this.class1 = class1;
		this.class2 = class2;
		this.class3 = class3;
		this.address = address;
	}
	
}
