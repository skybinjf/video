<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.validate-1.13.1.js"></script>

<title>注册</title>
<style type="text/css">
	label.error {
	    color: red;
	    font-size: 18px;
	}
</style>
</head>
<body>
	<div class="container register">
		<div class="">
			<p class="lead text-center">找回密码</p>
			<form action="user_getBackPassword" method="post" id="registerForm">
				<div class="offset3 span6">
					<label class="span1 text-right">用户名：</label>
					<input type="text" name="userName" id="userName" placeholder="请输入用户名" />
					<label for="userName" class="error"></label>
				</div>
				<div class="offset3 span6">
					<label class="span1 text-right">邮箱： </label>
					<input type="text" name="email" placeholder="请输入邮箱" />
					<label for="email" class="error"></label>
				</div>
				<div class="offset5 span3">
					<button class="btn btn-info">发送到邮箱</button>
				</div>
			</form>
			<div class="offset4 span6">
				<span class="text-warning lead">${tip }</span>
			</div>
		</div>
	</div>
</body>
</html>