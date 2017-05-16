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
			<p class="lead text-center">视频信息</p>
			<table class="table table-hover">
				<tr class="success">
					<th>操作</th>
					<th>章节ID</th>
					<th>视频ID</th>
					<th>视频标题</th>
					<th>视频类型</th>
					<th>视频名称</th>
					<th>视频文件</th>
				</tr>
				<s:iterator value="#request.videos" var="v">
					<tr>
						<td class="span1 custom">
							<a href="course_deleteVideo?videoId=${videoId }">删除</a>
						</td>
						<td class="span1"><s:property value="%{chapter.chapterId}" /></td>
						<td class="span1"><s:property value="%{videoId}" /></td>
						<td class="span1"><s:property value="%{title}" /></td>
						<td class="span1"><s:property value="%{uploadContentType}" /></td>
						<td class="span1"><s:property value="%{uploadFileName}" /></td>
						<td class="span2"><s:property value="%{path}" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
</body>
</html>