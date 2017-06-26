package com.pleasure.dto;

public class Order {
	private int orderID;
	private int userID;
	private String date;
	private Double price;

	public Order() {
	}

	public Order(int userID, String date, Double price) {
		this.userID = userID;
		this.date = date;
		this.price = price;
	}

	public Order(int orderID, int userID, String date, Double price) {
		this.orderID = orderID;
		this.userID = userID;
		this.date = date;
		this.price = price;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String toString() {
		return "Order [orderID=" + orderID + ", userID=" + userID + ", date="
				+ date + ", price=" + price + "]";
	}
}
