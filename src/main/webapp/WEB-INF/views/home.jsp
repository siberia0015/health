<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/30
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>健康管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css"><!--引入layui文件-->
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <a class="layui-btn" style="background-color: #23262E" href="/to/home">健康管理系统</a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="javascript:;" data-href="/to/new_index">控制台*</a></li>
            <li class="layui-nav-item"><a href="javascript:;" data-href="/to/userInfo">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它*</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理*</a></dd>
                    <dd><a href="">消息管理*</a></dd>
                    <dd><a href="">授权管理*</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.SESSION_USERNAME}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" data-href="/to/userInfo">基本资料</a></dd>
                    <dd><a href="">安全设置*</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/user/logout">退出登陆</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">健康记录</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-href="/body/getInfo">身体状况</a></dd>
                        <%--<dd><a href="javascript:;" data-href="/to/record">历史记录</a></dd>--%>
                        <dd><a href="javascript:;" data-href="/to/body_dailyRecord">每日记录</a></dd>
                        <dd><a href="javascript:;" data-href="/to/disease">病情记录</a></dd>
                        <dd><a href="javascript:;">行程记录*</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">我的团体*</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">所属团体*</a></dd>
                        <dd><a href="javascript:;">讨论区*</a></dd>
                        <dd><a href="javascript:;">团体公告*</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;" data-href="/to/medical">医疗资源</a></li>
                <li class="layui-nav-item"><a href="javascript:;" data-href="/to/recommend">推荐信息*</a></li>
                <li class="layui-nav-item"><a href="javascript:;" data-href="/to/notice">网站公告</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;" id="content">欢迎回来，${sessionScope.SESSION_USERNAME}！</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['jquery','form','layer','element'], function(){
        var element = layui.element;
        var $ =layui.jquery;
        var form = layui.form;//表单验证
        var layer= layui.layer;
        //定义事件：点击左侧菜单让中间部分发生改变
        $(".layui-nav li a").click(function () {
            var url=$(this).data("href");
            $("#content").load(url);
        });
    });
</script>
</body>
</html>
