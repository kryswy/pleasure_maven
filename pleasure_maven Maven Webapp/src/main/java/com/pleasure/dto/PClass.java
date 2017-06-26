package com.pleasure.dto;

public class PClass {
	private int classID;
	private String name;
	private int parentID;
	
	public PClass() {
		super();
	}
	public PClass(int parentID) {
		super();
		this.parentID = parentID;
	}
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentID() {
		return parentID;
	}
	public void setParentID(int parentID) {
		this.parentID = parentID;
	}
	@Override
	public String toString() {
		return "PClass [classID=" + classID + ", name=" + name + ", parentID="
				+ parentID + "]";
	}
	
}
