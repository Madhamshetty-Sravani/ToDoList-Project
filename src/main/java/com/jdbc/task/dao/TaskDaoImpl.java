package com.jdbc.task.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

//import javax.websocket.Session;

import com.jdbc.task.entity.Task;
import com.jdbc.task.entity.User;
import com.jdbc.task.entity.Task;
import com.jdbc.task.dao.MyConnection;
import com.jdbc.task.entity.Task;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class TaskDaoImpl implements ITaskDao
	{
		private Connection connection;
		private PreparedStatement pstmt;
		private ResultSet result;
		private String sql;
		
		public TaskDaoImpl() throws ClassNotFoundException,SQLException
		{
			connection=MyConnection.getConnection();
		}
		public boolean addTask(Task t) throws SQLException 
		{
			sql="insert into Task(taskName,startDate,endDate,status,email) values(?,?,?,?,?)";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, t.getTaskName());
			pstmt.setString(2, String.valueOf(t.getStartDate()));
			pstmt.setString(3, String.valueOf(t.getEndDate()));
			pstmt.setString(4, String.valueOf(t.getStatus()));
			pstmt.setString(5, t.getEmail());
			pstmt.executeUpdate();
			//sendEmailNotification(t.getEmail(),t.getTaskName(),t.getStartDate());
			return true;
		}
		public void deleteTask(String taskName) throws ClassNotFoundException,SQLException
		{
			sql="delete from Task where taskName=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,taskName);
			pstmt.executeUpdate();
		}
		
		public boolean updateTask(Task t) throws ClassNotFoundException,SQLException
		{
			String query = "select * from Task where taskName=?";
			pstmt=connection.prepareStatement(query);
			pstmt.setString(1, t.getTaskName());
			System.out.println(t.getTaskName());
			result = pstmt.executeQuery();
			if(result.next()) {
				sql="update Task set startDate=?,endDate=?,status=? where taskName=?";
				pstmt=connection.prepareStatement(sql);
				pstmt.setString(1, String.valueOf(t.getStartDate()));
				pstmt.setString(2, String.valueOf(t.getEndDate()));
				pstmt.setString(3, String.valueOf(t.getStatus()));
				pstmt.setString(4, t.getTaskName());
				pstmt.executeUpdate();
				System.out.println(t.toString());
				return true;
			}
			return false;
			
		}
		public List<Task> findByTaskName(String taskName,String userid) throws ClassNotFoundException,SQLException
		{
			List<Task> list = new ArrayList<>();
			sql="select * from Task where email=? and taskName like ?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1, userid);			
			pstmt.setString(2,"%"+taskName+"%");
			ResultSet result=pstmt.executeQuery();
			while(result.next())
			{
				Task t=new Task();
				t.setTaskName(result.getString(2));
				t.setStartDate(LocalDate.parse(result.getString(3)));
				t.setEndDate(LocalDate.parse(result.getString(4)));
				t.setStatus(result.getString(5));
				t.setEmail(result.getString(6));
				list.add(t);
			}
			return list;
		}
		@Override
		public List<Task> FilterByDate(LocalDate date,String userid) throws ClassNotFoundException, SQLException {
			List<Task> list = new ArrayList<>();
			sql="select * from Task where email=? and startdate like ?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,"%"+date+"%");
			ResultSet result=pstmt.executeQuery();
			while(result.next())
			{
				Task t=new Task();
				t.setTaskName(result.getString(2));
				t.setStartDate(LocalDate.parse(result.getString(3)));
				t.setEndDate(LocalDate.parse(result.getString(4)));
				t.setStatus(result.getString(5));
				t.setEmail(result.getString(6));
				list.add(t);
			}
			return list;
		}
		public List<Task>getAllTask() throws ClassNotFoundException,SQLException
		{
			List<Task>list=new ArrayList<Task>();
			sql="select * from Task";
			pstmt=connection.prepareStatement(sql);
			result=pstmt.executeQuery();
			while(result.next())
			{
				Task t=new Task();
				t.setTaskName(result.getString(2));
				t.setStartDate(LocalDate.parse(result.getString(3)));
				t.setEndDate(LocalDate.parse(result.getString(4)));
				t.setStatus(result.getString(5));
				t.setEmail(result.getString(6));
				list.add(t);
			}
			return list;
		}
	
		public void sendEmailNotification(String emailId,String taskName,LocalDate startDate,LocalDate endDate)throws MessagingException
		{
			String senderEmail = "sravani648620@gmail.com";
	        String senderPassword = "gnwiydhxildqbtyj";
	        
	    
        String emailSubject = "Reminder for your Todo Task";
        String emailContent = "This is a Reminder mail for your upcoming task :\n started on "+String.valueOf(startDate)+"\n Ends on"+String.valueOf(endDate);
	        String smtpHost = "smtp.gmail.com";
	        String smtpPort = "587";
	        Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", smtpHost);
	        props.put("mail.smtp.port", smtpPort);
	      //  props.put("mail.smtp.ssl.trust", smtpHost);
	        System.out.println("here one");
	        Session sess = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(senderEmail, senderPassword);
	            }
	        });
	        try {
	            Message message = new MimeMessage(sess); 
            message.setFrom(new InternetAddress(senderEmail));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
	            message.setSubject(emailSubject);
	            message.setText(emailContent);
	            Transport.send(message);
	            System.out.println("Email sent successfully!");
	        } catch (MessagingException e) 
	        {
	            e.printStackTrace();
	        }
		}
		@Override
		public List<Task> getAllTaskByUserID(String email) throws ClassNotFoundException, SQLException {
			List<Task>list=new ArrayList<Task>();
			sql="select * from Task where email=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setString(1,email);
			result=pstmt.executeQuery();
			while(result.next())
			{
				Task t=new Task();
				t.setTaskName(result.getString(2));
				t.setStartDate(LocalDate.parse(result.getString(3)));
				t.setEndDate(LocalDate.parse(result.getString(4)));
				t.setStatus(result.getString(5));
				t.setEmail(result.getString(6));
				list.add(t);
			}
			return list;
		}
	}
	









