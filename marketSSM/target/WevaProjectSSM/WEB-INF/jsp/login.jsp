<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<title>澳猫商城</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-elements.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<!-- 获取从request中保存的message标记值，来弹出提示窗口 -->
<%
	Object message = request.getSession().getAttribute("message");
	if(message!=null && !"".equals(message)){
%>
	<script type="text/javascript">
		alert("<%=message%>");
	</script>
<%} %>
<%
	message = null;
	session.setAttribute("message", message); 
%>

<body>
	<script>
		function isBack() {
			if (confirm("是否退出登录？")) {
				location.href = "/marketSSM/user/logout";
			}
		}
	</script>
	<!-- 导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand"
			href="/marketSSM/user/toIndex">澳猫商城</a>
		<c:choose>
			<c:when test="${not empty sessionScope.user.userName}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/marketSSM/user/toInformation">用户：${sessionScope.user.userName}</a></li>
					<li><a href="javascript:isBack()">退出登录</a></li>
					<li><a
						href="/marketSSM/user/toRegister">注册</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/marketSSM/user/toLogin">登录</a></li>
					<li><a
						href="/marketSSM/user/toRegister">注册</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>

	</div>
	</nav>

	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>澳猫商城</strong>
						</h1>
						<div class="description">
							<p>This is a free responsive system with a sepcial ui which
								called Daily operation management and mutual evaluation system</p>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h1>
									登录 <small>没有账号？<a href="/marketSSM/user/toRegister">立即注册</a></small>
								</h1>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" action="/marketSSM/user/login" method="post" class="login-form" >
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label> <input
										type="text" name="user_name" placeholder="用户名..."
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label> <input
										type="password" name="user_pass" placeholder="密码..."
										class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="btn">login in!</button>
								<div class="form-group">
									<a href="#">忘记密码？</a>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>


