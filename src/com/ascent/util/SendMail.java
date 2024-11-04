package com.ascent.util;
import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
  
public class SendMail {   
  
	//private static final String SMTP_HOST="smtp.163.com";   
	//private static final String SENDER_NAME="������˼�ɿƼ����޹�˾";   //��ʾ�ķ����˱�����Ϣ
	private static final String SUBJECT="ͼ��ѯ�ۻظ�(��˼�ɿƼ�)";   //����
	
	public SendMail(){
		
	}
	/**
	 * �����ʼ�����
	 * @param fromAddress ������ַ
	 * @param username �����û���
	 * @param password ��������
	 * @param toAddress ���ʼ���ַ
	 * @param customerAddress �ͻ��ʼ���ַ
	 * @param mge �ʼ�����
	 */
	public void sendMessage(String fromAddress,String username,String password,String toAddress,String customerAddress,String mge){   
		Properties props=new Properties();   
		String mailType = this.cutFromAddress(fromAddress);
		String mailserver=null;
		//���Գɹ�
		if (mailType.equals("163.com")||mailType.equals("sohu.com")||mailType.equals("126.com")){
	   		mailserver = "smtp."+mailType;
	   		System.out.println("mailserver====="+mailserver);
	   		props.setProperty("mail.smtp.host", mailserver);
   			props.setProperty("mail.smtp.auth", "true");
	   		}
	   
	   	if (mailType.indexOf("sina")!=-1) //��֤�Ѿ��ɹ�
	   		{
	   			mailserver ="smtp.sina.com.cn";//"202.106.187.180";
	   			System.out.println("mailserver====="+mailserver);
	   			props.setProperty("mail.smtp.host", mailserver);
	   			props.setProperty("mail.smtp.auth", "true");
	   			
	   		}
	   		
	   	if (mailType.indexOf("gmail")!=-1){   //��֤�Ѿ��ɹ�
	   			mailserver = "smtp.gmail.com";
	   			System.out.println("mailtype==============="+mailType);
	   			String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	   			props.setProperty("mail.smtp.host", mailserver);
	   			props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	   			props.setProperty("mail.smtp.socketFactory.fallback", "false");
	   			props.setProperty("mail.smtp.port", "465");
	   			props.setProperty("mail.smtp.socketFactory.port", "465");
	   			props.setProperty("mail.smtp.auth", "true");
	   			props.setProperty("mail.smtp.ssl",  "true");
	       }
		props.put("mail.smtp.user",username);   //��ӷ���Email�û���
		props.put("mail.smtp.password",password);//��ӷ���Email����
		jmyz auth =new jmyz();   
        auth.performCheck(fromAddress,password);  
		Session session=Session.getInstance(props);   
		session.setDebug(true);
		try{   
			System.out.println("���Ϳ�ʼ��"); 
			Message msg=new MimeMessage(session);   
			msg.setFrom(new InternetAddress(fromAddress,customerAddress));  // ���÷���Email���ʼ�����
			msg.setRecipient(Message.RecipientType.TO,new InternetAddress(toAddress));   //�����ռ��˵�ַ
			msg.setSubject(SUBJECT);   //�����ʼ�����
			msg.setSentDate(new Date());   
			//msg.setText(mge);   //�ʼ�����
			BodyPart mdp = new MimeBodyPart();
			mdp.setContent(mge,"text/html;charset=gb2312");
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mdp);
			msg.setContent(mp);
			msg.saveChanges();
			
			Transport transport = session.getTransport("smtp"); 
			transport.connect(mailserver,props.getProperty("mail.smtp.user"),props.getProperty("mail.smtp.password"));//2   
			transport.sendMessage(msg,msg.getAllRecipients());   
			System.out.println("���ͳɹ���");  
		}catch(Exception e){
			System.out.println(e);   
		}   
	}   
  
	//��ȡ�����ʼ�������
	public String cutFromAddress(String fromAddress){
		String mailType = fromAddress.substring(fromAddress.indexOf("@")+1,fromAddress.length());
		System.out.println("======mailType======"+mailType);
		return mailType;
	}
	
	public static void main(String[] args){   
		SendMail sendMail=new SendMail();   
		sendMail.sendMessage("lixing051116@163.com", "lixing051116", "C2008119521", "312280465@qq.com", "312280465@163.com", "�����ʼ���������");
		String email="lixing051116@163.com";
		System.out.println(email.substring(0, email.indexOf("@")));
	}   
}   
