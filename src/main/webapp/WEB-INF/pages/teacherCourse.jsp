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
		<div class="course">
			<p class="lead text-center">我的课程</p>
			<table class="table table-hover">
				<tr class="success">
					<th>操作</th>
					<th>课程ID</th>
					<th>课程名</th>
					<th>学时</th>
					<th>状态</th>
					<th>分类</th>
					<th>创建时间</th>
					<th>课程简介</th>
					<th>备注</th>
				</tr>
				<s:iterator value="#request.courses" var="c">
					<tr>
						<td class="span2 custom">
							<a href="course_chapterDetail?courseId=${courseId }">详情</a>
							<a href="course_editCourse?courseId=${courseId }">修改</a>
							<a href="course_deleteCourse?courseId=${courseId }" onclick="return del()">删除</a>
						</td>
						<td class="span2"><s:property value="%{courseId}" /></td>
						<td class="span2"><s:property value="%{courseName}" /></td>
						<td class="span2"><s:property value="%{period}" /></td>
						<td class="span2"><s:property value="%{status}" /></td>
						<td class="span2"><s:property value="%{classify}" /></td>
						<td class="span2"><s:property value="%{uploadDate}" /></td>
						<td class="span6"><s:property value="%{intro}" /></td>
						<td class="span2"><s:property value="%{remark}" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function del(){
			var msg = confirm("您确定删除该课程（该课程的章节和视频也会被删除）?"); 
			if(msg == true){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>