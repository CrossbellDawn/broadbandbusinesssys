<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登入 - layuiTest</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/admin.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/login.css" media="all">
</head>
<body>
	<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>TestLogin</h2>
				<p>仿写的单页面后台管理模板系统</p>
			</div>
			<div class="layadmin-user-login-box layadmin-user-login-body layui-form" action="${pageContext.request.contextPath}/login">
				<div class="layui-form-item">
					<label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
					<input type="text" name="userName" id="LAY-user-login-username" lay-verify="userName" placeholder="用户名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
					<input type="password" name="password" id="LAY-user-login-password" lay-verify="password" placeholder="密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form;
			var $ = layui.jquery;
			//自定义验证规则
			form.verify({
				username : function(value, item) { //value：表单的值、item：表单的DOM对象
					if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
							.test(value)) {
						return '用户名不能有特殊字符';
					}
					if (/(^\_)|(\__)|(\_+$)/.test(value)) {
						return '用户名首尾不能出现下划线\'_\'';
					}
					if (/^\d+\d+\d$/.test(value)) {
						return '用户名不能全为数字';
					}
				},
				password : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
				content : function(value) {
					layedit.sync(editIndex);
				}
			});

			//监听提交
			form.on('submit(LAY-user-login-submit)', function(data) {
				/* 				layer.alert(JSON.stringify(data.field), {
				 title : '最终的提交信息'
				 });
				 console.log(data.field); */
				$.ajax({
					type : "POST",
					url : window.location.protocol+"//"+window.location.host+"/ssm-demo/login",
					data : data.field,
					dataType : 'json',
	                success : function(data) {  
	                	window.location.href=data;  
	                },  
	                error : function(err) {  
	                    console.log(err.responseText);
	                    alert(err.responseText);
	                    
	                }  
				});
			});

		});
	</script>

</body>
</html>