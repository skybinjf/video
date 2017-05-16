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
			<p class="lead">修改章节</p>
			<s:iterator value="#request.chapter" var="c">
				<form class="form-horizontal" action="course_updateChapter?chapterId=${chapterId }" method="post">
					<div class="control-group">
						<label class="control-label">ID：</label>
						<div class="controls">
							<input type="text" name="chapterId"
								value="<s:property value="%{chapterId}"/>" readOnly="true" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">课程ID：</label>
						<div class="controls">
							<input type="text" name="courseID"
								value="<s:property value="%{course.courseId}" />" readOnly="true" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">章节名：</label>
						<div class="controls">
							<input type="text" name="chapterName"
								value="<s:property value="%{chapterName}"/>">
						</div>
					</div>
					<%-- <div class="control-group">
						<label class="control-label">分类：</label>
						<div class="controls">
							<input type="text" name="classify"
								value="<s:property value="%{classify}"/>">
						</div>
					</div> --%>
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