<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" pageEncoding="GB2312" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">

function updaetusertype(Obj)
  {
  	///var proid = Obj.value;
  	var proid = Obj.name;
  	if(window.confirm("Are you sure?") == false)
        {
			return;
        }
        else
        {
            send_request('<%=path%>/update_usertype.do?title='+proid);
        }
  }


function deleteuser()
{
   var from = form.infoid;
   var checkNum = 0; 
 for(var i=0;i<form.infoid.length;i++)   
   {  
     if(form.infoid[i].type == "checkbox")
    {
      if (form.infoid[i].checked)
      {
        checkNum++;
        alert(checkNum);
        break;
      }
   }
  }   
 if(checkNum < 1)
    {
		alert("Please select information to delete");
        return;
    }
    else
    {
		if(window.confirm("Are you sure? ") == false)
        {
			return;
        }
        else
        {
            form.action="<%=request.getContextPath()%>/deleteproductuser.do";
		    form.submit();
        }
    }	
}



function addproject(Obj){
  	var proid = Obj.name;
  	var strs = window.showModalDialog('<%=request.getContextPath()%>/useraddproduct.do?id='+proid+'',window,'dialogWidth:300pt;dialogHeight:240pt;status:no;help:no;scroll:auto;');
  }
function updateuser(Obj){
  	var proid = Obj.name;
  	////var strs = window.showModalDialog('useraddproduct.do?id='+proid+'',window,'dialogWidth:300pt;dialogHeight:240pt;status:no;help:no;scroll:auto;');
    //form.action="<%=request.getContextPath()%>/updateadmin.do?id="+proid;
	//form.submit();
  }  
  
 function  returnresult()
 {
  alert("chenggong");
 }
 function selectAll()
{
    if(form.allck.checked)
    {
        if(form.infoid.length>0)
        {
            for(var i=0;i<form.infoid.length;i++)
            {
                form.infoid[i].checked=true;
            }
        }
        else
        {
            form.infoid.checked=true;
        }
    }
    else
    {
        if(form.infoid.length>0)
        {
            for(var i=0;i<form.infoid.length;i++)  
            {
                form.infoid[i].checked=false;
            }
        }
        else
        {
            form.infoid.checked=false;
        }
    }
}
 
 function openwin(uid) { 
	//alert("openwin"+uid);
	window.open ("<%=request.getContextPath()%>/product/allProducts.jsp?uid="+uid, "newwindow", " top=50 , left=400 ,height=300, width=400, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no") ;
	//д��һ�� 
	//window.showModalDialog("<%=request.getContextPath()%>/product/allProducts.jsp?uid="+uid,window,'dialogWidth:300pt;dialogHeight:240pt;status:no;help:no;scroll:auto;');

	} 
	
	function confirm_oper(){
		if (!confirm("ȷ���ò�����")) return false;
	}
</script>

</head>

<body>
<form name="form" method="post" action="">

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
<div class="padding">
<div id="middlebody">
<div id="div1"> 
	<%
		Productuser p = (Productuser)session.getAttribute("productuser");
		if(p!=null&&p.getSuperuser().equals("3")){
		
	%>
		
	<tr>
<td height="20"><div class="table_t">|&nbsp;&nbsp;��ӭ,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div></td>
</tr>
</div>
<br/>

<div> <a href="<%=request.getContextPath()%>/user?a=all"><img src="<%=request.getContextPath()%>\images\userlist.jpg"  border="0"/></a>&nbsp&nbsp&nbsp&nbsp<a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg"  border="0"/></a> &nbsp&nbsp&nbsp&nbsp   <a href="<%=request.getContextPath()%>\product\mailmanager.jsp"><img src="<%=request.getContextPath()%>\images\mailmanager.jpg"  border="0"/> </a></div>

<br/>

<!-- �������û��б� --> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="mars" >
  <tr bgcolor="#fba661" height="25"> 
    <td width="10%"><div align="center">�û���</div></td>
    <td width="13%"><div align="center">Email</div></td>
    <td width="12%"><div align="center">�绰</div></td>
    <td width="13%"><div align="center">��˾����</div></td>
    <td width="13%"><div align="center">��ɫ</div></td>
    <td width="9%"><div align="center">�޸�</div></td>
    <td width="10%"><div align="center">��ɫ�޸�</div></td>
    <td width="10%"><div align="center">״̬</div></td>
  </tr>
  <%
 ////PageBean pBean = (PageBean)session.getAttribute("productuser_page_list");
    List list= (ArrayList)session.getAttribute("allproductlist");
    Iterator its= list.iterator();
    while(its.hasNext())
    {
       Productuser pu = new Productuser();
       pu= (Productuser)its.next();
       String state= pu.getSuperuser();
       String del=String.valueOf(pu.getDelFlag().intValue());
       %>
    <tr bgcolor="#f3f3f3" height="25"> 
    <td width="10%"><div align="center"><%=pu.getUsername()%></div></td>
    <td width="13%"><div align="center"><%=pu.getEmail()%></div></td>
    <td width="12%"><div align="center"><%=pu.getTel()%></div></td>
    <td width="13%"><div align="center"><%=pu.getCompanyname()%></div></td>
    <%if(state.equals("3")) { %>
    <td width="13%"><div align="center">����Ա</div></td>
    <%}else{ %>
      <td width="13%"><div align="center">��ͨ�û�</div></td>
    <%} %>
    <td width="9%"><div align="center"><a href="user?a=finduser&uid=<%=pu.getUid()%>"><img src="<%=request.getContextPath()%>\images\update1.gif" width="20" height="20" border="0" alt="�޸�"/></a></div></td>
    <td width="10%"><div align="center">
    <a href="<%=request.getContextPath()%>\product\changesuperuser.jsp?uid=<%=pu.getUid()%>&superuser=<%=state%>"><img src="<%=request.getContextPath()%>\images\Changeuser.gif" width="20" height="20" border="0" alt="��ɫ�޸�"/></a>
    </div>
    </td>
    <%if(state.equals("3")) { %>
    	<td><div align="center">�޲���</div></td>
    <%}else if(del.equals("1")){%>
     <td><div align="center"><a href="user?a=delsuser&uid=<%=pu.getUid()%>&value=0" onclick="return confirm_oper();"><img src="<%=request.getContextPath()%>\images\sz_tu01.gif" border="0" alt="ɾ��"/></a></div></td>
    <%}else{ %>
    <td><div align="center"><a href="user?a=delsuser&uid=<%=pu.getUid()%>&value=1" onclick="return confirm_oper();"><img src="<%=request.getContextPath()%>\images\sz_tu02.gif" border="0" alt="�ָ�"/></a></div></td>
   <%} %>
    </tr>
       <%}%>
</table> 
	<%}
    else	//�������if��else
    { 
    %>
<br><br><br><br><br>
<center><h3>�Բ�����û��Ȩ�޲鿴������</h3></center>
<br>
<%} %> 
	

</form>   

<div>
	<img src="<%=request.getContextPath()%>/images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</body>
</html>
