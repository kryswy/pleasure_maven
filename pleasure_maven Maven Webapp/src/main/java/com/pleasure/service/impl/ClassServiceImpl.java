package com.pleasure.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.pleasure.dao.PClassDao;
import com.pleasure.dto.PClass;
import com.pleasure.service.ClassService;


@Service
public class ClassServiceImpl implements ClassService {
	@Resource
	private PClassDao classDao;

	@Override
	public List<PClass> getChildsById(int classID) {
		// TODO Auto-generated method stub
		return classDao.getChildsById(classID);
	}

	@Override
	public int getParentClassID(int classID) {
		// TODO Auto-generated method stub
		return classDao.getParentClassID(classID);
	}

	@Override
	public PClass getClassByID(int classID) {
		// TODO Auto-generated method stub
		return classDao.getClassByID(classID);
	}

	@Override
	public List<PClass> getAllChildProducts(int classID) {
		// TODO Auto-generated method stub
		List<PClass> list = new ArrayList<PClass>();
		List<PClass> list1 = getChildsById(classID);
		for (PClass c : list1) {
			list.add(c);
			List<PClass> list2 = getChildsById(c.getClassID());
			for (PClass cc : list2) {
				list.add(cc);
			}
		}
		return list;
	}

	@Override
	public String getNameByID(int id) {
		// TODO Auto-generated method stub
		return classDao.getNameByID(id);
	}
}
