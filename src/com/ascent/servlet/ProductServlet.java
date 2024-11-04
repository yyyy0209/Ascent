package com.ascent.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Product;
import com.ascent.bean.Productuser;
import com.ascent.dao.ProductDAO;
import com.jspsmart.upload.SmartUpload;


public class ProductServlet extends HttpServlet {
	 private static final String CONTENT_TYPE = "text/html; charset=GBK";
	 private   ServletContext sc=null;
	 private ServletConfig config=null;
	 private String uploadPath = "upload"; // ���ڴ���ϴ��ļ���Ŀ¼
	 public void init() throws ServletException {
		 super.init();
		 sc=this.getServletContext();
		 config=this.getServletConfig();
			
		    // �ļ��в����ھ��Զ�������
		    if(!new File(uploadPath).isDirectory())
		        new File(uploadPath).mkdirs();
	 }
	

//	Process the HTTP Post request
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    doGet(request, response);
	  }
	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   String state=request.getParameter("a");
	   if (state.equals("all"))//����ǲ�ѯ��Ʒ�������ѯҵ�񡣣�all��ʾ��ѯ���У�
	   {
		  this.produceall(request, response);
	   }
	   if(state.equals("save"))
	   {
		   this.productadd(request, response);
	   }
	   if(state.equals("search"))
	   {
		   this.productSerach(request, response);
	   }
	   if(state.equals("updateProduct"))//ִ�и��µĲ�ѯ
	   {
		 this.productSerachbyid(request, response);
	   }
	   if(state.equals("update"))//���������Ϣ
	   {
		 this.updateproduct(request, response);
	   }
	   if(state.equals("del"))//���������Ϣ
	   {
		 this.deleteproduct(request, response);
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
	   public void produceall(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   ProductDAO Pd = new ProductDAO();
		   List ProcuctList= Pd.getallProduct();
		   if(ProcuctList==null)
		   {
			   this.doError(request, response,"productuserL_tip.login.fail");
		   }
		   else
		   {
				HttpSession mysession = request.getSession(false);
				Productuser pu= (Productuser)mysession.getAttribute("productuser");
				mysession.setAttribute("productlist", ProcuctList);
				if(pu==null)//������ο�
				{
					this.doBrowse(request, response,"/product/products_show.jsp");
				}else// �����ע���û�
				{
					if(pu.getSuperuser().equals("3"))//�ж��Ƿ����Ա�����Ʒҳ����Ϊ����Ա�ͷǹ���Ա�����Ʒ��
					{
					this.doBrowse(request, response,"/product/admin_products_show.jsp");	
					}
					else
					{	
					this.doBrowse(request, response,"/product/products_show.jsp");
					}
				}
		   } 
	   }
	   //�޸ķ�����
	   //�����Ʒ
	   public void productadd(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		 
		      SmartUpload mySmartUpload =new SmartUpload();
		      try { 
		       // Initialization
		       mySmartUpload.initialize(config, request, response);
		       mySmartUpload.setMaxFileSize(500 * 1024);
		       // Upload
		       mySmartUpload.upload();
		       //ȡ��text���е�����
		       String proid= mySmartUpload.getRequest().getParameter("productId");
			   String pname= mySmartUpload.getRequest().getParameter("productname");
			   String pcatalogno= mySmartUpload.getRequest().getParameter("catalogno");
			   String pcas= mySmartUpload.getRequest().getParameter("cas");
			   String pmdlnumber= mySmartUpload.getRequest().getParameter("mdlnumber");
			   String pnewproduct= mySmartUpload.getRequest().getParameter("newproduct");
			   String pformula= mySmartUpload.getRequest().getParameter("formula");
			   String pmw= mySmartUpload.getRequest().getParameter("mw");
			   String pcategory= mySmartUpload.getRequest().getParameter("category");
			   String pstock= mySmartUpload.getRequest().getParameter("stock");
			   String prealstock= mySmartUpload.getRequest().getParameter("realstock");
			   String pprice1= mySmartUpload.getRequest().getParameter("price1");
			   String pprice2= mySmartUpload.getRequest().getParameter("price2");
			   String pnote= mySmartUpload.getRequest().getParameter("note");
			   Product pdt = new Product();
			   pdt.setProductId(proid);
			   pdt.setProductname(pname);
			   pdt.setCatalogno(pcatalogno);
			   pdt.setCas(pcas);
			   pdt.setMdlnumber(pmdlnumber);
			   pdt.setNewproduct(pnewproduct);
			   pdt.setFormula(pformula);
			   pdt.setMw(pmw);
			   pdt.setCategory(pcategory);
			   pdt.setStock(pstock);
			   pdt.setRealstock(prealstock);
			   pdt.setPrice1(pprice1);
			   pdt.setPrice2(pprice2);
			   pdt.setNote(pnote);
			   com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0); 
		        //��ȡ�ϴ��ļ����ƺͺ�׺
		        String fileName = myfile.getFileName(); 
		        if(fileName!=null&&!fileName.equals(""))
		        {
		        pdt.setStructure(fileName);  
		        myfile.saveAs("/"+uploadPath+"/"+ fileName,1);
		        }
		       System.out.println("uploading  success! "); 
		       ProductDAO Pd = new ProductDAO();
		       Pd.Saveproduct(pdt);
		      } catch (Exception e) { 
		       System.out.println("Unable to upload the file.<br>"); 
		       System.out.println("Error : " + e.toString()); 
		      } 
		      try {
				this.produceall(request, response);
			   } catch (ServletException e) {
				e.printStackTrace();
			  }
	   }
	   
	   public void productSerach(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String searchNames= request.getParameter("searchName");
		   String searchValues=request.getParameter("searchValue");
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   List ProductList= Pd.SearchProcuct(searchNames, searchValues);
		   mysession.setAttribute("searchproductlist", ProductList);
		   this.doBrowse(request, response,"/product/products_search_show.jsp");
	   }
	   
	   public void productSerachbyid(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String productid= request.getParameter("pid");
		   int pid = Integer.valueOf(productid);
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   Product product= Pd.getProductbyPid(pid);
		   mysession.setAttribute("pid_product", product);
		   this.doBrowse(request, response,"/product/update_products_admin.jsp");
	   }
	   //���²�Ʒ
	   public void updateproduct(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   SmartUpload mySmartUpload =new SmartUpload();
		      try { 
		       // Initialization
		       mySmartUpload.initialize(config, request, response);
		       mySmartUpload.setMaxFileSize(500 * 1024);
		       // Upload
		       mySmartUpload.upload();
		       //ȡ��text���е�����
		       String productid= mySmartUpload.getRequest().getParameter("pid");
		       int pid = Integer.valueOf(productid);
		       String proid= mySmartUpload.getRequest().getParameter("productId");
			   String pname= mySmartUpload.getRequest().getParameter("productname");
			   String pcatalogno= mySmartUpload.getRequest().getParameter("catalogno");
			   String pcas= mySmartUpload.getRequest().getParameter("cas");
			   String pmdlnumber= mySmartUpload.getRequest().getParameter("mdlnumber");
			   String pnewproduct= mySmartUpload.getRequest().getParameter("newproduct");
			   String pformula= mySmartUpload.getRequest().getParameter("formula");
			   String pmw= mySmartUpload.getRequest().getParameter("mw");
			   String pcategory= mySmartUpload.getRequest().getParameter("category");
			   String pstock= mySmartUpload.getRequest().getParameter("stock");
			   String prealstock= mySmartUpload.getRequest().getParameter("realstock");
			   String pprice1= mySmartUpload.getRequest().getParameter("price1");
			   String pprice2= mySmartUpload.getRequest().getParameter("price2");
			   String pnote= mySmartUpload.getRequest().getParameter("note");
			   Product pdt = new Product();
			   pdt.setPid(pid);
			   pdt.setProductId(proid);
			   pdt.setProductname(pname);
			   pdt.setCatalogno(pcatalogno);
			   pdt.setCas(pcas);
			   pdt.setMdlnumber(pmdlnumber);
			   pdt.setNewproduct(pnewproduct);
			   pdt.setFormula(pformula);
			   pdt.setMw(pmw);
			   pdt.setCategory(pcategory);
			   pdt.setStock(pstock);
			   pdt.setRealstock(prealstock);
			   pdt.setPrice1(pprice1);
			   pdt.setPrice2(pprice2);
			   pdt.setNote(pnote);
		 	   com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0); 
		        //��ȡ�ϴ��ļ����ƺͺ�׺
		        String fileName = myfile.getFileName(); 
		        System.out.println(fileName+"----�ļ���·��-"+myfile);
		        if(fileName!=null&&!fileName.equals(""))
		        {
		        pdt.setStructure(fileName);
		        myfile.saveAs("/"+uploadPath+"/"+ fileName,1);
		        }
		       System.out.println("uploading  success! "); 
		       ProductDAO Pd = new ProductDAO();
		    	   Pd.Updateproduct(pdt);
		        System.out.println("�Ǹ��²���");
		      } catch (Exception e) { 
		       System.out.println("Unable to upload the file.<br>"); 
		       System.out.println("Error : " + e.toString()); 
		      } 
		      try {
				this.produceall(request, response);
			   } catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			  }
	   }
	   //ɾ����Ʒ
	   public void deleteproduct(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String productid= request.getParameter("pid");
		   int pid = Integer.valueOf(productid);
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   Pd.DelProductbyPid(pid);
		   List ProcuctList= Pd.getallProduct();
		   mysession.setAttribute("productlist", ProcuctList);
		   this.doBrowse(request, response,"/product/admin_products_show.jsp");
	   }
	   
	   
}

