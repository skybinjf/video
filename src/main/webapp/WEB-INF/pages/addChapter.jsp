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
<title>添加课程</title>
<style type="text/css">
	label .error{
		color : red;
	}
</style>
	
<script type="text/javascript">
	var validator;
	$(document).ready(function() {
		
		/* $.validator.setDefaults({
			debug : true
		}); */
	
		validator = $("#addChapterForm").validate({
			rules : {
				chapterName : {
					required : true,
					minlength : 2,
					maxlength : 200
				},
				title : {
					required : true,
					minlength : 2,
					maxlength : 200
				}
			},
			messages : {
				chapterName : {
					required : "必须填写章节名称!",
					minlength : "章节名称最小为2位",
					maxlength : "章节名称最大为200位",
					rangelength : "章节名称应该在2-200位",
					remote : "章节名称不存在"
				},
				title : {
					required : "必须填写视频标题!",
					minlength : "视频标题最小为2位",
					maxlength : "视频标题最大为200位"
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
			<ul class="nav nav-tabs">
				<li><a href="addCourse">课程</a></li>
				<li class="active"><a href="course_findAllCoursesByTeacherId">章节</a></li>
				<!-- <li><a href="course_findAllChapters">视频</a></li> -->
			</ul>
			
			<form class="form-horizontal" action="upload" id="addChapterForm" method="post" enctype="multipart/form-data">
				<div class="control-group">
					<label class="control-label">课程：</label>
					<div class="controls">
						<select name="courseName">
							<s:iterator value="#request.courses" var="c">
								<option value="<s:property value="%{courseName}" />"><s:property value="%{courseName}" /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">章节名：</label>
					<div class="controls">
						<input type="text" name="chapterName" id="chapterName" placeholder="如：第一章 java的发展" />
						<label for="chapterName" class="error"></label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">视频标题：</label>
					<div class="controls">
						<input type="text" name="title" id="title" placeholder="请输入视频标题" />
						<label for="title" class="error"></label>						
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">视频文件：</label>
					<div class="controls">
						<!-- <input type="file" name="uploadFile" /> -->
						<s:file name="upload"></s:file>
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