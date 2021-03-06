<%@page import="java.sql.ResultSet"%>
<%@page import="com.yhc.DAO.DBHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>查询结果</title>
	  <meta name="description" content=" user 页面">
	  <meta name="keywords" content="user">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="Cache-Control" content="no-siteapp" />
	  <link rel="icon" type="image/png" href="assets/i/favicon.png">
	  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
	  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	  <link rel="stylesheet" href="assets/css/admin.css">
  </head>
  
  <body style="overflow:auto;">
    <header class="am-topbar" style="font-size: 20px;">
		  <h1 class="am-topbar-brand">
		    <a href="#"><h1>BookStore</h1></a>
		  </h1>
		    <div class="am-topbar-right am-topbar-brand">
		      <c:choose>
				<c:when test="${sessionScope.user == null}">
					<a href="${pageContext.request.contextPath}/login.jsp">
					<button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">登陆</button>
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/user.jsp"><i class='am-icon-user am-icon-fw'></i>个人中心</a>
					<a href="${pageContext.request.contextPath}/login.jsp"><i class='am-icon-shopping-cart  am-icon-fw'></i><span>购物车</span><strong id='J_MiniCartNum' class='h'></strong></a>
				</c:otherwise>
			</c:choose>
		      </div>
		  </div>
		</header>
		<div style="padding-left: 50px;">
			<ul class="am-nav am-nav-pills">
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=文学">文学</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=生活">生活</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=计算机">计算机</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=外语">外语</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=经营">经营</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=励志">励志</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=学术">学术</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=少儿">少儿</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=艺术">艺术</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=原版">原版</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=科技">科技</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=考试">考试</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=生活百科">生活百科</a></li>
		  <li><a href="${pageContext.request.contextPath}/sort.jsp?l=所有书籍&Num=1">所有书籍</a></li>
		</ul>
		
		</div>
		
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">查询结果</strong> / <small>${param.select}</small></div>
      	</div>
      	<hr>
		<div class="am-u-sm-12">
			<ul data-am-widget="gallery" class="am-gallery am-avg-lg-5 am-gallery-default" data-am-gallery="{ pureview: true }" >
		      <%	
		      		String sql = "select * from products where name like('%"+request.getParameter("select")+"%')";
					ResultSet rs = DBHelper.query(sql);
					while(rs.next()){
				 %>
		      <li>
		        <div class="am-gallery-item">
		            <a href="${pageContext.request.contextPath}/introduction.jsp?name=<%=rs.getString("name")%>&url=<%=rs.getString("imgurl")%>&author=<%=rs.getString("author")%>&pnum=<%=rs.getString("pnum")%>&price=<%=rs.getString("price")%>">
		              <img src="<%=rs.getString("imgurl")%>" title="<%=rs.getString("description")%>" style="height: 213px; width: 159px; " />
		                <h3 class="am-gallery-title"><%=rs.getString("name")%></h3>
		                <div class="am-gallery-desc"><%=rs.getString("author")%></div>
		            </a>
		        </div>
		      </li>
		      <%} %>
		  </ul>
		</div>
  </body>
</html>
