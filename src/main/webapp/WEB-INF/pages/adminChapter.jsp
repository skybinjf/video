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
<title>个人信息</title>
<style type="text/css">
	.course{
		margin: auto 20px;	
	}
	.custom{
		border-right: 1px solid #D1D1D1;
	}
</style>
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
		<div class="course">
			<p class="lead text-center">章节信息</p>
			<table class="table table-hover">
				<tr class="success">
					<th>操作</th>
					<th>课程ID</th>
					<th>章节ID</th>
					<th>章节名</th>
				</tr>
				<s:iterator value="#request.chapters" var="c">
					<tr>
						<td class="custom">
							<a href="course_adminVideo?chapterId=${chapterId }">详情</a>
						</td>
						<td class=""><s:property value="%{courseId}" /></td>
						<td class=""><s:property value="%{chapterId}" /></td>
						<td class=""><s:property value="%{chapterName}" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
</body>
</html>