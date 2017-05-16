<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
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
<title>编辑课程</title>
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
				</div>
			</div>
		</div>
	</div>
	<div class="rightContent">
		<div class="container">
			<p class="lead">修改课程</p>
			<s:iterator value="#request.course" var="c">
				<form class="form-horizontal" action="course_updateCourse" method="post">
					<div class="control-group">
						<label class="control-label">课程ID：</label>
						<div class="controls">
							<input type="text" name="courseId"
								value="<s:property value="%{courseId}"/>" readOnly="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">课程名：</label>
						<div class="controls">
							<input type="text" name="courseName"
								value="<s:property value="%{courseName}"/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">学时：</label>
						<div class="controls">
							<input type="text" name="period"
								value="<s:property value="%{period}"/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">分类：</label>
						<div class="controls">
							<select name="classify">
								<option>-- 请选择 --</option>
								<option value="economy">经济</option>
								<option value="literature">文学</option>
								<option value="technology">科技</option>
								<option value="medicine">医学</option>
								<option value="enginee">理工</option>
								<option value="foreign">外语</option>
								<option value="psychology">心理</option>
								<option value="history">历史</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">课程简介：</label>
						<div class="controls">
							<input type="text" name="intro"
								value="<s:property value="%{intro}"/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">备注：</label>
						<div class="controls">
							<input type="text" name="remark"
								value="<s:property value="%{remark}"/>">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">提交</button>
						</div>
					</div>
				</form>
			</s:iterator>
		</div>
	</div>
</body>
</html>