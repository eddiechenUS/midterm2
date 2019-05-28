package com.eddie.midterm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SchoolDAOjdbc {

	DataSource ds = null;
	Connection conn = null;

	public SchoolDAOjdbc() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/MemberDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getConnection() throws SQLException {
		conn = ds.getConnection();
	}

	public void closeConn() throws SQLException {
		if (conn != null)
			conn.close();
	}

	private static final String INSERT_STMT = "INSERT INTO CollegeMajor3 VALUES (?,?,?,?,?,?,?,?,?)";

	public int insert(SchoolBean school) throws SQLException {
		int updateCount = 0;
		try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);) {
			pstmt.setInt(1, school.getNum());
			pstmt.setInt(2, school.getSchool_code());
			pstmt.setString(3, school.getSchool_name());
			pstmt.setString(4, school.getMajor_code());
			pstmt.setString(5, school.getMajor_name());
			pstmt.setString(6, school.getLevel_code());
			pstmt.setString(7, school.getCity_code());
			pstmt.setDouble(8, school.getAvg_score1());
			pstmt.setDate(9, school.getDeadline1());
			updateCount = pstmt.executeUpdate();
		}
		return updateCount;
	}

	private static final String GET_ONE_SCHOOL = " SELECT num, school_code, school_name, major_code, major_name, level_code, city_code, avg_score1, deadline1 FROM CollegeMajor3 WHERE school_name=?";

	public List<SchoolBean> findBySchool_name(String school_name) throws SQLException {
		SchoolBean school = null;
		List<SchoolBean> schools = new ArrayList<SchoolBean>();
		try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(GET_ONE_SCHOOL);) {
			pstmt.setString(1, school_name);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					school = new SchoolBean();
					school.setNum(rs.getInt("num"));
					school.setSchool_code(rs.getInt("school_code"));
					school.setSchool_name(rs.getString("school_name"));
					school.setMajor_code(rs.getString("major_code"));
					school.setMajor_name(rs.getString("major_name"));
					school.setLevel_code(rs.getString("level_code"));
					school.setCity_code(rs.getString("city_code"));
					school.setAvg_score1(rs.getDouble("avg_score1"));
					school.setDeadline1(rs.getDate("deadline1"));
					schools.add(school);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return schools;
	}

	private static final String GET_ALL_STMT = "SELECT * FROM CollegeMajor3 ";

	public List<SchoolBean> getAll() throws SQLException {
		getConnection();
		SchoolBean school = null;
		List<SchoolBean> schools = new ArrayList<SchoolBean>();
		PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			school = new SchoolBean();
			school.setNum(rs.getInt("num"));
			school.setSchool_code(rs.getInt("school_code"));
			school.setSchool_name(rs.getString("school_name"));
			school.setMajor_code(rs.getString("major_code"));
			school.setMajor_name(rs.getString("major_name"));
			school.setLevel_code(rs.getString("level_code"));
			school.setCity_code(rs.getString("city_code"));
			school.setAvg_score1(rs.getDouble("avg_score1"));
			school.setDeadline1(rs.getDate("deadline1"));
			schools.add(school);
			
		}

		rs.close();
		pstmt.close();
		closeConn();

		return schools;
	}

	private static final String UPDATE_STMT = "UPDATE CollegeMajor3 SET  school_name=?, major_code=?, major_name=?, "
			+ "level_code=?, city_code=?, avg_score1=? ,deadline1=? WHERE num=?";

	public int update(SchoolBean school) throws SQLException {
		getConnection();
		List<SchoolBean> AllSchool = getAll();
		int updateCount = 0;
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);

		pstmt.setString(1, school.getSchool_name());
		pstmt.setString(2, school.getMajor_code());
		pstmt.setString(3, school.getMajor_name());
		pstmt.setString(4, school.getLevel_code());
		pstmt.setString(5, school.getCity_code());
		pstmt.setDouble(6, school.getAvg_score1());
		pstmt.setDate(7, school.getDeadline1());
		pstmt.setInt(8, school.getNum());
		updateCount = pstmt.executeUpdate();
		pstmt.close();
		closeConn();
		return updateCount;

	}

	private static final String DELETE_STMT = "DELETE FROM CollegeMajor3 WHERE num=?";

	public int delete(int num) throws SQLException {
		int updateCount = 0;

		try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);) {
			pstmt.setInt(1, num);
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		getAll();
		return updateCount;
		
	}

	private static final String GET_ONE_STMT = " SELECT num, school_code, school_name, major_code, major_name, level_code, city_code, avg_score1, deadline1 FROM CollegeMajor3 WHERE num=?";

	public SchoolBean findByNum(int num) throws SQLException {
		SchoolBean school = null;

		try (PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);) {
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				school = new SchoolBean();
				school.setNum(rs.getInt("num"));
				school.setSchool_code(rs.getInt("School_code"));
				school.setSchool_name(rs.getString("School_name"));
				school.setMajor_code(rs.getString("Major_code"));
				school.setMajor_name(rs.getString("Major_name"));
				school.setLevel_code(rs.getString("Level_code"));
				school.setCity_code(rs.getString("City_code"));
				school.setAvg_score1(rs.getDouble("Avg_score1"));
				school.setDeadline1(rs.getDate("Deadline1"));
			}
		}
		return school;
	}

}