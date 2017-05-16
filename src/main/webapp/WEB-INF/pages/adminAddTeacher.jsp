<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" import="com.jmu.video.entity.User" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<link rel="stylesheet" type="text/css" href="css/leftMenu.css" />
<title>添加教师</title>
</head>
<body>
	<div class="leftMenu">
		<div class="accordion" id="accordion2">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseOne"> <span>个人中心</span>
					</a>
				</div>
				<div id="collapseOne" class="accordion-body collapse in">
					<div class="accordion-inner">
						<a href="adminUpdate"><span>修改个人信息</span></a>
					</div>
					<div class="accordion-inner">
						<a href="adminUpdatePassword"><span>修改密码</span></a>
					</div>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo"> <span>综合管理</span>
					</a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse">
					<div class="accordion-inner">
						<a href="course_findAllCourses"><span>课程管理</span></a>
					</div>
					<div class="accordion-inner">
						<a href="user_findAllTeachers"><span>教师管理</span></a>
					</div>
					<div class="accordion-inner">
						<a href="adminAddTeacher"><span>添加教师</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rightContent">
		<div class="container">
			<p class="lead">添加教师</p>
			<form class="form-horizontal" action="user_adminAddTeacher" method="post" validate="true" >
				<div class="control-group">
					<label class="control-label">教师名：</label>
					<div class="controls">
						<input type="text" name="userName" placeholder="请输入教师名" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">教师密码：</label>
					<div class="controls">
						<input type="text" name="password" placeholder="请输入教师密码" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>