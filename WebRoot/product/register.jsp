<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>ע��ҳ��</title>
	<link href="css/index.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
/* ҳ��������ʽ */
body, td, input {
    font-family:Arial;
    font-size:12px;
}
/* ��������ʽ */
table.default {
    border-collapse:collapse;
    width:350px;
}
/* ���Ԫ����ʽ */
table.default td {
    border:1px solid black;
    padding:3px;
}
/* ��ͷ��ʽ */
table.default td.item {
    background:#0e59c0;
    color:#fff;
}
/* ������Ϣ��ʽ */
div.ok {
    color:#006600;
}
/* ������Ϣ��ʽ */
div.warning {
    color:#FF0000;
}
</style>
<script src="js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="js/json.js" type="text/javascript"></script>
<script  language="javascript"  >
	function refresh(){
		//���»�ȡ��֤��ͼƬ��src����
		document.getElementById("authImg").src='authImg?now='+new Date();
	}

	function checkUserName(){
		//����ĵ�ַ
		var url="registCheckAction.action";
		var params=Form.Element.serialize('username');
		//����Ajax.Request���󣬶�Ӧ�ڷ�������
				var myAjax = new Ajax.Request(
				url,
				{
					//����ʽ��POST
					method:'post',
					//�������
					parameters:params,
					//ָ���ص�����
					onComplete: processResponse,
					//�Ƿ��첽��������
					asynchronous:true
				});
	}
	
	
	function processResponse(request)
			{
				var action = request.responseText.parseJSON();
				$("usernameCheckDiv").innerHTML = action.tip;
			}	

	function check(){
	if(form.username.value == "")
    {
       alert("�û�������Ϊ�գ�"); 
       form.username.focus();
        return false;
    }
   if(form.password.value == "")
    {
        alert("���������� ��");
        form.password.focus();
         return false;
    }
     if(form.password2.value == "")
    {
        alert("���ٴ��������� ��");
       form.password2.focus();
         return false;
    }
    if(form.password.value!=form.password2.value){
    
       alert("������������벻һ�� ��");
        form.password2.focus();
         return false;
    }
    if(form.email.value == "")
    {
        alert("�������ʼ� ��");
        form.email.focus();
         return false;
    }
    
 var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//��֤Mail��������ʽ,^[a-zA-Z0-9_-]:��ͷ����Ϊ��ĸ,�»���,����,
  if (form.email.value!="" && !form.email.value.match(regm) )
   		 {
     		alert("�ʼ���ʽ���ԣ������������룡");
	     	form.email.focus();
             return false;
   		 }  
   if(form.code.value==""){
   		alert("��������֤�룡");
        form.code.focus();
         return false;
   }
  else 
    return true;
}

</script>
</head>
<body> 
 <!-- 
onsubmit="alert('�����ע������봫ͳ��ʽ��ͬ��');return false"
-->
<div><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font  size="2"><a href="javascript:history.back()"><<<< ����</a></font>
<div align="center">
<h1>ע����Ϣ</h1>
<br>
<% String error = (String)request.getAttribute("error");
 System.out.println("000000000"+error);
 if(error!=null)
 {
 %>
 <%=error %>
 <%
 }
 %>
</div>
</div>
<div align="center">


<form name="form" method="post"  action="<%=request.getContextPath()%>/user?a=regis" />

<table width="400" class="default">

<tr>

    <td class="item" width="41%"><div align="center">�û�����</div></td>

    <td width="59%">

        <input type="text" name="username" id="username" onblur="checkUserName()">&nbsp;&nbsp;<font color="red">*</font>

        <div id="usernameCheckDiv" class="warning"></div>    </td>
</tr>

<tr>

    <td class="item"><div align="center">����: </div></td>

    <td><input type="password" name="password" id="password" >&nbsp;&nbsp;<font color="red">*</font>
      </td>
</tr>

<tr>

    <td class="item"><div align="center">����ȷ��:</div></td>

    <td>

        <input type="password" name="password2" id="password2" >&nbsp;&nbsp;<font color="red">*</font>
   </td>
</tr>

<tr>

    <td class="item"><div align="center">��˾����:</div></td>

    <td>

        <input type="text" name="companyname" id="companyname" /></td>
</tr>
<tr>

    <td class="item"><div align="center">��˾��ַ:</div></td>

    <td>

        <input type="text" name="companyaddress" id="companyaddress" /></td>
</tr>
<tr>

    <td class="item"><div align="center">����:</div></td>

    <td>

        <input type="text" name="country" id="country" /></td>
</tr>
<tr>

    <td class="item"><div align="center">����:</div></td>

    <td>

        <input type="text" name="city" id="city" /></td>
</tr>
<tr>

    <td class="item"><div align="center">����:</div></td>

    <td>

        <input type="text" name="job" id="job" /></td>
</tr>
<tr>

    <td class="item"><div align="center">�绰:</div></td>

    <td>

        <input type="text" name="tel" id="tel" /></td>
</tr>
<tr>

    <td class="item"><div align="center">Zip:</div></td>

    <td>

        <input type="text" name="zip" id="zip"/></td>
</tr>
<tr>

    <td class="item"><div align="center">Email:</div></td>

    <td>

        <input type="text" name="email" id="email" >&nbsp;&nbsp;<font color="red">*</font>
</td>
</tr>
<tr>
 <td class="item"><div align="center">��֤��:</div></td>

    <td>

        <input type="text" name="code" id="code" >&nbsp;&nbsp;<font color="red">*</font>

        <div id="codeCheckDiv" class="warning"><img src="authImg" id="authImg"/><a href="product/register.jsp#" onClick="refresh()">��һ��</a></div></td>
    
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="ע��" onClick="return check();" /> <input type="Reset" value="ȡ��"  /></td>
</tr>
</table>

</form>


</div>
   

  </body>
</html>
