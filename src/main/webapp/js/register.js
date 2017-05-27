/**
 * 
 */
var validator;
$(document).ready(function() {
	/**
	 * 不提交表单，用来调度
	 */
	/*$.validator.setDefaults({
		debug : true
	});*/

	validator = $("#registerForm").validate({
		rules : {
			userName : {
				required : true,
			},
			password : {
				required : true,
				minlength : 2,
				maxlength : 16
			},
			email : {
				required : true,
				email : true
			},
			inputCode : {
				required : true
			}
		},
		messages : {
			userName : {
				required : "必须填写用户名!",
				minlength : "用户名最小为2位",
				maxlength : "用户名最大为10位",
				rangelength : "用户名应该在2-10位",
				remote : "用户名不存在"
			},
			password : {
				required : "必须填写密码!",
				minlength : "密码最小为2位",
				maxlength : "密码最大为16位"
			},
			email : {
				required : "必须填写电子邮件!",
				email : "请输入正确格式的电子邮件!"
			},
			inputCode : {
				required : "必须输入验证码！"
			}
		},
		/*submitHandler : function(form) {
			console.log($(form).serialize());
		}*/
	});
	

});

function refreshImage(obj) {
	/** 
	 * 每次请求需要一个不同的参数，否则可能会返回同样的验证码     
	 * 这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。   
	 */
	var timeNow = new Date().getTime();
	obj.src = "createImageAction.action?" + timeNow;
}