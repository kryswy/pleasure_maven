package com.pleasure.dto;

public class User {
	private int userID;
	private String userName;
	private String firstName;
	private String lastName;
	private String password;
	private String email;
	private String activate;
	private String passwordCode;
	private String activateCode;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActivate() {
		return activate;
	}
	public void setActivate(String activate) {
		this.activate = activate;
	}
	public String getPasswordCode() {
		return passwordCode;
	}
	public void setPasswordCode(String passwordCode) {
		this.passwordCode = passwordCode;
	}
	public String getActivateCode() {
		return activateCode;
	}
	public void setActivateCode(String activateCode) {
		this.activateCode = activateCode;
	}
	public User(String userName, String firstName, String lastName,
			String password, String email) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
	}
	public User() {
		super();
	}
	public User(String userName, String firstName, String lastName,
			String password, String email, String activateCode) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.email = email;
		this.activateCode = activateCode;
	}
	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName
				+ ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", email=" + email + ", activate="
				+ activate + ", passwordCode=" + passwordCode
				+ ", activateCode=" + activateCode + "]";
	}
	public User(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}
	
	
}
