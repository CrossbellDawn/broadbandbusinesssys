<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loginHtml">

<head>
	<meta charset="utf-8">
	<title>登录-宽带管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/static/css/public.css" media="all" />
	<style>
		body {
			background: #151f1e;
		}
	</style>
</head>

<body class="loginBody">
	<div class="layui-container">
		<div class="admin-login-background">
			<form class="layui-form" id="loginFrm" method="post" action="${ctx }/login/login.action">
				<div class="message">GH宽带业务管理系统—v1.0</div>
				<div id="darkbannerwrap"></div>
				<div class="layui-form-item input-item">
					<label for="userName">用户名</label>
					<input type="text" placeholder="请输入用户名" autocomplete="off" name="loginname" class="layui-input"
						lay-verify="required">
				</div>
				<div class="layui-form-item input-item">
					<label for="password">密码</label>
					<input type="password" placeholder="请输入密码" autocomplete="off" name="pwd" class="layui-input"
						lay-verify="required">
				</div>
				<div class="layui-form-item input-item" id="imgCode">
					<label for="code">验证码</label>
					<input type="text" placeholder="请输入验证码" autocomplete="off" name="code" id="code"
						class="layui-input">
					<img src="${ctx}/login/getCode.action" onclick="this.src=this.src+'?'">
				</div>
				<div class="layui-form-item">
					<button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
				</div>
				<div class="layui-form-item layui-row" style="text-align: center;color: red;">
					${error }
				</div>
			</form>
			<script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
			<script type="text/javascript" src="${ctx}/static/js/cache.js"></script>
			<script src="${ctx}/static/js/jquery-3.4.1.min.js" charset="utf-8"></script>
			<script type="text/javascript" src="${ctx}/static/js/jquery.particleground.min.js"></script>
			<script type="text/javascript">
				layui.use(['form', 'layer', 'jquery'], function () {
					var form = layui.form,
						layer = parent.layer === undefined ? layui.layer : top.layer
					$ = layui.jquery;
					//登录按钮
					form.on("submit(login)", function (data) {
						$(this).text("登录中...").attr("disabled", "disabled").addClass("layui-disabled");
						setTimeout(function () {
							$("#loginFrm").submit();
						}, 1000);
						return false;
					})
					// 粒子线条背景
					$(document).ready(function () {
						$('.layui-container').particleground({
							dotColor: '#5cbdaa',
							lineColor: '#5cbdaa'
						});
					});
					//表单输入效果
					$(".loginBody .input-item").click(function (e) {
						e.stopPropagation();
						$(this).addClass("layui-input-focus").find(".layui-input").focus();
					})
					$(".loginBody .layui-form-item .layui-input").focus(function () {
						$(this).parent().addClass("layui-input-focus");
					})
					$(".loginBody .layui-form-item .layui-input").blur(function () {
						$(this).parent().removeClass("layui-input-focus");
						if ($(this).val() != '') {
							$(this).parent().addClass("layui-input-active");
						} else {
							$(this).parent().removeClass("layui-input-active");
						}
					})
				})
			</script>
		</div>
	</div>
</body>

</html>