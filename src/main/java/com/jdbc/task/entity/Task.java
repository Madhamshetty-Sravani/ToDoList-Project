package com.jdbc.task.entity;

import java.time.LocalDate;

public class Task {
	 private String taskID;
	 private String taskName;
	    private LocalDate startDate;
	    private LocalDate endDate;
	    private String status;
	    private String email;
		public String getTaskID() {
			return taskID;
		}
		public void setTaskID(String taskID) {
			this.taskID = taskID;
		}
		public String getTaskName() {
			return taskName;
		}
		public void setTaskName(String taskName) {
			this.taskName = taskName;
		}
		public LocalDate getStartDate() {
			return startDate;
		}
		public void setStartDate(LocalDate startDate) {
			this.startDate = startDate;
		}
		public LocalDate getEndDate() {
			return endDate;
		}
		public void setEndDate(LocalDate endDate) {
			this.endDate = endDate;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		}


