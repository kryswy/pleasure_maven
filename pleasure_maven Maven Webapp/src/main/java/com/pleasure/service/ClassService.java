package com.pleasure.service;

import java.util.List;

import com.pleasure.dto.PClass;


public interface ClassService {
	List<PClass> getChildsById(int classID);
	int getParentClassID(int classID);
	PClass getClassByID(int classID);
	List<PClass> getAllChildProducts(int classID);
	String getNameByID(int id);
	
}
