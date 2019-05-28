package com.eddie.midterm;

import java.sql.SQLException;
import java.util.List;

public interface ISchoolDAO {
	
	public void getConnection() throws SQLException ;
	
	public List<SchoolBean> findBySchool_name(String school_name) throws SQLException;
	
	public int insert(SchoolBean school) throws SQLException;

//	public int update(SchoolBean school) throws SQLException;
//
//	public int delete(int school_code) throws SQLException;
//	
//	public List<SchoolBean> getAll() throws SQLException;
}
