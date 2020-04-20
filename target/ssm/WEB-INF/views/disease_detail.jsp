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
    查看${sessionScope.disease.title}信息
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/disease_list" target="_self">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>标题</legend>
</fieldset>
<p>${sessionScope.disease.title}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>持续时间</legend>
</fieldset>
<p>${sessionScope.disease.begindate}至${sessionScope.disease.enddate}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>具体内容</legend>
</fieldset>
<p>${sessionScope.disease.information}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>服用药物</legend>
</fieldset>
<p>${sessionScope.disease.medicine}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>就诊医院</legend>
</fieldset>
<p>${sessionScope.disease.hospital}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>就诊医师</legend>
</fieldset>
<p>${sessionScope.disease.doctor}</p>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>

</script>
</body>
</html>
