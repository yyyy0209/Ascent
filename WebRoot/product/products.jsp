<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" contentType="text/html;charset=gb2312"%>

<html>
<head>
<title>ascent</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<!-- script type="text/javascript">
	function check(){
		if(form.username.value==""){
			alert("�û�������Ϊ��");
			form.username.focus();
			return false;
		}
		if(form.password.value==""){
			alert("�û�������Ϊ��");
			form.password.focus();
			return false;
		}
		return true;
	}
</script-->
</head>

<body>

<div class="head">
  <div id="login_1"></div>
	<div id="login_2"></div>
	
	<div class="img"><img width="277" height="80" src="<%=request.getContextPath()%>/images/web_4.jpg"></div>
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
<div class="head">
  <div class="left_products">
	<div class="img"><img src="<%=request.getContextPath()%>/images/products_02.jpg" width="189" height="32"/></div>
<div class="left_bj">
		<div class="big_k">
		<%
			Productuser p =(Productuser)session.getAttribute("productuser");
			if(p==null){
		%><form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
			user: <br><input type="text" name="username"  size="15"/><br>
			password:<br><input type="password" name="password"  size="15"/><br>
			<input type="submit" name="submit" value="�ύ" />
			</form>
			�������<a href="<%=request.getContextPath()%>/product/register.jsp">ע��</a>
			<div class="loading_p"><% String value = (String)request.getAttribute("error");
                       if(value!=null){
   	                 out.println("������ʾ��Ϣ"+value);
                       }%></div>
			
		<%
			}
			else{
		%>
		
		<div class="loading_p">��ӭ����<%=p.getUsername()%></div>
		<div class="loading_p">���䣺<%=p.getEmail()%></div>
		<div class="loading_p"><a href="<%=request.getContextPath()%>/login?a=out">ע��</a></div>
		<% if(p.getSuperuser().equals("3")){%>
		<div class="loading_p"><a href="<%=request.getContextPath()%>/product/pageProductuserManagerAction.action">�û�����</a></div>
		
		<%}}%>
		</div>
	</div>
</div>

<div class="right_proaducts">�ҵ�λ�� >> �����������  </div>
<div class="p_ny">
	<div class="md_wenzi">��Ʒ��Ϣ </div>
</div>
<div class="border"></div>
<div class="p_wenzikuang">
	<div class="md_wenzi">
  astaTech�� Inc.�ṩȫ������ҩ������Ƽ���agroche micalҩ���о�&��չ���Ƚ�����ӱ���м��塣
  ���ǵı�Ŀ��������1500��ҩ�����Ʒ�� ������ʮ���µĻ�����ÿ�������ӵ���Ʒ�����������Ƚ����м���Ŀ������ͣ�
  ������ľ����ӱ�İ���������İ������Ȼ�İ����ᡢͪ����ȩ��heterocycles��isatoic����boroinc�������
  ���м�����ܼ�������ҩ���о����̡�AstaTechҲ�ṩ�����м���(10����)������м���(�Զ�)��ʹԭ���Ϻ����ǵ�
  �м����������������ļ۸������Ʒ�ʡ� 
  ��ι�<a href="<%=request.getContextPath()%>/product?a=all">�����Ʒҳ</a>��
  <br> ��Ŀ���������ϱ��ۿ�������<a href="<%=request.getContextPath()%>/product/Product_Search.jsp">��ѯ��Ʒ�����Ʒ</a>
  ����ϲ�������Ͻ������ǵı�Ŀ��(��PDF��SD��ʽ)��������ʼ�����.
  </div>

</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>



</body>

</html>
