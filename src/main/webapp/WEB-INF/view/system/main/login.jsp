<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html class="loginHtml">
<head>
<meta charset="utf-8">
<title>登录--客户关系管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"
	media="all" />
</head>
<body>
	<div class="layadmin-user-login layadmin-user-display-show"
		id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>TestLogin</h2>
				<p>仿写的单页面后台管理模板系统</p>
			</div>
			<div class="layadmin-user-login-box layadmin-user-login-body layui-form"
				action="${ctx}/login">
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-username"
						for="LAY-user-login-username"></label> <input type="text"
						name="userName" id="LAY-user-login-username" lay-verify="userName"
						placeholder="用户名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-password"
						for="LAY-user-login-password"></label> <input type="password"
						name="password" id="LAY-user-login-password" lay-verify="password"
						placeholder="密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit
						lay-filter="LAY-user-login-submit">登 入</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
