package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ascent.bean.Orderitem;
import com.ascent.bean.Orders;
import com.ascent.bean.Product;
import com.ascent.bean.Productuser;
import com.ascent.util.DataAccess;

public class OrderDAO {
	
	public String  SaveOrder(Collection con,Productuser pu) throws SQLException
	{
		
		Connection conn =	(Connection) DataAccess.getConnection();
		Statement st;
		String content ="";//�ʼ�����
		int uid = pu.getUid();
		if(uid==0)//Ϊ�ο�
		{
			Iterator it = con.iterator();
			while(it.hasNext()){
				Product p = (Product)it.next();
				///Ϊ���ʼ�����
				String name  = p.getProductname();
				//String price = p.getPrice1();
				String catalog = p.getCatalogno();
				String cas =p.getCas();
				String formula = p.getCategory();
				String mw= p.getPrice1();
				String quantity =p.getQuantity();
				String temp = "<tr  bgcolor='#99CCFF'> <td width='71' class='table_hei'>"+catalog+"</td><td width='100' class='table_hei'>"+name+"</td><td width='107' class='table_hei'>"+cas+"</td><td width='64' class='table_hei'>"+formula+"</td><td  width='82' class='table_hui'>"+mw+" ��</td><td width='59' height='26'  class='table_hui'>"+quantity+"</td></tr>";
				content += temp;
			}
		}else//Ϊע���û�
		{
		Orders orders = new Orders();//����
		orders.setUid(pu.getUid()); //���ö���uid
	    //�ѵ�ǰʱ��Ϊ���涩����ʱ��
		 Date currentTime = new Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateString = formatter.format(currentTime);

		//���涩��
		st=conn.createStatement();
		String sql="insert into orders (uid,datetime,delsoft) values ("+pu.getUid()+",'"+dateString+"','"+1+"')";
		st.executeUpdate(sql);
		String sqls = "select * from orders o where o.uid="+pu.getUid()+" and o.datetime='"+dateString+"'";
		ResultSet rs= st.executeQuery(sqls);
		int orderid=0;
		while(rs.next())
		{
			orderid=rs.getInt("orderid");//��ȡ�±���Ķ���
		}
		st.close();
		//��ӹ��ﳵ��Ʒ����
		if(orderid!=0)//�����Ŵ���
		{
			Iterator it = con.iterator();
			while(it.hasNext()){
				Product p = (Product)it.next();
				//Orderitem oi = new Orderitem();//������Ҫ��ӵ�set�е�ÿ��orderitem
				//oi.setPid(p.getPid());//����ÿ��orderitem��pid
				//oi.setQuantity(p.getNumber());//����ÿ��orderitem������
				//oi.setOrderid(orderid);//��Ӷ�����id;
				st=conn.createStatement();
				String sqlor="insert into orderitem (orderid,pid,quantity) values ("+orderid+",'"+p.getPid()+"','"+p.getQuantity()+"')";
			    st.executeUpdate(sqlor);
				
				//���汣�涩�� ����Ϊ���ʼ�����
				String name  = p.getProductname();
				//String price = p.getPrice1();
				String catalog = p.getCatalogno();
				String cas =p.getProductname(); 
				String formula = p.getCategory();
				String mw= p.getPrice1();
				String quantity =p.getQuantity();
				String temp = "<tr  bgcolor='#99CCFF'> <td width='71' class='table_hei'>"+catalog+"</td><td width='100' class='table_hei'>"+cas+"</td><td width='107' class='table_hei'>"+name+"</td><td width='64' class='table_hei'>"+formula+"</td><td  width='82' class='table_hui'>"+mw+" ��</td><td width='59' height='26'  class='table_hui'>"+quantity+"</td></tr>";
				content += temp;
			}
			st.close();
			conn.close();
		}
		else
		{
			System.out.println("��������ʧ��");
		}
		
		}	
		return content;
	}
	//����ע���û��Ķ���
	public List OrderList(int uid)throws SQLException
	{
		List list =new ArrayList();
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="select * from orders o where o.uid="+uid+" and o.delsoft=1 order by o.orderid desc";
		st=con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{
			Orders od = new Orders();
			od.setOrderid(rs.getInt("orderid"));
			od.setUid(rs.getInt("uid"));
			od.setDatetime(rs.getString("datetime"));
			list.add(od);
		}
	   rs.close();
	   st.close();
	   con.close();
	   return list;
	}
	//�������ж���
	public List OrderAllList()throws SQLException
	{
		List list =new ArrayList();
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="select * from orders o where o.delsoft=1 order by o.orderid desc";
		st=con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{
			Orders od = new Orders();
			od.setOrderid(rs.getInt("orderid"));
			od.setUid(rs.getInt("uid"));
			od.setDatetime(rs.getString("datetime"));
			list.add(od);
		}
	   rs.close();
	   st.close();
	   con.close();
	   return list;
	}
	public List OrderItem(int orderid)throws SQLException
	{
		List list =new ArrayList();
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="select * from product where pid in(select pid from orderitem o where o.orderid="+orderid+")";
		st=con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{
			 Product pu= new Product();
	         pu.setPid(rs.getInt("pid"));
	         pu.setProductId(rs.getString("product_id"));
	         pu.setProductname(rs.getString("productname"));
	         pu.setCatalogno(rs.getString("catalogno"));
	         pu.setCas(rs.getString("cas"));
	         pu.setFormula(rs.getString("formula"));
	         pu.setMdlnumber(rs.getString("mdlnumber"));
	         pu.setMw(rs.getString("mw"));
	         pu.setNewproduct(rs.getString("newproduct"));
	         pu.setStructure(rs.getString("structure"));
	         pu.setRealstock(rs.getString("realstock"));
	         pu.setPrice1(rs.getString("price1"));
	         pu.setPrice2(rs.getString("price2"));
	         pu.setCategory(rs.getString("category"));
	         pu.setNote(rs.getString("note"));
	         pu.setStock(rs.getString("stock"));
	         pu.setNote(rs.getString("note"));
	         pu.setDelFlag(rs.getInt("del_flag"));
	         list.add(pu);
		}
	   rs.close();
	   st.close();
	   con.close();
	   return list;
	}

	//ɾ�����������Ʒ��Ϣ
	public void delOrderItem(int pid,int orderid)throws SQLException
	{
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="delete from orderitem  where orderid="+orderid+" and pid ="+pid;
		st=con.createStatement();
		st.executeUpdate(sql);
	    st.close();
	    con.close();
	}
//	ɾ������(����ɾ��)
	public void delOrder(int orderid)throws SQLException
	{
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="delete from orders  where orderid="+orderid;
		String sqls="delete from orderitem  where orderid="+orderid;
		st=con.createStatement();
		st.executeUpdate(sqls);//ɾ�����������Ʒ
		st.executeUpdate(sql);//ɾ������
	    st.close();
	    con.close();
	}
//	ɾ������(����ɾ��)
	public void delOrdersoft(int orderid)throws SQLException
	{
		Connection con = DataAccess.getConnection();
		Statement st;
		String sql="update orders set delsoft='0' where orderid="+orderid;
		st=con.createStatement();
		st.execute(sql);
	    st.close();
	    con.close();
	}


}
