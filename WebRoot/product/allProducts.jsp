<%@ page language="java" import="com.ascent.bean.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û������ƷȨ��ҳ��</title>
    
   <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/json.js" type="text/javascript"></script> 
<script>
	function add(){
		if(check()){
		//����ĵ�ַ
		var url="userProductAddAction.action";
		var params=Form.serialize('form');
		//����Ajax.Request���󣬶�Ӧ�ڷ�������
				var myAjax = new Ajax.Request(
				url,
				{
					//����ʽ��POST
					method:'post',
					//�������
					parameters:params,
					//�Ƿ��첽��������
					asynchronous:true
				});
				alert("�����Ʒ�ɹ�");
				window.close();
		}else{
		
		   return false;
		}
	}
	
//�ύ��ť�¼� �����Ƿ���ѡ��   
 function check(){
	var bool_check =false;
	if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                if(form.pid[i].checked){
                	bool_check=true;
                	break;
                }
            }
            if(bool_check){
            	//add();
            	//alert("ajax end1");
            	return true;
            }else{
            	alert("��û�����κ�ѡ����ѡ����ύ");
            	return false;
            }
        }
        else
        {
            if(form.pid.checked){
            	//add();
            	//alert("ajax end1");
            	return true;
            }else{
            	alert("��û�����κ�ѡ����ѡ����ύ");
            	return false;
            }
        }
}  
   
   
//ȫѡ��ť�¼�  ѡ�������и�ѡ���  ��ѡ�� �����в���
function selectAll()
{
    if(form.checkall.checked)
    {
        if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                form.pid[i].checked=true;
            }
        }
        else
        {
            form.pid.checked=true;
        }
    }
    else
    {
        if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)  
            {
                form.pid[i].checked=false;
            }
        }
        else
        {
            form.pid.checked=false;
            
        }
    }
}
//ѡ��ĳ����ѡ���¼�  �ж��Ƿ�ȫѡ  ����ȫѡ��ť�Ƿ��
function unselectAll(bool){
	var allselect_bool =false;
 	if(!bool){ //ȡ��ѡ��������ȫѡȡ��
	form.checkall.checked=false;
	}else{ //ѡ�������ж��Ƿ�ȫѡ����=��ȫѡ��ťѡ�� ��=��������
		if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                if(form.pid[i].checked){
                	allselect_bool=true;
                }else{
                	allselect_bool =false;
                	break;
                }
            }
            if(allselect_bool){
             	form.checkall.checked=true;
            }
        }
        else
        {
            if(form.pid.checked){
             form.checkall.checked=true;
            }
            
        }
	}
}


</script> 
  </head>
  
  <body leftmargin="0" topmargin="50">
  	 <h3>��Ȩ��Ʒ</h3>
<%
String uid =(String)request.getParameter("uid");
Productuser p = (Productuser)session.getAttribute("productuser");
 if(p!=null&&p.getSuperuser().equals("3")){
%>
<div id="tipDiv"></div>
<form name="form" action="" method="post">
	<input type="hidden" name="uid" value="<%=uid %>"/>
    <table width="90%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr> 
    <td width="21%"><div align="center">ѡ��</div></td>
    <td width="39%"><div align="center">���</div></td>
    <td width="40%"><div align="center">����</div></td>
  </tr>
 <s:iterator value="#session['allProductList']" status="index">
  <s:if test="#index.odd==true">
  	<tr bgcolor="#f3f3f3" height="25"> 
 </s:if>
 <s:else>
 	<tr bgcolor="#e4f1fe" height="25"> 
 </s:else>
    <td><div align="center"><input type="checkbox" name="pid" value="<s:property value="pid"/>" onclick="unselectAll(this.checked)"/></div></td>
    <td><div align="center"><s:property value="productId"/></div></td>
    <td><div align="center"><s:property value="productname"/></div></td>
  </tr>
 </s:iterator>
 <tr> 
 <td width="21%"><div align="center"><input type="checkbox" name="checkall" onclick="selectAll()"/></div></td>
    <td colspan="2"><div align="center"><input type="submit" value="�ύ" onclick="return add();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Reset" value="ȡ��"/></div></td>
  </tr>
</table>

</form>

<%}
else
{ 
%>

<center><h3>�Բ�����û��Ȩ�޲鿴������</h3></center>
<br><br>
<%} %>  
  </body>
</html>
