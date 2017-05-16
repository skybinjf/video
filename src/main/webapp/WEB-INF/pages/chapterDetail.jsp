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
<title>章节详情</title>
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
			<p class="lead text-center">章节详情</p>
			<table class="table table-hover">
				<tr class="success">
					<th>操作</th>
					<th>课程ID</th>
					<th>章节ID</th>
					<th>章节名</th>
				</tr>
				<s:iterator value="#request.chapters" var="c">
					<tr>
						<td class="span1 custom">
							<a href="course_videoDetail?chapterId=${chapterId }">详情</a>
							<a href="course_editChapter?chapterId=${chapterId }">修改</a>
							<a href="course_deleteChapter?chapterId=${chapterId }" onclick="return del()">删除</a>
						</td>
						<td class="span1"><s:property value="%{courseId}" /></td>
						<td class="span1"><s:property value="%{chapterId}" /></td>
						<td class="span2"><s:property value="%{chapterName}" /></td>
					</tr>
				</s:iterator>
			</table>
			<%-- <s:iterator value="#request.courses" var="c">
				<div class="media">
					<a class="pull-left" href="#"> 
						<img class="media-object" src="image/test1.jpg" height="140px" width="140px" />
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							<s:property value="%{courseName}" />
						</h4>
						<p>
							<s:property value="%{intro}" />
						</p>
					</div>
				</div>
			</s:iterator> --%>
		</div>
	</div>
	<script type="text/javascript">
		function del(){
			var msg = confirm("您确定删除该章节（该章节下的所有视频也会被删除）?"); 
			if(msg == true){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>