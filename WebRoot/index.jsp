<%@ page language="java" import="java.util.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>

<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	function denglu(){
	if(form.username.value == "")
    {
        alert("�û�������Ϊ��");
        form.username.focus();
        return false;
    }
    if(form.password.value == "")
    {
        alert("���벻��Ϊ��");
        form.password.focus();
        return false;
    }
       //form.action="login";
		//form.submit();
		return true;
	}

</script>

<script language="javascript">
 function addshop(str){
   var pid = str;
   send_request('<%=request.getContextPath()%>/product/addCartManagerAction.action?pid='+pid);
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
<%
 
           
%>
<form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
<div class="head">
	
<div id="login_1">
	<div id="login_1_n">
	    <div id="login_1_wz"></div>
        <div class="lodaing_w"></div>
        <div class="lodaing_ww"></div>
        <div class="lodaing_i"></div>


</div>
   </div>
	<div id="login_2">
      <div id="Layer1" style="position: absolute; width: 212px; height: 35px; z-index: 1; left: 716px; top: 

267px;"> 

      </div>
      
    </div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
		<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\index.jsp">�� ҳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\product\itservice.jsp">IT ����</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">������

��ϵͳ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\product/employee.jsp">Ա����Ƹ</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">����

����</a></div>
		</div>
		<div id="bannerbj1"></div>	
	</div>
<div class="head">
<div id="left">
	
		<div >
		<img src="<%=request.getContextPath()%>\images/lxrycyy.gif" />
		</div>
</div>
<div id="middle">
	<div class="img"></div>
	<div id="md_wenzik">
  <div class="md_wenzi">
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��˼������Ƽ����޹�˾����� &quot;��˼�ɿƼ�&quot;�������ɺ�����

ITרҵ������ʿ���йش庣����ѧ����ҵ԰���������
��˾�ܲ�λ�ڱ������ڼ��ô��������ձ������ڵ�ʯ��ׯ���������ػʵ������֣��ȷ��ȵ����зֲ���ƾ����׿Խ�ļ���ˮƽ��

����ḻ�Ĺ����Ŷӣ�
ǿ�����Դ���������͡����š����š����¡�׿Խ���ľ�Ӫ�����˼�ɿƼ��춨�˹�˾��IT�����г������Ƶ�λ������˿ͻ���

һ���Ͽɺͺ���������ͻ�������ս�Ժ�������ϵ��
  </div>
  </div>
</div>


<div id="footer">
        <table border="0" cellspacing="0" cellpadding="0" style="top: 316px; left: 708px; width: 168px; height: 

64px;">
          <tr>
            <td width="122" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>\images\username.jpg" 

align="bottom" style="top: 328px; left: 684px; width: 77px; height: 21px;"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath

()%>\images\password.jpg" style="left: 684px; width: 75px; top: 347px; height: 20px;"/>
            </td>
            <td width="120"><input type="text" name="username" size="8" /> <input type="password" name="password" 

size="8" /></td>       
         
          </tr>           
           <td width="37" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input valign="middle" type="image" src="<%=request.getContextPath()%>\images\login_1_7.jpg" 

onclick="return denglu();" width="44" height="17" border="0" alt="��¼"/></td>
<td><select name="sel" onchange="changeStyle(this)">
            <option value="andreas08(BLUE).css" selected="selected">Ĭ�Ϸ��</option>
			<option value="andreas08(orange).css">��ɫ</option>
			<option value="andreas08(green).css">��ɫ</option>
          </select></td>
        </table>
        <div style="float:left;">
<h2>&nbsp;&nbsp;&nbsp;&nbsp;������Ʒ�б�</h2>
  <ul class="ul_a"><li><a href="#">��ҩ</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  <li><a href="#">����ҩ</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  <li><a href="#">�г�ҩ</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  </ul>


  </div>
</form>
	
</body>
</html>



