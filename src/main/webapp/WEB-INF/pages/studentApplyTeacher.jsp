<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp" import="com.jmu.video.entity.User" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<link rel="stylesheet" type="text/css" href="css/leftMenu.css" />
<title>个人信息</title>
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
						<a href="studentUpdate"><span>修改个人信息</span></a>
					</div>
					<div class="accordion-inner">
						<a href="studentUpdatePassword"><span>修改密码</span></a>
					</div>
					<div class="accordion-inner">
						<a href="studentApplyTeacher"><span>申请教师</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rightContent">
		<div class="container">
			<p class="lead">申请教师</p>
			<form class="form-horizontal" action="user_updatePassword" method="post" validate="true" >
			<s:iterator value="#session.user">
				<div class="control-group">
					<label class="control-label">ID：</label>
					<div class="controls">
						<input type="text" name="userId" value="<s:property value="%{userId}"/>" readOnly="true" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">用户名：</label>
					<div class="controls">
						<input type="text" name="userName" value="<s:property value="%{userName}" />" readOnly="true" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">申请理由：</label>
					<div class="controls">
						<textarea rows="3" name="applyReason" placeholder="请输入申请理由"></textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn">提交</button>
					</div>
				</div>
				</s:iterator>
			</form>
		</div>
	</div>
</body>
</html>