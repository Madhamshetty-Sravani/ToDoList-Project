package com.jdbc.task.dao;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.mail.MessagingException;

import com.jdbc.task.entity.Task;

public interface ITaskDao {
	boolean addTask(Task t) throws ClassNotFoundException,SQLException;
	void deleteTask(String taskName) throws ClassNotFoundException,SQLException;
	boolean updateTask(Task t) throws ClassNotFoundException,SQLException;
	public List<Task> findByTaskName(String taskName,String userid) throws ClassNotFoundException,SQLException;
	public List<Task> FilterByDate(LocalDate date,String userid) throws ClassNotFoundException, SQLException;
	List<Task>getAllTask() throws ClassNotFoundException,SQLException;
	void sendEmailNotification(String emailId,String taskName,LocalDate startDate,LocalDate endDate)throws MessagingException;
	List<Task>getAllTaskByUserID(String Userid)throws ClassNotFoundException, SQLException;
}
