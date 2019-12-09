<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>工作台</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx }/static/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx }/static/css/public.css" media="all" />
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote layui-bg-green">
		<div id="nowTime"></div>
	</blockquote>
	<div class="layui-row layui-col-space10">
		<div class="layui-col-lg6 layui-col-md6">
			<blockquote class="layui-elem-quote title">最新文章 <i class="layui-icon layui-red">&#xe756;</i></blockquote>
			<table class="layui-table mag0" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news"></tbody>
			</table>
		</div>
	</div>
	
	<!-- 查看公告的div -->
	<div id="desk_viewNewsDiv" style="padding: 10px;display: none;">
		<h2 id="view_title" align="center"></h2>
		<hr>
		<div style="text-align: right;">
			发布人:<span id="view_opername"></span>  <span style="display: inline-block;width: 20px" ></span>
			发布时间:<span id="view_createtime"></span>
		</div>
		<hr>
		<div id="view_content"></div>
	</div>
	<script type="text/javascript" src="${ctx }/static/layui/layui.js"></script>
	<script type="text/javascript">
	
	//获取系统时间
	var newDate = '';
	getLangDate();
	//值小于10时，在前面补0
	function dateFilter(date){
	    if(date < 10){return "0"+date;}
	    return date;
	}
	function getLangDate(){
	    var dateObj = new Date(); //表示当前系统时间的Date对象
	    var year = dateObj.getFullYear(); //当前系统时间的完整年份值
	    var month = dateObj.getMonth()+1; //当前系统时间的月份值
	    var date = dateObj.getDate(); //当前系统时间的月份中的日
	    var day = dateObj.getDay(); //当前系统时间中的星期值
	    var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	    var week = weeks[day]; //根据星期值，从数组中获取对应的星期字符串
	    var hour = dateObj.getHours(); //当前系统时间的小时值
	    var minute = dateObj.getMinutes(); //当前系统时间的分钟值
	    var second = dateObj.getSeconds(); //当前系统时间的秒钟值
	    var timeValue = "" +((hour >= 12) ? (hour >= 18) ? "晚上" : "下午" : "上午" ); //当前时间属于上午、晚上还是下午
	    newDate = dateFilter(year)+"年"+dateFilter(month)+"月"+dateFilter(date)+"日 "+" "+dateFilter(hour)+":"+dateFilter(minute)+":"+dateFilter(second);
	    document.getElementById("nowTime").innerHTML = "亲爱的${user.realname}，"+timeValue+"好！ 欢迎使用GH宽带业务系统。当前时间为： "+newDate+"　"+week;
	    setTimeout("getLangDate()",1000);
	}

	layui.use(['form','element','layer','jquery'],function(){
	    var form = layui.form,
	        layer = parent.layer === undefined ? layui.layer : top.layer,
	        element = layui.element;
	        $ = layui.jquery;
	    //上次登录时间【此处应该从接口获取，实际使用中请自行更换】
	    $(".loginTime").html(newDate.split("日")[0]+"日</br>"+newDate.split("日")[1]);
	    //icon动画
	    $(".panel a").hover(function(){
	        $(this).find(".layui-anim").addClass("layui-anim-scaleSpring");
	    },function(){
	        $(this).find(".layui-anim").removeClass("layui-anim-scaleSpring");
	    })
	    $(".panel a").click(function(){
	        parent.addTab($(this));
	    })
	    //最新文章列表
	    $.get("${ctx}/news/loadAllNews.action?page=1&limit=10",function(data){
	        var hotNewsHtml = '';
	        for(var i=0;i<data.data.length;i++){
	            hotNewsHtml += '<tr ondblclick=viewNews('+data.data[i].id+')>'
	                +'<td align="left"><a href="javascript:;"> '+data.data[i].title+'</a></td>'
	                +'<td>'+data.data[i].createtime.substring(0,10)+'</td>'
	                +'</tr>';
	        }
	        $(".hot_news").html(hotNewsHtml);
	        $(".userAll span").text(data.length);
	    })

	})

	function viewNews(id){
		$.get("${ctx}/news/loadNewsById.action",{id:id},function(news){
			layer.open({
				type:1,
				title:'查看公告',
				content:$("#desk_viewNewsDiv"),
				area:['800px','550px'],
				success:function(index){
					$("#view_title").html(news.title);
					$("#view_opername").html(news.opername);
					$("#view_createtime").html(news.createtime);
					$("#view_content").html(news.content);
				}
			});
		})
	}
	</script>
</body>
</html>