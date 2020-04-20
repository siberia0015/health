<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/4/11
  Time: 22:33
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
    <style type="text/css">
        p{ text-indent:2em;}
        { text-indent:2em;}
    </style>
</head>
<body>
<blockquote class="layui-elem-quote">
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_parent">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>${sessionScope.notice.title}</legend>
</fieldset>
<p>${sessionScope.notice.content}</p>


<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>

</body>
</html>
