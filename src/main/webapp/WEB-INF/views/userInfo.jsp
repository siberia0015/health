<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/4/6
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>基本资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css"><!--引入layui文件-->
</head>
<body>
<blockquote class="layui-elem-quote">
    更新您的信息
    <a class="layui-btn layui-btn-normal" href="/to/userInfo_change" target="_self">编辑</a>
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>基本资料</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>出生日期</th>
            <th>民族</th>
            <th>邮箱</th>
            <th>地址</th>
            <th>所属团体</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.userInfo.userid}</td>
            <td>${sessionScope.userInfo.username}</td>
            <td>${sessionScope.userInfo.sex}</td>
            <td>${sessionScope.userInfo.age}</td>
            <td>${sessionScope.userInfo.birthday}</td>
            <td>${sessionScope.userInfo.nation}</td>
            <td>${sessionScope.userInfo.email}</td>
            <td>${sessionScope.userInfo.address}</td>
            <td>${sessionScope.userInfo.organization}</td>
        </tr>
        </tbody>
    </table>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>个人简介</legend>
</fieldset>
<div class="layui-form">
    ${sessionScope.userInfo.information}
</div>
</body>
</html>
