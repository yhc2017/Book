<%@page import="javax.persistence.Parameter"%>
<%@page import="com.yhc.DAO.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>查看订单详情页面</title>
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link href="css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="images/main/favicon.ico" />
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #cdcdcd; background:#e6e6e6; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#969696; float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
#addinfo a{ font-size:14px; font-weight:bold; background:url(images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(images/main/addinfoblue.jpg) no-repeat 0 1px;}
</style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：订单管理&nbsp;&nbsp;>&nbsp;&nbsp;查看订单详情</td>
  </tr>
  <tr>
    <td align="left" valign="top" id="addinfo"><br><br><br>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <%
    request.setCharacterEncoding("UTF-8");
    String info = "";
    String query = request.getParameter("queryInfo");
    //String delete = request.getParameter("deleteOrder");
    if(query != null){
    	info = request.getParameter("orderIdGet");
    } else {
    info = request.getParameter("orderIdGet");
    String backMsg = OrderDAO.deleteOrder(info);
    %>
    	
    	 <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
      
        <td align="left" valign="middle" class="borderright borderbottom main-for">
          <h1><%=backMsg %></h1>
            <a href="order_query.jsp" target="mainFrame"><button class="text-but">返回</button></a>
          
        </td>
        </tr>
    
    <% 
    }
     %>
    
<%
	ResultSet res = OrderDAO.orderInfo(info);
	while(res.next()){
 %>
    
  
    
    <!--<form method="post" action="">-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">订单编号：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getString("id") %>
        <!--<input type="text" name="" value="" class="text-word">-->
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">收件人：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getString("receiverName") %>
        <!--<input type="text" name="" value="" class="text-word">-->
        </td>
        </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">地址：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getString("receiverAddress") %>
        <!--<input type="text" name="" value="" class="text-word">-->
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">联系电话：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getString("receiverPhonr") %>
          <!--<input type="text" name="" value="" class="text-word">-->
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">总价：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getDouble("money") %>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">所属用户：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getDouble("user_id") %>
        </td>
      </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
            <td align="right" valign="middle" class="borderright borderbottom bggray">订单状态：</td>
            <td align="left" valign="middle" class="borderright borderbottom main-for"><%=res.getString("paystate") %>
            </td>
        </tr>

      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
            <a href="order_query.jsp" target="mainFrame"><button class="text-but">返回</button></a>
          
        </td>
        </tr>
    </table>
    <!--</form>-->
    
    <%
		      }
		     %>
    
    
    
    </td>
    </tr>
</table>
</body>
</html>