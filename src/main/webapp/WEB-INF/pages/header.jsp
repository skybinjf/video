<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jmu.video.entity.User" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="js/jquery.validate-1.13.1.js"></script>

<title></title>
<style type="text/css">
	label.error{
		color : red;
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
	var validator;
	/**
	 * 不提交表单，用来调度
	 */
	/* $.validator.setDefaults({
		debug : true
	}); */
	
	validator = $("#loginForm").validate({
		rules : {
			userName : {
				required : true,
				minlength : 2,
				maxlength : 16
			},
			password : {
				required : true,
				minlength : 1,
				maxlength : 16
			}
		},
		messages : {
			userName : {
				required : "必须填写用户名!",
				minlength : "用户名最小为2位",
				maxlength : "用户名最大为10位",
				rangelength : "用户名应该在2-10位",
				remote : "用户名不存在"
			},
			password : {
				required : "必须填写密码!",
				minlength : "密码最小为1位",
				maxlength : "密码最大为16位"
			}
		},
		/* submitHandler : function(form) {
			console.log($(form).serialize());
		} */
	});
});
</script>
</head>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<div>
					<a class="brand" href="index.action">Sky视频教学平台</a>
					<ul class="nav">
						<li class=""><a href="course_classify?flag=economy">经济</a></li>
						<li><a href="course_classify?flag=literature">文学</a></li>
						<li><a href="course_classify?flag=technology">科技</a></li>
						<li><a href="course_classify?flag=medicine">医学</a></li>
						<li><a href="course_classify?flag=enginee">理工</a></li>
						<li><a href="course_classify?flag=foreign">外语</a></li>
						<li><a href="course_classify?flag=psychology">心理</a></li>
						<li><a href="course_classify?flag=history">历史</a></li>
					</ul>
				</div>
				<%
					User user= (User)session.getAttribute("user");
				%>
				
				<s:if test="#session.user == null">
					<div class="pull-right">
						<a class="register" href="register.action">注册</a>
					</div>
					<div class="pull-right">
						<a href="#myModal" role="button" class="" data-toggle="modal"><span
							class="icon-user"></span>登陆</a>
					</div>
				</s:if>
				<s:else>
					<div class="pull-right">
						<a class="register" href="user_logout">退出</a>
					</div>
					<div class="pull-right">
						<a href="user_jump"><span class="icon-user"></span>${sessionScope.user.userName}</a>
					</div>
				</s:else>
			</div>
		</div>
	</div>
	
	<form action="loginAction" method="post" id="loginForm">
		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel" class="text-center">登陆</h3>
			</div>
			<div class="modal-body text-center">
				<div>
					<label class="offset1 span1">用户名：</label>
					<input type="text" name="userName" placeholder="请输入用户名" class="pull-left" />
					<label for="userName" class="error"></label>
				</div>
				<div>
					<label class="offset1 span1">密码：</label>
					<input type="password" name="password" placeholder="请输入密码" class="pull-left" />
					<label for="password" class="error"></label>
				</div>
				<div>
					<label class="offset1 span1">身份：</label>
					<div class="pull-left">
						<input type="radio" name="sign" value="student" />学生
						<input type="radio" name="sign" value="teacher" checked="checked" />教师
						<input type="radio" name="sign" value="admin" />管理员
					</div>
					
				</div>
				<%-- <div>
					<small><a class="pull-left offset2" href="getBackPassword">忘记密码</a></small>
				</div> --%>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
				<input type="submit" value="登陆" class="btn btn-primary" />
			</div>
		</div>
	</form>
	
</body>
</html>