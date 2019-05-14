package com.itsuda.projectManagement.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class projectManagementDAOImpl implements projectManagementDAO{
	
	@Autowired
	private SqlSession sql;

	private static final String namespace="itsuda.projectManagement";
	
	@Override
	public String getTime() {
		return null;
	}
}