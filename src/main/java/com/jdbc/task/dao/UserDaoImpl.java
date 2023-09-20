package com.jdbc.task.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.task.entity.User;

public class UserDaoImpl {
	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet result;
	private String sql,sql2;
	public UserDaoImpl() throws ClassNotFoundException,SQLException
	{
		connection=MyConnection.getConnection();
	}
	public String validateUser(User user) throws ClassNotFoundException,SQLException
	{
		System.out.println(user.getUserid());
		System.out.println(user.getPassword());
		sql2="select * from User where userId=? and password=?";
		pstmt=connection.prepareStatement(sql2);
		pstmt.setString(1, user.getUserid());
		pstmt.setString(2, user.getPassword());
		result=pstmt.executeQuery();
		if(result.next())
		{
			return user.getUserid();
		}
		return null;
	}
	public Boolean ValidateUserName(String name) {
		String query = "select * from user where userId=?";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1,name);
			result = pstmt.executeQuery();
			if(result.next())
				return true;
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public Boolean updateUserPassword(User user) throws ClassNotFoundException,SQLException
	{
		System.out.println("testing username:::"+user.getUserid());
		sql="select * from user where userid=?";
		pstmt=connection.prepareStatement(sql);
		pstmt.setString(1, user.getUserid());
		result = pstmt.executeQuery();
		if(result.next()) {
			String update = "update user set password=? where userid=?";
			pstmt = connection.prepareStatement(update);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getUserid());
			pstmt.executeUpdate();
		}
		else {
			return false;
		}
		return true;
	}
	public String registerUser(User user) throws ClassNotFoundException,SQLException
	{
		sql="insert into User values(?,?,?)";
		pstmt=connection.prepareStatement(sql);
		pstmt.setString(1, user.getUserid());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getUsername());
		if(pstmt.executeUpdate()>0)
			return "User Registered";
		else
			return "Some error Encountered";
		
	}
}



