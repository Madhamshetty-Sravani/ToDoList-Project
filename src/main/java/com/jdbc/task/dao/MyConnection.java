package com.jdbc.task.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	private MyConnection()
	{}
	private static Connection connection;
	public static  Connection getConnection() throws ClassNotFoundException,SQLException
	{
		if(connection==null)
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3307/sravs","root","root");
		}
		return connection;

}
}
