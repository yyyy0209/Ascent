<%@ page language="java" import="java.util.*,com.ascent.bean.*,com.ascent.util.*" contentType="text/html;charset=gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
 function updateQuantity(obj,str){
   var pid = str;
   var quantity =obj.value;
   //alert(pid);
   //alert(quantity);
   //return false;
   send_request("<%=request.getContextPath()%>/shopcart?a=updateNum&pid="+pid+"&quantity="+quantity);
  } 
  
  var http_request = false;
	function send_request(url)
	{ //��ʼ����ָ������������������ĺ���
	   //alert("url\t"+url);
		http_request = false;
		//��ʼ��ʼ��XMLHttpRequest����
		if(window.XMLHttpRequest) 
		{ //Mozilla �����
			http_request = new XMLHttpRequest();
			if(http_request.overrideMimeType) 
			{//����MiME���
				http_request.overrideMimeType('text/xml');
			}
		}
		else if(window.ActiveXObject) 
		{ // IE�����
			try 
			{
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch(e) 
			{
				try 
				{
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}
		}
		if(!http_request) 
		{ // �쳣����������ʵ��ʧ��
			window.alert("���ܴ���XMLHttpRequest����ʵ��.");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
		http_request.open("POST", url, true);
		http_request.send(null);
	}
	// ��������Ϣ�ĺ���
    function processRequest() 
    {
        if (http_request.readyState == 4) 
        { // �ж϶���״̬
            if (http_request.status == 200) 
            { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
               var divhtml = http_request.responseText;
			   alert(divhtml);
            }
        }
       
   } 
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
<div id="middlebody">
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //����Ա
	
%>
<td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg" width="75" height="17" border="0"/></a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">��������</a></div></td>
<%--<%}
	else if(p!=null&&p.getSuperuser().equals("2")){  //��Ȩ���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/clearSession.action" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product\userProductsProductManagerAction.action">�鿴�ѷ����Ʒ</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\showOrdersManagerAction.action">�鿴����</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">��������</a></div></td>
--%>

<%}
	else if(p==null){  //δע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,�ο�&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">��������</a></div></td>

<%}
	else{  //��ע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\order?a=all">�鿴����</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">��������</a></div></td>
<%}%>
</tr>
</table>
<br><br>	

<!-- ��Ʒ�б� --> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr bgcolor="#fba661" height="30"> 
    <td><div align="center">���</div></td>
    <td><div align="center">����</div></td>
    <td><div align="center">catalogno</div></td>
    <td><div align="center">���</div></td>
    <td><div align="center">����</div></td>
    <td><div align="center">ɾ��</div></td>
  </tr>
 
  <%
 
    Collection list= (Collection)session.getAttribute("shopcartlist");
    Iterator its= list.iterator();
    while(its.hasNext())
    {
      Product pu = new Product();
       pu= (Product)its.next();
       int id= pu.getPid();
       String num = pu.getQuantity();
       %>
    <tr bgcolor="#f3f3f3" height="25"> 
    <td width="10%"><div align="center"><%=pu.getProductId()%></div></td>
    <td width="13%"><div align="center"><%=pu.getProductname()%></div></td>
    <td width="12%"><div align="center"><%=pu.getCatalogno()%></div></td>
    <td width="13%"><div align="center"><%= pu.getRealstock()%></div></td>
   <%if (num==null||num.equals("")){
    %>
     <td width="13%"><div align="center"><input name="number" value="5g" onchange="updateQuantity(this,<%=id%>)" /></div></td>
    <%
     }else{%>
      <td width="13%"><div align="center"><input name="number" value="<%=num%>" onchange="updateQuantity(this,<%=id%>)" /></div></td>
     <%} %>
    <td width="13%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=move&pid=<%=id%>">ɾ��</a></div></td>
 </tr>
 <%}%>
  
 
</table>   
<CENTER><H3><!--  input type="text" name="tip" value="tip"/--></H3></CENTER>
</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div>
</body>
</html>
