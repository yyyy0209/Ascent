<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>AscentWeb��������</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form name="form" method="post" action="productuserLoginAction.action">
<div class="head">
  <div id="login_1"></div>
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
<div class="head">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="34">&nbsp;</td>
              <td width="96%" valign="bottom"><font color="#000000" class="td"><strong>IT����</strong></font></td>
            </tr>
            <tr>
              <td height="267">&nbsp;</td>
              <td valign="top"><table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="16">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="84" valign="top" class="12">������˼�ɿƼ���Ascent Technologies����˾�����ɺ�����ITרҵ������ʿ���йش���ѧ������ҵ԰���������ƾ����׿Խ�ļ���ˮƽ������ḻ�Ĺ����Ŷӣ�ǿ�����Դ���������Ͷ�������ڶ���ҵ�����۵ķḻ���飬��˼�ɿƼ��춨�˹�˾�ڱ��غͺ���IT�����г������Ƶ�λ������˿ͻ���һ���Ͽɺͺ���������ͻ������˳��ڵ�ս�Ժ�������ϵ��
                        <p>������˼���������й�IT����ʵ���ص㣬���ù����Ƚ�����ļ����;��飬�ṩ�߶����ʵ�IT���񣬰�������߶���ѵ�����������ά�����������������Ʒ�з��ͱ��ػ��ȡ�<br>
                      </p>
                      </td>
                  </tr>
                </table>
                  <table width="92%" border="0">
                    <tr>
                      <td valign="top" class="12"><table width="600" border="0" cellspacing="8" cellpadding="0">
                          <tr>
                            <td colspan="5">&nbsp;</td>
                          </tr>
                          <tr>
                            <td colspan="5"><span class="style2">��˼���ṩ��IT���񸲸���������</span></td>
                          </tr>
                          <tr>
                            <td><a href="http://www.ascenttech.com.cn/itpxunfw.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic1.jpg" width="150" height="103" border="0"></a></td>
                            <td>&nbsp;</td>
                            <td><a href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic2.jpg" width="150" height="103" border="0"></a></td>
                            <td>&nbsp;</td>
                            <td><a href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic3.jpg" width="150" height="103" border="0"></a></td>
                          </tr>
                          <tr>
                            <td><div align="left" class="style3"><span class="shang"><font class="i"><font class="biaoti"><a href="http://www.ascenttech.com.cn/itpxunfw.htm" target="_blank" class="i">IT��ѵ����</a></font></font></span></div></td>
                            <td><div align="left"><span class="style4"></span></div></td>
                            <td><div align="left" class="style4"><strong><font class="i"><font class="biaoti"><a href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm" target="_blank" class="i">����������</a></font></font></strong></div></td>
                            <td><div align="left"><span class="style4"></span></div></td>
                            <td><div align="left" class="style4"><strong><a href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm" target="_blank" class="i">�����������</a></strong></div></td>
                          </tr>
                      </table>
</div>
<br><br>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div></form></body>

</html>
