<%@ page language="java" import="java.util.*,com.ascent.bean.*,com.ascent.util.*" contentType="text/html;charset=gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
 
</script>
</head>

<body>

<div class="head">
	<div id="login_1">
	
   </div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">�� ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT ����</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">��������ϵͳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">Ա����Ƹ</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">��������</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>
<div class="padding">
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //����Ա
%>
<td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/logina=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg" width="75" height="17" border="0"/></a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>
<%--<%}
	else if(p!=null&&p.getSuperuser().equals("2")){  //��Ȩ���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/logina=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product\userProductsProductManagerAction.action">�鿴�ѷ����Ʒ</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">�鿴����</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/guestPageShowProductManagerAction.action">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>
--%>
<%}
	else if(p==null){  //δע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,�ο�&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>

<%}
	else {  //��ע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/logina=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">�鿴����</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>

<%}%>
</tr>
</table>
<br><br>	
<%
	
	List orderList = (List)session.getAttribute("orderlist");
	if(orderList==null||orderList.size()<1){
%>

<center><h3>�Բ�������û�ж�����</h3></center>
<% }else{ %>
<!-- �����б� -->
<center>
<table width="40%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr bgcolor="#fba661" height="30"> 
    <td><div align="center">���</div></td>
    <td><div align="center">�鿴</div></td>
  </tr>
  <%
    Iterator its= orderList.iterator();
    while(its.hasNext())
    {
       Orders pu = new Orders();
       pu= (Orders)its.next();
       int orderid= pu.getOrderid();
       %>
    <tr>
 	<td><div align="center"><%=orderid%></div></td>
	<td><div align="center"><a href="<%=request.getContextPath()%>/order?a=finditem&oid=<%=orderid %>" >�鿴</a></div></td>
  </tr>
 <%}%>
</table>   
<CENTER><H3><s:property value="tip"/></H3></CENTER>
</div>
</center> 

<%}%>

<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</body>
</html>
