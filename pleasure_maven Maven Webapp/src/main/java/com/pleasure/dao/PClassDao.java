package com.pleasure.dao;

import java.util.List;

import com.pleasure.dto.PClass;


public interface PClassDao {
	List<PClass> getChildsById(int classID);
	int getParentClassID(int classID);
	PClass getClassByID(int classID);
	String getNameByID(int id);
}
