<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<title></title>
</head>
<body>
	<div class="container">
		<div>
			<ul class="thumbnails">
				<s:iterator value="#request.courses" var="c">
					<a href="course_courseScan?courseId=${courseId }">
						<li class="span4">
							<div class="thumbnail">
								<img src="image/test2.jpg" alt="">
								<h3><s:property value="courseName"/> </h3>
								<p><s:property value="intro" /> </p>
							</div>
						</li>
					</a>
				</s:iterator>
			</ul>

		</div>
	</div>
</body>
</html>