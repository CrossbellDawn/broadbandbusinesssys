<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>出租单管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

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
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">宽带订单:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderNumber" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">宽带产品:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderBandwidth" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderCustName" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">经办人:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderOperator" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">生效时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderStarttime" id="startTime" readonly="readonly" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">到期时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderEndtime" id="endTime" readonly="readonly" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">计费类型:</label>
					<div class="layui-input-inline">
						<input type="radio" name="orderFeetype" value="1" title="包年">
						<input type="radio" name="orderFeetype" value="0" title="包月">
					</div>
				</div>
				<div class="layui-inline" style="text-align: center; padding-left: 30px;">
					<div class="layui-input-inline">
						<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search"
							id="doSearch">查询</button>
						<button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 搜索条件结束 -->

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="rentTable" lay-filter="rentTable"></table>
	<div style="display: none;" id="rentToolBar"></div>
	<script type="text/html" id="rentBar">
		<a class="layui-btn layui-btn-xs" style="background-color:#5FB878" lay-event="renew" lay-filter="renew">续费</a>
		{{#  if(d.orderState !=2){ }}
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		{{#  } else  {  }}
		{{#  } }}
		<a class="layui-btn layui-btn-xs" lay-event="exportOrder">导出业务单</a>
	</script>
	<!-- 数据表格结束 -->

	<!-- 添加和修改的弹出层开始 -->
	<div style="display: none; padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label">业务单号:</label>
					<div class="layui-input-block">
						<input type="text" name="orderNumber" autocomplete="off" readonly class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-block">
					<label class="layui-form-label">宽带业务:</label>
					<div class="layui-input-block">
						<input type="text" name="orderBandwidth" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderCustName" autocomplete="off" readonly class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">操作人员:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderOperator" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">计费类型:</label>
					<div class="layui-input-inline">
						<input type="radio" name="orderFeetype" value="1" title="包年" id="orderFeetype"
							lay-filter="orderFeetype" checked> <input type="radio" name="orderFeetype" value="0"
							title="包月" id="orderFeetype" lay-filter="orderFeetype">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">租约费用:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderPay" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">起始时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderStarttime" id="orderStarttime" autocomplete="off"
							class="layui-input" lay-verify="timestamp" placeholder="yyyy-MM-dd">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">到期时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="orderEndtime" id="orderEndtime" autocomplete="off" class="layui-input"
							lay-verify="timestamp" placeholder="yyyy-MM-dd">
					</div>
				</div>
			</div>



			<div class="layui-form-item" style="text-align: center;">
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release"
						lay-filter="doSubmit" lay-submit="">提交</button>
					<button type="reset"
						class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh">重置</button>
				</div>
			</div>
		</form>

	</div>
	<!-- 添加和修改的弹出层结束 -->


	<!--业务续费弹出层-->
	<div style="display: none; padding: 20px" id="renewOrderDiv">
		<form class="layui-form" lay-filter="renewOrderFrm" id="renewOrderFrm">

			<div class="layui-col-md12 layui-col-xs12">
				<div class="layui-row layui-col-space10">
					<div class="layui-col-md9 layui-col-xs7">
						<div class="layui-form-item magt3">
							<label class="layui-form-label">订单编号:</label>
							<div class="layui-input-block">
								<input type="text" name="orderNumber" id="orderNumber" autocomplete="off"
									class="layui-input" lay-verify="required">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">套餐名称:</label>
							<div class="layui-input-block" style="padding: 5px">
								<input type="text" name="orderBandwidth" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">计费类型:</label>
							<div class="layui-input-inline">
								<input type="hidden" name="orderFeetype" value="" id="orderFeetype3">
								<input type="checkbox" title="" id="cbx" value="" checked>
							</div>
						</div>
					</div>
					<div class="layui-col-md3 layui-col-xs5">
						<div class="layui-upload-list thumbBox mag0 magt3" id="">
							<img id="QRCode" src="" />
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">起始时间:</label>
						<div class="layui-input-inline">
							<input type="text" name="orderStarttime" id="orderStarttime2" autocomplete="off"
								class="layui-input" lay-verify="timestamp" placeholder="yyyy-MM-dd">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">到期时间:</label>
						<div class="layui-input-inline">
							<input type="text" name="orderEndtime" id="orderEndtime2" autocomplete="off"
								class="layui-input" lay-verify="timestamp" placeholder="yyyy-MM-dd">
						</div>
					</div>
				</div>
				<div class="layui-form-item ">
					<div class="layui-inline">
						<label class="layui-form-label">套餐价格:</label>
						<div class="layui-input-inline">
							<input type="text" name="orderPay" class="layui-input" lay-verify="required|number">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">客户名称:</label>
						<div class="layui-input-inline">
							<input type="text" name="orderCustName" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-form-item ">
					<div class="layui-input-block" style="text-align: center; padding-right: 120px">
						<button type="button"
							class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
							lay-filter="doSubmit" lay-submit="">提交</button>
						<button type="button" id="reset"
							class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
							重置</button>
					</div>
				</div>
			</div>
		</form>

	</div>

	<script src="${ctx }/static/layui/layui.js"></script>
	<script type="text/javascript">
		var tableIns;
		layui
			.use(
				['jquery', 'layer', 'form', 'table', 'laydate',
					'element'
				],
				function () {
					var $ = layui.jquery;
					var layer = layui.layer;
					var form = layui.form;
					var table = layui.table;
					var laydate = layui.laydate;
					var element = layui.element;

					laydate.render({
						elem: '#orderStarttime',
						type: 'datetime'
					});
					laydate.render({
						elem: '#orderEndtime',
						type: 'datetime'
					});
					laydate.render({
						elem: '#orderStarttime2',
						type: 'datetime'
					});
					laydate.render({
						elem: '#orderEndtime2',
						type: 'datetime'
					});

					//渲染数据表格
					tableIns = table
						.render({
							elem: '#rentTable' //渲染的目标对象
								,
							url: '${ctx}/order/loadAllOrder.action' //数据接口
								,
							title: '出租单数据表' //数据导出来的标题
								,
							toolbar: "#rentToolBar" //表格的工具条
								,
							height: 'full-220',
							cellMinWidth: 100 //设置列的最小默认宽度
								,
							page: true //是否启用分页
								,
							cols: [
								[ //列表数据
									{
										field: 'orderNumber',
										title: '宽带订单',
										align: 'center',
										width: '200'
									},
									{
										field: 'orderBandwidth',
										title: '宽带产品',
										align: 'center',
										width: '100'
									},
									{
										field: 'orderCustName',
										title: '客户姓名',
										align: 'center',
										width: '100'
									},
									{
										field: 'orderOperator',
										title: '经办人',
										align: 'center',
										width: '100'
									},
									{
										field: 'orderFeetype',
										title: '计费类型',
										align: 'center',
										width: '120',
										templet: function (d) {
											return d.orderFeetype == '1' ? '<font color=red>包年</font>' :
												'<font color=blue>包月</font>';
										}
									},
									{
										field: 'orderPay',
										title: '缴纳费用',
										align: 'center',
										width: '100'
									},
									{
										field: 'orderCreatetime',
										title: '签约时间',
										align: 'center',
										width: '180'
									},
									{
										field: 'orderStarttime',
										title: '生效时间',
										align: 'center',
										width: '180'
									},
									{
										field: 'orderEndtime',
										title: '到期时间',
										align: 'center',
										width: '180'
									},
									{
										field: 'orderState',
										title: '订单状态',
										align: 'center',
										width: '100',
										templet: function (d) {
											switch (d.orderState) {
												case 0:
													return '<font color=#FFB800>未生效</font>';
												case 1:
													return '<font color=#009688>生效中</font>';
												case 2:
													return '<font color=#c2c2c2>已过期</font>';
												case 3:
													return '<font color=#FF5722>将过期</font>';
												default:
													break;
											}
										}
									}, {
										fixed: 'right',
										title: '操作',
										toolbar: '#rentBar',
										width: 260,
										align: ''
									}
								]
							],
							done: function (data, curr, count) {
								//不是第一页时如果当前返回的的数据为0那么就返回上一页
								if (data.data.length == 0 &&
									curr != 1) {
									tableIns.reload({
										page: {
											curr: curr - 1
										}
									});
								}
							}
						})
					//模糊查询
					$("#doSearch")
						.click(
							function () {
								var params = $("#searchFrm")
									.serialize();
								tableIns
									.reload({
										url: "${ctx}/order/loadAllOrder.action?" +
											params,
										page: {
											curr: 1
										}
									})
							});
					//监听行工具事件
					table
						.on(
							'tool(rentTable)',
							function (obj) {
								var data = obj.data; //获得当前行数据
								var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
								if (layEvent === 'del') { //删除
									layer
										.confirm(
											'真的删除【' +
											data.orderNumber +
											'】这个业务单吗',
											function (
												index) {
												//向服务端发送删除指令
												$
													.post(
														"${ctx}/order/deleteOrder.action", {
															orderId: data.orderId
														},
														function (
															res) {
															layer
																.msg(res.msg);
															//刷新数据 表格
															tableIns
																.reload();
														})
											});
								} else if (layEvent === 'edit') { //编辑
									openUpdateRent(data);
								} else if (layEvent === 'exportOrder') {
									window.location.href = "${ctx}/stats/exportOrder.action?orderId=" +
										data.orderId;
								} else if (layEvent === 'renew') {
									renewOrder(data);
									/* parent.layui.element.tabAdd('bodyTab', {
									    title : "续费业务",
									    content :$("#renewOrderDiv").html(),
									    id:data.orderNumber
									}); */

								}
							});

					var url;
					var mainIndex;
					//打开修改页面
					function openUpdateRent(data) {
						mainIndex = layer
							.open({
								type: 1,
								title: '修改业务单',
								content: $("#saveOrUpdateDiv"),
								area: ['800px', '400px'],
								success: function (index) {
									form.val("dataFrm", data);
									url = "${ctx}/order/updateOrder.action";
								}
							});
					}

					function renewOrder(data) {
						mainIndex = layer
							.open({
								type: 1,
								title: '业务续费',
								content: $("#renewOrderDiv"),
								area: ['720px', '500px'],
								success: function (index) {
									url = "${ctx}/order/saveRenewOrder.action";
									form.val("renewOrderFrm", {
										orderBandwidth: data.orderBandwidth,
										orderPay: data.orderPay,
										orderCustName: data.orderCustName,
										orderStarttime: data.orderEndtime,
										orderFeetype:data.orderFeetype
									});
									$("#QRCode").prop('src', '${ctx}/order/getQRCode.action?str=' +
										data.orderPay);
									$.post("${ctx}/order/getRenewDate.action", {
										orderFeetype: data.orderFeetype,
										orderStarttime: data.orderEndtime
									}, function (order) {
										form.val("renewOrderFrm", {
											orderNumber: order.orderNumber,
											orderEndtime: order.orderEndtime
										});
									})
									//绑定复位按钮
									$("#reset").click(function () {
										$.post("${ctx}/order/initOrderForm.action", {

											},
											function (
												obj) {
												form
													.val(
														"renewOrderFrm",
														obj)
												orderStarttime = obj.orderEndtime;
											});
									});
									switch (data.orderFeetype) {
										case 1:
											$("#cbx").attr(
												'title', "包年");
											break;
										case 0:
											$("#cbx").attr(
												'title', "包月");
											break;
										default:
											$("#cbx").attr(
												'title', "包月");
											break;

									}

								}
							});

					}

					//保存
					form.on("submit(doSubmit)", function (obj) {
						//序列化表单数据
						var params = $("#renewOrderFrm").serialize();
						$.post(url, params, function (obj) {
							layer.msg(obj.msg);
							//关闭弹出层
							layer.close(mainIndex)
							//刷新数据 表格
							tableIns.reload();
						})
					});
				});
	</script>
</body>

</html>