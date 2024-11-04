package com.ascent.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
import com.ascent.dao.OrderDAO;
import com.ascent.dao.UserManagerDAO;
import com.ascent.util.SendMail;
import com.ascent.util.ShopCart;

public class OrderServlet extends HttpServlet {
		 private static final String CONTENT_TYPE = "text/html; charset=GBK";
		 private   ServletContext sc=null;
		 public void init() throws ServletException {
			 super.init();
			 sc=this.getServletContext();
		 }
//		Process the HTTP Post request
		  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		    doGet(request, response);
		  }
		  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		   String state=request.getParameter("a");
		  if(state.equals("checkout"))//���ʵ�����
		   {
			 this.SaveOrders(request, response);
		   }
		  if(state.equals("all"))//��ѯ���ж��������󣨹���Ա�û��鿴���ж�����
		   {
			 this.orderall(request, response);
		   }
		  if(state.equals("finditem"))//���û����Ҷ�������ͨ�û��鿴�Լ��Ķ�����
		   {
			 this.orderitem(request, response);
		   }
		  if(state.equals("delitem"))//ɾ��������Ĳ�Ʒ
		   {
			  this.delorderitem(request, response);
		   }
		  if(state.equals("delorder"))//ɾ������
		   {
			 this. DelOrder(request, response);
		   }
		  if(state.equals("lookuse"))//�鿴�û���Ϣ
		   {
			 this. Lookuser(request, response);
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
		  //��ѯ���ж�������
		   public void orderall(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   OrderDAO Pd = new OrderDAO();
			   HttpSession mysession = request.getSession(false);
			   Productuser pu= (Productuser)mysession.getAttribute("productuser");
			   List orderlist =null;
			   if (pu.getSuperuser().equals("3"))
			   {
				   try {
					orderlist = Pd.OrderAllList();
				   } catch (SQLException e) {
					e.printStackTrace();
				   }
				mysession.setAttribute("orderlist", orderlist);
				 this.doBrowse(request, response,"/product/admin_ordershow.jsp");   
			   }
			   else
			   {
				   try {
					   orderlist = Pd.OrderList(pu.getUid());
				   } catch (SQLException e) {
					e.printStackTrace();
				   }
				   mysession.setAttribute("orderlist", orderlist);
				   this.doBrowse(request, response,"/product/ordershow.jsp");      
			   } 
		   }
		   
		   //��ѯ�û���Ϣ����
		   public void Lookuser(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   String userid = request.getParameter("uid");
			   int uid = Integer.valueOf(userid);
			   UserManagerDAO um = new UserManagerDAO();
			   HttpSession mysession = request.getSession(false);
			   Productuser ProductUser=um.getproductuserbyid(uid);
			  
			mysession.setAttribute("Orderuser", ProductUser);
			this.doBrowse(request, response,"/product/admin_orderuser.jsp"); 
		   }
		   
		   
		   //��ѯ���ж�����Ӧ���ﳵ�Ĳ�Ʒ����
		   public void orderitem(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   String orderid = request.getParameter("oid");
			   int oid = Integer.valueOf(orderid);
			   OrderDAO Pd = new OrderDAO();
			   HttpSession mysession = request.getSession(false);
			   List productlist =new ArrayList();
			   try {
				   productlist = Pd.OrderItem(oid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mysession.setAttribute("orderitemlist", productlist);
			mysession.setAttribute("orderid", orderid);
			this.doBrowse(request, response,"/product/orderitem_show.jsp"); 
		   }
		   
		   //ɾ��������Ӧ���ﳵ�Ĳ�Ʒ����������Ա���ã�
		   public void DelOrder(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   String orderid = request.getParameter("oid");
			   int oid = Integer.valueOf(orderid);
			   OrderDAO Pd = new OrderDAO();
			   HttpSession mysession = request.getSession(false);
			   List orderlist =null;
			   try {
				    Pd.delOrder(oid);
					orderlist = Pd.OrderAllList();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mysession.setAttribute("orderlist", orderlist);
			this.doBrowse(request, response,"/product/admin_ordershow.jsp");   
		   }
		   //ɾ��������Ӧ���ﳵ�Ĳ�Ʒ����
		   public void delorderitem(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   String orderid = request.getParameter("oid");
			   String productid = request.getParameter("pid");
			   int oid = Integer.valueOf(orderid);
			   int pid = Integer.valueOf(productid);
			   OrderDAO Pd = new OrderDAO();
			   HttpSession mysession = request.getSession(false);
			   List productlist =new ArrayList();
			   try {
				    Pd.delOrderItem(pid,oid);
				    productlist = Pd.OrderItem(oid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mysession.setAttribute("orderitemlist", productlist);
			mysession.setAttribute("orderid", orderid);
			this.doBrowse(request, response,"/product/orderitem_show.jsp"); 
		   }
		   
		   public void SaveOrders(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
		   {
			   OrderDAO Pd = new OrderDAO();
			   MailDAO md= new MailDAO();
			   String content="";//��Ʒ����
			   String message="";//���շ���message
			   HttpSession mysession = request.getSession(false);
			   String name=request.getParameter("username");
			   String tele=request.getParameter("tel");
			   String emails=request.getParameter("email");
			   String company=request.getParameter("companyname");
			   String companyadd=request.getParameter("companyaddress");
			   Productuser pu= (Productuser)mysession.getAttribute("productuser");
			   Collection con= (Collection)mysession.getAttribute("shopcartlist");//��ȡ���ﳵ����
			   if(pu==null)//Ϊ�ο�
			   {
				  pu = new Productuser();
				   pu.setUid(0);
				   pu.setUsername(name);
				   pu.setTel(tele);
				   pu.setEmail(emails);
				   pu.setCompanyname(company);
				   pu.setCompanyaddress(companyadd);
				   try {
					   content = Pd.SaveOrder(con,pu);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//���涩����Ϣ
			   }
			   else//Ϊע���û�
			   {
				   //����û���ҳ�������޸ģ����޸���ϢΪ׼
				   pu.setFullname(name);
				   pu.setTel(tele);
				   pu.setEmail(emails);
				   pu.setCompanyname(company);
				   pu.setCompanyaddress(companyadd);
				   try {
					   content =Pd.SaveOrder(con, pu);//���涩����Ϣ
				} catch (SQLException e) {
					e.printStackTrace();
				}
					
			   } 
			 message="<html xmlns='http://www.w3.org/1999/xhtml'> <head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'/><style type='text/css'> <!-- <br> .table_cc {color:#FFFFFF; font-weight:bold; font-size:12px;} <br> .table_hei {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#000000;} <br> .table_hui {font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold; color:#666666;} --></style></head> <br> <body><table width='550' border='0' cellspacing='0'><tr> <td height='18' colspan='7' bgcolor='#1B83D8'><div align='center' class='table_cc'><div align='left'>��Ʒ��Ϣ</div> </div></td></tr> <tr> <td width='71' height='26' bgcolor='#FFFFFF' class='table_hui'>��catalogno </td> <td width='100' bgcolor='#FFFFFF' class='table_hui'>���� </td><td width='107' bgcolor='#FFFFFF' class='table_hui'> cas </td><td width='64' bgcolor='#FFFFFF' class='table_hui'>formula</td><td width='82' bgcolor='#FFFFFF' class='table_hui'>�۸�</td><td width='59' height='26' bgcolor='#FFFFFF' class='table_hui'>���� </td></tr><br>"+content+" </table>     <table width='550' border='0'><tr> <td height='1' colspan='4' bgcolor='#8CC6FF'></td></tr><tr> <td height='17' colspan='4'  bgcolor='#1B83D8' class='table_cc'>�û���Ϣ </td></tr><tr><td width='78' height='30' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td><td width='91'class='table_hui'>�û����� </td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"+pu.getUsername()+"</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td>  <td width='91' height='23' class='table_hui'>�绰��</td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"+pu.getTel()+"</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>Email:</td> <td width='365' class='table_hui'>"+pu.getEmail()+"</td></tr><tr> <td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>��˾����:</td> <td width='365' class='table_hui'>"+pu.getCompanyname()+"</td></tr></table>  </div></div></body></html>";
			 Mailtb mailtb = new Mailtb();
			 try {
				mailtb = md.findmail();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(mailtb!=null){
				String usrename= mailtb.getFromaddress().substring(0,mailtb.getFromaddress().indexOf("@"));
				SendMail sm=  new SendMail();
				sm.sendMessage(mailtb.getFromaddress(),usrename, mailtb.getFrompassword(),mailtb.getToaddress(), emails,message);
				request.setAttribute("error","��Ķ����Ѿ����͵�����Ա����");
				this.doBrowse(request, response,"/product/checkoutsucc.jsp");
			}else{
				this.doError(request, response, "�ʼ�û������,�������Ա��ϵ");
				}
			//������ﳵ
			ShopCart shopCart =(ShopCart) mysession.getAttribute("shopcart");
			shopCart.emptyCart();
		   }
		   
		  
}
