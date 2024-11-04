package com.ascent.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Mailtb;
import com.ascent.bean.Productuser;
import com.ascent.dao.MailDAO;

public class MailServlet extends HttpServlet {

	 private static final String CONTENT_TYPE = "text/html; charset=GBK";
	 private   ServletContext sc=null;
	 public void init() throws ServletException {
		 super.init();
		 sc=this.getServletContext();
	 }
//	Process the HTTP Post request
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    doGet(request, response);
	  }
	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   String state=request.getParameter("a");
	   if (state.equals("all"))//����ǲ�ѯ��Ʒ�������ѯҵ�񡣣�all��ʾ��ѯ���У�
	   {
		  try {
			this.mailall(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   if(state.equals("save"))
	   {
		   String pid= request.getParameter("productId");
		   try {
			this.savemail(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	   }
	  
	  return;
	  }

	  
	  private void doBrowse(HttpServletRequest request, HttpServletResponse response,String url) throws
	    ServletException, IOException{
	    RequestDispatcher rd=sc.getRequestDispatcher(url);
	    rd.forward(request,response); 
	  }
	  private void doBrowseErr(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException{
      RequestDispatcher rd=sc.getRequestDispatcher("/product/products.jsp");
      rd.forward(request,response);
      }

	  private void doError(HttpServletRequest request, HttpServletResponse response,String error)throws
	  ServletException, IOException{
	  request.setAttribute("error",error);
	   this.doBrowseErr(request, response);
		}
	  //Clean up resources
	   public void destroy() {
		}
	  //����һЩҵ������
	  //��ѯ���з���
	   public void mailall(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException,SQLException
	   {
		   MailDAO mb = new MailDAO();
		   Mailtb mail;
		
			mail = mb.findmail();
		
		   if(mail==null)
		   {
			   String dthtml="����Ա��û�������ʼ�"; //����Ա���仹û���ù����������������ò���
			   response.setContentType("text/html; charset=gb2312");  
			   response.getOutputStream().print(dthtml);//����name�� ҳ�棻
		   }
		   else
		   {
				HttpSession mysession = request.getSession(false);
				String faddress = mail.getFromaddress();
				String taddress = mail.getToaddress();
				String dthtml="������ַ��"+faddress+"<br>�ռ���ַ��"+taddress+"<br>������޸ģ����������Ĳ���";
				response.setContentType("text/html; charset=gb2312");
				response.getOutputStream().print(dthtml);//����name�� ҳ�棻
		   } 
	   }
	   
//	 ���淽��
	   public void savemail(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException,SQLException{
		   String formaddr= request.getParameter("fromaddressname");
		   String fromaddrtype= request.getParameter("fromaddresstype");
		   String frompassword= request.getParameter("frompassword");
		   String toaddress= request.getParameter("toaddress");
		   String fromaddress =formaddr+fromaddrtype;
		   System.out.println(fromaddress);
		   Mailtb mail = new Mailtb();	
		   mail.setFromaddress(fromaddress);
		   mail.setFrompassword(frompassword);
		   mail.setToaddress(toaddress);
		   MailDAO mb = new MailDAO();
		   mb.Savemail(mail);
		   this.doBrowse(request, response,"/product/mailmanager.jsp");
	   }
	
}
