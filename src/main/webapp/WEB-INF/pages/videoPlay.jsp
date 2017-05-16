<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
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
<title>课程学习</title>
<script type="text/javascript">

	$(document).ready(function(){
		var user = $(".user").text();
		if(user == null || user == ""){
			$("video").removeAttr("autoplay controls");
			alert("对不起，登陆后才能播放！");
			return false;
		}
	});
	
</script>
</head>
<body>
	<div class="container">
		<span class="user" hidden><s:property value="#session.user.userName"/></span>
		<video poster="image/test8.jpg" autoplay controls height="600" width="800"> <!-- Firefox --> 
			<source src="video/<s:property value='#request.video.uploadFileName'/>" type="<s:property value='#request.video.uploadContentType'/>" /> <!-- 如果浏览器不支持video标签，则使用flash --> 
			<!-- <source src="video/02.ogg" type="video/ogg" /> --> <!-- Safari/Chrome--> 
			<embed src="http://blip.tv/play/gcMVgcmBAgA%2Em4v" type="application/x-shockwave-flash" width="1024" height="798"
				allowscriptaccess="always" allowfullscreen="true">
			</embed> 
		</video>
	</div>
</body>
</html>