<%@ page language="java" import="java.util.*,com.ascent.bean.*"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ʼ�����</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
   <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
   
   <script type="text/javascript">
   		function check(){
   			if(form.fromaddressname.value==""){
   				alert("�������ʼ���ַ");
   				form.fromaddressname.focus();
   				return false;
   			}
   			if(form.frompassword.value==""){
   				alert("�������ʼ�����");
   				form.frompassword.focus();
   				return false;
   			}
   			return true;
   		}
   		
  
 function findEmail(){
   send_request("<%=request.getContextPath()%>/mail?a=all");
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
			   document.getElementById('xianshi').innerHTML="����Ա���䣺";
			   document.getElementById('email').innerHTML=divhtml;
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
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //����Ա
%>
<div class="padding">
<div id="middlebody">
	<table width="800">
		<tr>
		<td height="20" colspan="6" background="" class="" border="0"><div class="table_t" id="result_box" dir="ltr">
		  <div align="right">���� </div>
		</div></td>
	</table>
	<a href="javascript:history.go(-1);">����>>></a>
  <div id="xianshi"><a href="javascript:findEmail();">��������</a></div><div id="email"></div>

  <p align="center">����Ա��������</p>
<form name="form" method="post" action="mail?a=save">
  <div align="center">
  <table width="50%" border="1" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC">
  <tr> 
        <td width="26%"><div align="center">�����ַ </div>
          <div align="center"></div></td>
    <td width="43%">
            <input name="fromaddressname" type="text" id="fromaddressname">
          </td>
    <td width="31%"><select name="fromaddresstype" id="fromaddresstype">
            <option value="@163.com">@163.com</option>
            <option value="@126.com">@126.com</option>
            <option value="@sohu.com">@sohu.com</option>
            <option value="@sina.com">@sina.com</option>
            <option value="@gmail.com">@gmail.com</option>
          </select></td>
  </tr>
  <tr> 
    <td><div align="center">��������</div></td>
    <td><input name="frompassword" type="password" id="frompassword"></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center">�ռ�Email</div></td>
    <td><input name="toaddress" type="text" id="toaddress"></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><div align="center">
            <input type="submit" name="Submit" value="�ύ" onclick="return check();">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="Reset" name="Reset" value="ȡ��">
          </div></td>
  </tr>
</table>

</div>
<div><br>������<br>
<1>����ȷ�����÷������ַ�����룬���ʼ��Ǹ������ʼ��ĵ�ַ<br>
<2>����ȷ�������ռ����ַ�����ʼ��ǽ����ʼ��ĵ�ַ�����ͻ���<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ύ���ʼ��ᷢ�͵����ʼ�<br>
<3>������ʱ�����������Լ������䣬�����ʼ���ַ���޷��鿴����
</div>
</div>

<%}
else{ 
%>
<div class="padding">
<div id="middlebody">
<center><font size="3">����Ȩ�������ҳ</font></center>
</div>
</div>
<%}%>

<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</form>
</body>
</html>