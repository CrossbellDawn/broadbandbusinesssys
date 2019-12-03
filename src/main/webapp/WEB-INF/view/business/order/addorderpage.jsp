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
				<label class="layui-form-label">宽带编号:</label>
				<div class="layui-input-inline">
					<input type="text" name="bandId" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">业务名称:</label>
				<div class="layui-input-inline">
					<input type="text" name="bandWith" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline" style="text-align: center; padding-left: 20px;">
				<button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search"
					id="doSearch">查询</button>
				<button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
			</div>
		</div>
	</form>
	<!-- 搜索条件结束 -->

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="boardbandTable" lay-filter="boardbandTable"></table>
	<div id="boardbandBar" style="display: none;">
	</div>
	<script type="text/html" id="bandtoolBar">
		{{#  if(true){ }}
		<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="exit">订购业务</a>
		{{#  } else { }}
		{{#  } }}
	</script>
	<!-- 数据表格结束 -->

	<!-- 修改的弹出层开始 -->
	<div style="display: none; padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">业务单号:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" readonly class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">宽带业务:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" readonly class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">操作人员:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">计费类型:</label>
					<div class="layui-input-inline">
						<input type="radio" name="orderFeetype" value="1" title="包年">
						<input type="radio" name="orderFeetype" value="0" title="包月">
					</div>
				</div>
				<div class="layui-inline">
						<label class="layui-form-label">租约费用:</label>
						<div class="layui-input-inline">
							<input type="text" name="bandId" autocomplete="off" class="layui-input">
						</div>
					</div>
				<div class="layui-inline">
					<label class="layui-form-label">起始时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">到期时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="bandId" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<button type="button"
						class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
						lay-filter="doSubmit" lay-submit="">提交</button>
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

			//渲染数据表格
			tableIns = table.render({
				elem: '#boardbandTable' //渲染的目标对象
					,
				url: '${ctx}/boardband/loadAllBoardBand.action' //数据接口
					,
				title: '客户数据表' //数据导出来的标题
					,
				toolbar: "#boardbandToolBar" //表格的工具条
					,
				height: 'full-220',
				cellMinWidth: 100 //设置列的最小默认宽度
					,
				page: true //是否启用分页
					,
				cols: [
					[ //列表数据
						{
							field: 'bandId',
							title: '编号',
							align: 'center',
							width: '60'
						},
						{
							field: 'bandWidth',
							title: '业务名称',
							align: 'center',
							width: '200'
						},
						{
							field: 'bandSpeed',
							title: '下行速率',
							align: 'center',
							width: '120'
						},
						{
							field: 'bandMouthly',
							title: '包月费用(元）',
							align: 'center',
							width: '120'
						},
						{
							field: 'bandYearly',
							title: '包年费用(元)',
							align: 'center',
							width: '120'
						},
						{
							field: 'bandDesc',
							title: '产品描述',
							align: 'center',
							width: '220'
						},
						{
							field: 'bandState',
							title: '产品状态',
							align: 'center',
							width: '100',
							templet: function (d) {
								return d.bandState == '1' ? '<font color=#009688>上架</font>' :
									'<font color=#c2c2c2>下架</font>';
							}
						},
						{
							fixed: 'right',
							title: '操作',
							toolbar: '#bandtoolBar',
							width: 160,
							align: 'center'
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
			$("#doSearch").click(function () {
				var params = $("#searchFrm")
					.serialize();
				tableIns
					.reload({
						url: "${ctx}/boardband/loadAllBoardBand.action?" +
							params,
						page: {
							curr: 1
						},
						method: 'post'
					})
			});

			//监听行工具事件
			table.on('tool(boardbandTable)', function (obj) {
				var data = obj.data; //获得当前行数据
				var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				if (layEvent === 'edit') { //编辑
					openUpdateBoardBand(data);
				}
			});

			var url;
			var mainIndex;
			//打开添加页面
			function openAddBoardBand() {
				mainIndex = layer
					.open({
						type: 1,
						title: '添加客户',
						content: $("#saveDiv"),
						area: ['800px', '300px'],
						success: function (index) {
							//清空表单数据       
							$("#saveDataFrm")[0].reset();
							url = "${ctx}/boardband/addBoardBand.action";
						}
					});
			}
			//打开修改页面
			function openUpdateBoardBand(data) {
				mainIndex = layer
					.open({
						type: 1,
						title: '修改客户',
						content: $("#saveOrUpdateDiv"),
						area: ['1100px', '300px'],
						success: function (index) {
							form.val("dataFrm", data);
							url = "${ctx}/boardband/updateBoardBand.action";
						}
					});
			}
			//保存
			form.on("submit(saveSubmit)", function (obj) {
				var params = $("#saveDataFrm").serialize();
				console.log(params);
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
				console.log(params);
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
				var checkStatus = table
					.checkStatus('boardbandTable');
				var data = checkStatus.data;
				var params = "";
				$.each(data, function (i, item) {
					if (i == 0) {
						params += "ids=" + item.bandId;
					} else {
						params += "&ids=" + item.bandId;
					}
				});
				layer
					.confirm(
						'真的删除选中的这些客户吗',
						function (index) {
							//向服务端发送删除指令
							$
								.post(
									"${ctx}/boardband/deleteBatchBoardBand.action",
									params,
									function (
										res) {
										layer
											.msg(res.msg);
										//刷新数据 表格
										tableIns
											.reload();
									})
						});
			}
		});
	</script>
</body>

</html>