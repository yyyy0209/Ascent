<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form name="" method="post" action="<%=request.getContextPath()%>/user?a=update">
<div class="head">
	<div id="login_1"></div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">�� ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT ����</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">��������ϵͳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">Ա����Ƹ</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">��������</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>
<div class="head">
  <div class="left_products">

	<div class="left_bj4"></div>
</div>
	<% 
		Productuser p = (Productuser)session.getAttribute("productuser");
		if(p!=null&&p.getSuperuser().equals("3")){
		Productuser productuser = (Productuser)session.getAttribute("UID_Productuser");
	%>
<div class="right_proaducts">�ҵ�λ��&gt;&gt;�����������&gt;&gt;�û��޸� </div>

	<table width="580">
		<tr>
		<td height="10" colspan="3"></td>
		</tr>
		<tr>
		<td height="5" colspan="3" bgcolor="#666666"></td>
		</tr>
		<tr>
		<td height="7" colspan="3"></td>
		</tr>
		<tr>
		<td width="15" height="20" bgcolor="#FFFFFF"> </td>
		<td width="110" bgcolor="#BBDDFF" class="table_c"> ���޸��û���Ϣ </td>
		<td width="439" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< ����</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="tip"/></td>
		</tr>
	</table>
	
	<div class="table_wz">
	<table width="470" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#DFEFFD">
  	 <tr>
      <td height="10" colspan="4"></td>
	 </tr>
	 	<div> <input type="hidden" name="uid" value="<%=productuser.getUid()%>"/> </div>
	  <tr>
      <td width="71" height="30" class="table_hui"><div align="right">����:</div></td>
	  <td width="166" height="30" class="table_c">
	  <%
	  	if(productuser.getCity()==null){
	   %>
	   <input name="city" type="text" value="" />
	   <%
	   	}else{
	    %>
	   <input name="city" type="text" value="<%=productuser.getCity()%>" />
      <%
	   	}
	    %>
	  </td>
      <td width="70" class="table_c"><div class="table_hui" id="result_box" dir="ltr">
        <div align="right">�û���:</div>
      </div></td>
      <td width="155" class="table_c"><input name="username" type="text" value="<%=productuser.getUsername()%>" /></td>
      
      <tr>
      <td width="71" height="30" class="table_hui"><div align="right">ȫ��:</div></td>
	  <td width="166" height="30" class="table_c">
	  <%
	  	if(productuser.getFullname()==null){
	   %>
	   <input name="fullname" type="text" value="" />
	   <%
	   	}else{
	    %>
	    <input name="fullname" type="text" value="<%=productuser.getFullname()%>" />	  </td>
      <%
	   	}
	    %>
      <td width="70" class="table_c"><div class="table_hui" id="result_box" dir="ltr">
        <div align="right">Title:</div>
      </div></td>
      <td width="155" class="table_c">
      <%
	  	if(productuser.getTitle()==null){
	   %>
	   <input name="title" type="text" value="" />
	   <%
	   	}else{
	    %>
	    <input name="title" type="text" value="<%=productuser.getTitle()%>" />
      <%
	   	}
	    %>
      </td>
      </tr>
      <tr>
      <td height="30" class="table_hui"><div align="right">�绰:</div></td>
	  <td height="30" class="table_c">
	  <%
	  	if(productuser.getTel()==null){
	   %>
	   <input name="tel" type="text" value="" />
	   <%
	   	}else{
	    %>
	   <input name="tel" type="text" value="<%=productuser.getTel()%>" />	  
      <%
	   	}
	    %>
	    </td>
	  <td height="30" class="table_c"><div class="table_hui" id="div" dir="ltr">
	    <div align="right">����:</div>
	  </div></td>
	  <td height="30" class="table_c"><input name="password" type="password" value="<%=productuser.getPassword()%>" /></td>
	  <tr>
      <td height="25" class="table_hui">        <div align="right">Zip:</div></td>
	  <td height="25" class="table_c">
	   <%
	  	if(productuser.getZip()==null){
	   %>
	   <input name="zip" type="text" value="" />
	   <%
	   	}else{
	    %>
	   <input name="zip" type="text" value="<%=productuser.getZip()%>" />	  	  
      <%
	   	}
	    %>
	    </td>
	  <td height="25" class="table_hui"><div align="right">Job:</div></td>
	  <td height="25" class="table_hui"><span class="table_c">
	    <%
	  	if(productuser.getJob()==null){
	   %>
	   <input name="job" type="text" value="" />
	   <%
	   	}else{
	    %>
	   <input name="job" type="text" value="<%=productuser.getJob()%>" />  	  
      <%
	   	}
	    %> 
	    
	  </span></td>
	 </tr>
	<tr>
      <td height="30" class="table_hui"><div align="right">Email:</div></td>
	  <td height="30" class="table_c"><input name="email" type="text" value="<%=productuser.getEmail()%>"  /></td>
	  <td height="30" class="table_hui"><div align="right">����:</div></td>
	  <td height="30" class="table_c">
	 <%
	  	if(productuser.getCountry()==null){
	   %>
	   <input name="country" type="text" value="" />
	   <%
	   	}else{
	    %>
	    <input name="country" type="text" value="<%=productuser.getCountry()%>" />  	  
      <%
	   	}
	    %> 
	 
	  </td>
	</tr>
	 <tr>
      <td height="30" class="table_hui"><div align="right">��˾����:</div></td>
	  <td height="30" colspan="3" class="table_c">
	  <%
	  	if(productuser.getCompanyname()==null){
	   %>
	   <input name="companyname" type="text" value="" />
	   <%
	   	}else{
	    %>
	     <input name="companyname" type="text" value="<%=productuser.getCompanyname()%>"/>	  
      <%
	   	}
	    %> 
	 </td>
	 </tr>
	 <tr>
      <td height="25" colspan="4" class="table_hui"><span class="table_hui">&nbsp;&nbsp;��˾��ַ: </span>
        <%
	  	if(productuser.getCompanyaddress()==null){
	   %>
	   <input name="companyaddress" type="text" value="" />
	   <%
	   	}else{
	    %>
	     <input name="companyaddress" type="text" value="<%=productuser.getCompanyaddress()%>" />
      <%
	   	}
	    %>  
      </td>  
	  </tr>
	   <tr>
      <td height="25" colspan="4" class="table_hui"><span class="table_hui">��ע:</span>
       <%
	  	if(productuser.getNote()==null){
	   %>
	   <textarea name="note" cols="70" rows="8"></textarea>
	   <%
	   	}else{
	    %>
	    <textarea name="note" cols="70" rows="8"> <%=productuser.getNote()%></textarea>
      <%
	   	}
	    %>
       </td>
	</tr>
	  
	<tr>
      <td height="45" colspan="4"><div align="center">
        <input name="Submit" type="submit" class="table_hui" value="����" />
      </div></td>
	 </tr>  
	
 </table>
</div>

</div>
<%}else	//�������if��else
{ 
%>
<br><br>
<br><br><br><center><h3>�Բ�����û��Ȩ�޲鿴������</h3></center>
<%} %> 
</form>

</body>
</html>
