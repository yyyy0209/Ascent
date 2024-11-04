package com.ascent.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Product;
import com.ascent.dao.ProductDAO;
import com.ascent.util.ShopCart;

public class ShopCartServlet extends HttpServlet {
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
	   String state= request.getParameter("a");
	   if(state.equals("add"))//���ﳵ��Ӳ�Ʒ����
	   {
		   this.addtoShopCart(request, response);
	   }
	   if(state.equals("find"))//���ҹ��ﳵ��Ӳ�Ʒ����
	   {
		   this.findShopCart(request, response);
	   }
	   if(state.equals("checkout"))//����
	   {
		   this.checkout(request, response);
	   }
	   if(state.equals("move"))
	   {
		   this.delShopCartProduct(request, response);
	   }
	   if(state.equals("updateNum"))
	   {
		   this.updateCartProductNum(request, response);
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
	 //��ͻ��˷�����ʾ��Ϣ 
	  private void dostate(HttpServletRequest request, HttpServletResponse response,String state) throws
	  ServletException, IOException{
	  request.setAttribute("temp",state);
	   this.doBrowseErr(request, response);
	 }
	  //Clean up resources
	   public void destroy() {
		}
	  private void addtoShopCart(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  
		   HttpSession session = request.getSession(false);
		   ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		   if(ShopCart==null)
		   {
			   ShopCart= new ShopCart();
			   System.out.println("������ ��������");
		   }
		   String pid = request.getParameter("pid");
		   int ppid =Integer.parseInt(pid);
		   boolean bl = ShopCart.CheckHashMapid(pid);//�жϹ��ﳵ�Ƿ��Ѿ����
		   System.out.println(pid+" ture wei ���� "+bl);
		   if(bl)//�ò�Ʒ�Ѿ����
		   {
//			 Ajax���ظ���Ʒ�Ѿ���ӹ�����ʾ
				String dthtml ="�ò�Ʒ�Ѿ������ڹ��ﳵ��";//"����Ʒ�Ѿ���ӹ�";
				response.setContentType("text/html; charset=gb2312");
				response.getWriter().print(dthtml);//����ҳ��
		   }else//û�����
		   {
			   ProductDAO pd = new ProductDAO();
			   Product product= pd.getProductbyPid(ppid);
			   product.setStructure("5g");
			   ShopCart.addProduct(pid,product);
			   String dthtml ="��ӳɹ�";//"����Ʒ�Ѿ���ӹ�";
			   response.setContentType("text/html; charset=gb2312");			   
			   response.getWriter().print(dthtml);//����ҳ��
			   response.getWriter().flush();
			  
		   }
		   response.getWriter().flush();
		   session.setAttribute("shopcart", ShopCart);
	  }
	  private void findShopCart(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		   ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		   if(ShopCart==null)
		   {
			   ShopCart= new ShopCart();
		   } 
		   Collection ShopCartlist =  ShopCart.getHashmap().values();//���ع��ﳵ��value����ͼ��collection��
		   session.setAttribute("shopcartlist", ShopCartlist);
		   this.doBrowse(request, response, "/product/cartshow.jsp");
	  }
	  private void delShopCartProduct(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  String pid = request.getParameter("pid");
		  ShopCart.removeHashMap(pid);
		  Collection ShopCartlist = ShopCart.getHashmap().values();//���ع��ﳵ��value����ͼ��collection��
		  session.setAttribute("shopcartlist", ShopCartlist);
		  this.doBrowse(request, response, "/product/cartshow.jsp");
	  }
	  
	  private void updateCartProductNum(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  String pid = request.getParameter("pid");
		  String number = request.getParameter("quantity");
		  ShopCart.UpdateProductNumbedr(pid, number);
		  //session.setAttribute("shopcart", ShopCart);
		  //Ajax���ظ���Ʒ�Ѿ���ӹ�����ʾ
		  String dthtml ="�ò�Ʒ�Ѿ��޸�";//"����Ʒ�Ѿ���ӹ�";
		  response.setContentType("text/html; charset=gb2312");
		  response.getWriter().print(dthtml);//����ҳ�� 
	  }
	  
	  private void checkout(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  Collection ShopCartlist = ShopCart.getHashmap().values();//���ع��ﳵ��value����ͼ��collection��
		  session.setAttribute("shopcartlist", ShopCartlist);
		  this.doBrowse(request, response, "/product/checkout.jsp");
	  }
}

