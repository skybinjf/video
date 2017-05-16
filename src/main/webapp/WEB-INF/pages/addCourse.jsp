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
<script type="text/javascript" src="js/jquery-1.10.0.js"></script>
<script type="text/javascript" src="js/jquery.validate-1.13.1.js"></script>
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
	
		validator = $("#addCourseForm").validate({
			rules : {
				courseName : {
					required : true,
					minlength : 2,
					maxlength : 500
				},
				period : {
					required : true,
					minlength : 2,
					maxlength : 20
				},
				intro : {
					required : true,
					minlength : 2,
					maxlength : 500
				}
			},
			messages : {
				courseName : {
					required : "必须填写课程名!",
					minlength : "课程名最小为2位",
					maxlength : "课程名最大为500位",
					rangelength : "课程名应该在2-500位",
					remote : "课程名不存在"
				},
				period : {
					required : "必须填写课程学时!",
					minlength : "课程学时最小为2位",
					maxlength : "课程学时最大为20位"
				},
				intro : {
					required : "必须填写课程简介!",
					minlength : "课程简介最小为2位",
					maxlength : "课程简介最大为500位",
					rangelength : "课程简介应该在2-500位"
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
				<li class="active"><a href="addCourse">课程</a></li>
				<li><a href="course_findAllCoursesByTeacherId">章节</a></li>
				<!-- <li><a href="course_findAllChapters">视频</a></li> -->
			</ul>

			<form class="form-horizontal" action="course_addCourse" method="post" id="addCourseForm">
				<div class="control-group">
					<label class="control-label">课程名：</label>
					<div class="controls">
						<input type="text" name="courseName" placeholder="请输入课程名" />
						<label for="courseName" class="error"></label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">学时：</label>
					<div class="controls">
						<input type="text" name="period" placeholder="如：2小时30分" />
						<label for="period" class="error"></label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">分类：</label>
					<div class="controls">
						<select name="classify">
							<option>-- 请选择 --</option>
							<option value="经济">经济</option>
							<option value="文学">文学</option>
							<option value="科技">科技</option>
							<option value="医学">医学</option>
							<option value="理工">理工</option>
							<option value="外语">外语</option>
							<option value="心理">心理</option>
							<option value="历史">历史</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">简介：</label>
					<div class="controls">
						<textarea rows="8" name="intro"></textarea>
						<label for="intro" class="error"></label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">备注：</label>
					<div class="controls">
						<textarea rows="3" name="remark"></textarea>
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