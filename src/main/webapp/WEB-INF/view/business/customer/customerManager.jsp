<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>客户管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="${ctx }/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx }/static/css/public.css" media="all" />
</head>

<body class="childrenBody">
	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		<legend>查询条件</legend>
	</fieldset>
	<form class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户编号:</label>
				<div class="layui-input-inline">
					<input type="text" name="custId" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户姓名:</label>
				<div class="layui-input-inline">
					<input type="text" name="custName" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户负责人:</label>
				<div class="layui-input-inline">
					<input type="text" name="custUserId" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">客户来源:</label>
				<div class="layui-input-inline">
					<input type="text" name="custSource" autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户专业:</label>
				<div class="layui-input-inline">
					<input type="text" name="custMajor" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">客户级别:</label>
				<div class="layui-input-inline">
					<select name="custLevel" lay-filter="custMajor">
						<option value="" selected=""></option>
						<option value="包年用户">包年用户</option>
						<option value="包月用户">包月用户</option>
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">创建日期：</label>
				<div class="layui-input-inline">
					<input type="text" name="custCreatetime" id="date" autocomplete="off" class="layui-input"
						lay-verify="timestamp" placeholder="yyyy-MM-dd">
				</div>
			</div>
			<div class="layui-inline" style="text-align: center;padding-left: 20px;">
				<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search"
					id="doSearch">查询</button>
				<button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
				<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-download-circle"
					id="doExport">导出</button>
			</div>
		</div>
	</form>

	<!-- 搜索条件结束 -->

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>
	<div style="display: none;" id="customerToolBar">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
		<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteBatch">批量删除</button>
	</div>
	<div id="customerBar" style="display: none;">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	<!-- 数据表格结束 -->

	<!--添加的弹出层开始-->
	<div style="display: none;padding: 20px" id="saveDiv">
		<form class="layui-form" lay-filter="saveDataFrm" id="saveDataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户编号:</label>
					<div class="layui-input-inline">
						<input type="text" name="custId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="custName" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户负责人:</label>
					<div class="layui-input-inline">
						<input type="text" name="custUserId" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户来源:</label>
					<div class="layui-input-inline">
						<input type="text" name="custSource" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户专业:</label>
					<div class="layui-input-inline">
						<input type="text" name="custMajor" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户级别:</label>
					<div class="layui-input-inline">
						<select name="custLevel" lay-filter="custMajor">
							<option value="" selected=""></option>
							<option value="包年用户">包年用户</option>
							<option value="包月用户">包月用户</option>
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">联系人:</label>
					<div class="layui-input-inline">
						<input type="text" name="custLinkman" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">固定电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="custPhone" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">移动电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="custMobile" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">邮政编码:</label>
					<div class="layui-input-inline">
						<input type="text" name="custZipcode" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">联系地址:</label>
					<div class="layui-input-inline">
						<input type="text" name="custAddress" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline" style="text-align: center;padding-left:80px">
					<button type="button"
						class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
						lay-filter="saveSubmit" lay-submit="">提交
					</button>
					<button type="reset"
						class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
					</button>
				</div>
			</div>
		</form>
	</div>
	<!--添加的弹出层结束-->
	<!-- 修改的弹出层开始 -->
	<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户编号:</label>
					<div class="layui-input-inline">
						<input type="text" name="custId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="custName" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户负责人:</label>
					<div class="layui-input-inline">
						<input type="text" name="custUserId" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户来源:</label>
					<div class="layui-input-inline">
						<input type="text" name="custSource" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户专业:</label>
					<div class="layui-input-inline">
						<input type="text" name="custMajor" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户级别:</label>
					<div class="layui-input-inline">
						<select name="custLevel" lay-filter="custMajor">
							<option value="" selected=""></option>
							<option value="包年用户">包年用户</option>
							<option value="包月用户">包月用户</option>
						</select>
					</div>
				</div>

				<div class="layui-inline" style="text-align: center;padding-left:80px">
					<button type="button"
						class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
						lay-filter="doSubmit" lay-submit="">提交
					</button>
					<button type="reset"
						class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
					</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 修改的弹出层结束 -->

	<script src="${ctx }/static/layui/layui.js"></script>
	<script type="text/javascript">
		var tableIns;
		layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
			var $ = layui.jquery;
			var layer = layui.layer;
			var form = layui.form;
			var table = layui.table;
			var laydate = layui.laydate;

			//渲染日期选择
			laydate.render({
				elem: '#date',
				type: 'date',
			});


			//渲染数据表格
			tableIns = table.render({
				elem: '#customerTable' //渲染的目标对象
					,
				url: '${ctx}/customer/loadAllCustomer.action' //数据接口
					,
				title: '客户数据表' //数据导出来的标题
					,
				toolbar: "#customerToolBar" //表格的工具条
					,
				height: 'full-220',
				cellMinWidth: 100 //设置列的最小默认宽度
					,
				page: true //是否启用分页
					,
				cols: [
					[ //列表数据
						{
							type: 'checkbox',
							fixed: 'left'
						}, {
							field: 'custId',
							title: '编号',
							align: 'center',
							width: '60'
						}, {
							field: 'custName',
							title: '姓名',
							align: 'center',
							width: '80'
						}, {
							field: 'custUserId',
							title: '负责人',
							align: 'center',
							width: '80'
						}, {
							field: 'custCreateId',
							title: '创建人',
							align: 'center',
							width: '80'
						}, {
							field: 'custSource',
							title: '信息来源',
							align: 'center',
							width: '100'
						}, {
							field: 'custMajor',
							title: '客户专业',
							align: 'center',
							width: '100'
						}, {
							field: 'custLevel',
							title: '客户级别',
							align: 'center',
							width: '100',
							templet: function (d) {
								return d.custLevel == '包年用户' ? '<font color=#FF5722>包年用户</font>' :
									'<font color=#1E9FFF>包月用户</font>';
							}
						}, {
							field: 'custLinkman',
							title: '联系人',
							align: 'center',
							width: '80'
						}, {
							field: 'custPhone',
							title: '固定电话',
							align: 'center',
							width: '100'
						}, {
							field: 'custMobile',
							title: '移动电话',
							align: 'center',
							width: '120'
						}, {
							field: 'custZipcode',
							title: '邮政编码',
							align: 'center',
							width: '80'
						}, {
							field: 'custAddress',
							title: '联系地址',
							align: 'center',
							width: '140'
						}, {
							field: 'custCreatetime',
							title: '录入时间',
							align: 'center',
							width: '160'
						}, {
							fixed: 'right',
							title: '操作',
							toolbar: '#customerBar',
							width: 160,
							align: 'center'
						}
					]
				],
				done: function (data, curr, count) {
					//不是第一页时如果当前返回的的数据为0那么就返回上一页
					if (data.data.length == 0 && curr != 1) {
						tableIns.reload({
							page: {
								curr: curr - 1
							}
						});
					}
				}
			})
			//模糊查询
			$("#doSearch").click(function () {
				var params = $("#searchFrm").serialize();
				tableIns.reload({
					url: "${ctx}/customer/loadAllCustomer.action?" + params,
					page: {
						curr: 1
					},
					method: 'post'
				})
			});
			//导出
			$("#doExport").click(function () {
				var params = $("#searchFrm").serialize();
				window.location.href = "${ctx}/stat/exportCustomer.action?" + params;
			});

			//监听头部工具栏事件
			table.on("toolbar(customerTable)", function (obj) {
				switch (obj.event) {
					case 'add':
						openAddCustomer();
						break;
					case 'deleteBatch':
						deleteBatch();
						break;
				};
			})
			//监听行工具事件
			table.on('tool(customerTable)', function (obj) {
				var data = obj.data; //获得当前行数据
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				if (layEvent === 'del') { //删除
					layer.confirm('真的删除【' + data.custName + '】这个客户吗', function (index) {
						//向服务端发送删除指令
						$.post("${ctx}/customer/deleteCustomer.action", {
							custId: data.custId
						}, function (res) {
							layer.msg(res.msg);
							//刷新数据 表格
							tableIns.reload();
						})
					});
				} else if (layEvent === 'edit') { //编辑
					openUpdateCustomer(data);
				}
			});

			var url;
			var mainIndex;
			//打开添加页面
			function openAddCustomer() {
				mainIndex = layer.open({
					type: 1,
					title: '添加客户',
					content: $("#saveDiv"),
					area: ['1100px', '400px'],
					success: function (index) {
						//清空表单数据       
						$("#saveDataFrm")[0].reset();
						url = "${ctx}/customer/addCustomer.action";
					}
				});
			}
			//打开修改页面
			function openUpdateCustomer(data) {
				mainIndex = layer.open({
					type: 1,
					title: '修改客户',
					content: $("#saveOrUpdateDiv"),
					area: ['800px', '320px'],
					success: function (index) {
						form.val("dataFrm", data);
						url = "${ctx}/customer/updateCustomer.action";
					}
				});
			}
			//保存
			form.on("submit(saveSubmit)", function (obj) {
				//序列化表单数据
				var params = $("#saveDataFrm").serialize();
				$.post(url, params, function (obj) {
					layer.msg(obj.msg);
					//关闭弹出层
					layer.close(mainIndex)
					//刷新数据 表格
					tableIns.reload();
				})
			});
			//更新
			form.on("submit(doSubmit)", function (obj) {
				//序列化表单数据
				var params = $("#dataFrm").serialize();
				$.post(url, params, function (obj) {
					layer.msg(obj.msg);
					//关闭弹出层
					layer.close(mainIndex)
					//刷新数据 表格
					tableIns.reload();
				})
			});
			//批量删除
			function deleteBatch() {
				//得到选中的数据行
				var checkStatus = table.checkStatus('customerTable');
				var data = checkStatus.data;
				var params = "";
				$.each(data, function (i, item) {
					if (i == 0) {
						params += "ids=" + item.custId;
					} else {
						params += "&ids=" + item.custId;
					}
				});
				layer.confirm('真的删除选中的这些客户吗', function (index) {
					//向服务端发送删除指令
					$.post("${ctx}/customer/deleteBatchCustomer.action", params, function (res) {
						layer.msg(res.msg);
						//刷新数据 表格
						tableIns.reload();
					})
				});
			}
		});
	</script>
</body>

</html>