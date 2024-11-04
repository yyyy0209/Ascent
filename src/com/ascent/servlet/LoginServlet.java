 package com.ascent.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;
import com.ascent.dao.LoginDAO;
import com.ascent.util.PageBean;

public class LoginServlet extends HttpServlet {

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
	   //��ȡ��¼״̬����¼���˳�ϵͳ����
	   String loginstate= request.getParameter("a");
	   if(loginstate.equals("out"))//Ϊ�˳�ϵͳ����
	   {
	     this.Loginout(request, response);
	   }
	   if(loginstate.equals("login"))//Ϊϵͳ��¼����
	   {
	      this.Userlogin(request, response);
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

	  private void doError(HttpServletRequest request, HttpServletResponse response,String error) throws
	  ServletException, IOException{
	  request.setAttribute("error",error);
	   this.doBrowseErr(request, response);
	 }
	  //Clean up resources
	   public void destroy() {
		}
	   
	   public void Userlogin(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String name= request.getParameter("username");
		   String password=request.getParameter("password");
		   LoginDAO Ld = new LoginDAO();
		   Productuser puser= Ld.login(name, password);
		   if(puser==null)
		   {
			   this.doError(request, response,"productuserL_tip.login.fail");
		   }
		   else
		   {// �û���¼�ɹ�  ���￪ʼ�ж�Ȩ�� ���û����浽session
				
			   String superuser = puser.getSuperuser();
			   HttpSession mysession = request.getSession(false);
			   mysession.setAttribute("productuser", puser);
				if(superuser.equals("1")){//��ͨע���û�
					 this.doBrowse(request, response,"/product/products.jsp");
				}else if(superuser.equals("2")){//�������ܿ���ĳЩҩƷ�۸���û�
					 this.doBrowse(request, response,"/product/products.jsp");
				}else if(superuser.equals("3")){//admin ��Ϊ��һ������ҳ�� ����ҳ��Ϊ1 
					List allProductList = Ld.getalluser();
					mysession.setAttribute("allproductlist", allProductList);
					this.doBrowse(request, response,"/product/products_showusers.jsp");
				}
		   }
		   
	   }
	   public void Loginout(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   HttpSession session = request.getSession(false);
		   //�������session��
		   session.invalidate();
		   //������ҳ
		   this.doBrowse(request, response,"/index.jsp");
	   }
	   
}
