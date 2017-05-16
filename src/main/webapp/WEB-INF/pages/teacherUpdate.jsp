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
						<a href="teacherUpdate"><span>修改个人信息</span></a>
					</div>
					<div class="accordion-inner">
						<a href="teacherUpdatePassword"><span>修改密码</span></a>
					</div>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo"> <span>课程管理</span>
					</a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse">
					<div class="accordion-inner">
						<a href="course_scanMyCourse"><span>查看课程</span></a>
					</div>
					<div class="accordion-inner">
						<a href="addCourse"><span>添加课程</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_uploadAnnexPage"><span>上传课件</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_addTestPage"><span>添加测试</span></a>
					</div>
					<div class="accordion-inner">
						<a href="annex_teacherScanMessage"><span>学生留言</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="rightContent">
		<div class="container">
			<p class="lead">用户基本信息修改</p>
			<form class="form-horizontal" action="user_updateUser" method="post" validate="true" >
			<s:iterator value="#session.user" var="u">
				<div class="control-group">
					<label class="control-label">ID：</label>
					<div class="controls">
						<input type="text" name="userId" value="<s:property value="%{userId}"/>" readOnly="true">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">用户名：</label>
					<div class="controls">
						<input type="text" name="userName" value="<s:property value="%{userName}"/>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">性别：</label>
					<div class="controls">
						<s:if test="'男' == sex">
							<label class="radio"> 
								<input type="radio" name="sex" value="男" checked />男
							</label> 
							<label class="radio"> 
								<input type="radio" name="sex" value="女" />女
							</label>
						</s:if>
						<s:else>
							<label class="radio"> 
								<input type="radio" name="sex" value="男" />男
							</label> 
							<label class="radio"> 
								<input type="radio" name="sex" value="女" checked />女
							</label>
						</s:else>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">邮箱：</label>
					<div class="controls">
						<input type="text" name="email" value="<s:property value="%{email}"/>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">地址：</label>
					<div class="controls">
						<input type="text" name="address" value="<s:property value="%{address}"/>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">电话：</label>
					<div class="controls">
						<input type="text" name="phone" value="<s:property value="%{phone}"/>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">职业：</label>
					<div class="controls">
						<input type="text" name="vocation" value="<s:property value="%{vocation}"/>" readonly="true" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">状态：</label>
					<div class="controls">
						<input type="text" name="status" value="<s:property value="%{status}"/>" readonly="true" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">单位：</label>
					<div class="controls">
						<input type="text" name="unit" value="<s:property value="#session.teacher.unit"/>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">简介：</label>
					<div class="controls">
						<input type="text" name="intro" value="<s:property value="%{intro}"/>">
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