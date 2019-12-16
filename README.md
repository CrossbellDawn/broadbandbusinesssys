# GZHMTJavaEE课设项目——校园宽带业务管理系统
本项目内容JavaEE期末课设，将保持持续更新；

如果觉得对您有用，欢迎点击Star按钮，感谢支持；

任何建议欢迎邮件联系。

- 邮箱：18302087427@163.com
- Github：https://github.com/acrx016


## 目录
* [GZHMTJavaEE课设项目——校园宽带业务管理系统](#gzhmtjavaee课设项目校园宽带业务管理系统)
  * [项目介绍](#项目介绍)
    * [系统功能](#系统功能)
    * [技术栈](#技术栈)
    * [相关工具组件](#相关工具组件)
  * [启动](#启动)
  * [项目运行图](#项目运行图)

## 项目介绍
本系统设计综合应用Java所学知识开发一个基于SSM（Sping+Spring MVC+MyBatis）框架的校园宽带业务管理系统

项目参考自[基于SSM+layui的汽车出租项目](https://www.bilibili.com/video/av65199259)

### 系统功能
- [x] 用户登录
- [x] 菜单导航
- [x] RABC管理（系统用户-角色-菜单权限）
- [x] 宽带业务客户、套餐产品、订单设计
- [x] 套餐续费
- [x] task定时任务——生成到期订单的提醒公告
- [x] 强化输入组件的数据联动
- [x] 更换druid数据连接池
- [x] 验证码、二维码
- [x] Excel导出客户数据表、订单
- [x] 引入echarts组件，完成数据统计（柱状图、条形图）

### 技术栈
java 8 + maven + ssm + layui 

### 相关工具组件
- 项目开发语言：java 8；
- 项目构建管理工具：maven；
- 前端页面框架：[layui 2.4.x](https://layui.com/)、[layuicms 2.0](http://layuicms.com/)、[dtree](https://fly.layui.com/extend/dtree/)、[echarts](https://www.echartsjs.com/zh/index.html)；
- 核心框架：spring 5.0.2，springmvc 5.0.2；
- 持久层框架：mybatis 3.4.5；
- 数据库连接池：[alibaba-druid 1.1.21](https://github.com/alibaba/druid/)；
- 分页插件：[github-pagehelper 5.1.2](https://pagehelper.github.io/)；
- 二维码生成工具包：[zxing 3.4.0](https://github.com/zxing/zxing)；
- Excel工具包：[apache-poi 4.1.0](https://poi.apache.org/)；
- 验证码工具包：[hutool 4.6.8](https://hutool.cn/docs/#/)；

## 启动
1. 从git克隆项目导入到编译器，maven-update project下载相关依赖包
```
git clone https://github.com/acrx016/broadbandbusinesssys.git
```
2. 导入数据库文件到MySQL
```
broadbandbusinesssys/src/main/resources/database/broadbandbusinessdb.sql
```
3. 部署到tomcat既可运行启动,本地访问路径:
```
http://localhost:8080/ssm-demo/
```

## 项目运行图
1. 登录界面
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576396963691-1576396963695.png)
2. 系统工作台
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576397010271-1576397010279.png)
3. 业务管理
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576397060872-1576397060875.png)
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576397096819-1576397096823.png)
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576397128040-1576397128042.png)
4. 数据统计
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576397169076-1576397169078.png)
5. 订单导出Excel
![title](https://raw.githubusercontent.com/acrx016/myImage/master/JavaEE%20SSM%20Design/2019/12/15/1576400019009-1576400019011.png)
