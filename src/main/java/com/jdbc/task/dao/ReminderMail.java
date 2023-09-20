package com.jdbc.task.dao;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
@WebListener
public class ReminderMail implements ServletContextListener {

	private Connection connection;
	
	public ReminderMail() throws ClassNotFoundException,SQLException
	{
		connection=MyConnection.getConnection();
	}
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new Task(), 0, 10, TimeUnit.SECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        if (scheduler != null) {
            scheduler.shutdown();
            try {
                if (!scheduler.awaitTermination(5, TimeUnit.SECONDS)) {
                    scheduler.shutdownNow();
                }
            } catch (InterruptedException e) {
                scheduler.shutdownNow();
            }
        }
    }
}

class Task implements Runnable {
    @Override
    public void run() {
        System.out.println("Task executed at: " + System.currentTimeMillis());
         PreparedStatement pstmt = null;
        Connection con=null;
    	final ResultSet result;
    	try {
    		con=MyConnection.getConnection();
    		LocalDate curDate = LocalDate.now();
     /* 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String endDate = "DATE_SUB(\"" + curDate.format(formatter) + "\",INTERVAL 1 DAY)";
        	final String sql = "select * from task where endDate < ?";
        	pstmt=con.prepareStatement(sql);
			pstmt.setString(1, endDate);
			result = pstmt.executeQuery();
			System.out.println("test");
			while(result.next()) {
				System.out.println(result.getString(1));
				System.out.println(result.getString(2));
				sendEmailNotification(result.getString(6), result.getString(2), result.getString(3), result.getString(4));
			}   */
		} catch (SQLException  e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }

	public void sendEmailNotification(String emailId,String taskName,String startDate,String endDate)throws MessagingException
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
}
