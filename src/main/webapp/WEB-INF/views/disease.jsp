<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/30
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>病情记录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">--%>
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    病历记录&nbsp;&nbsp;<a class="layui-btn layui-btn-normal" href="/to/disease_list" target="_self">查看历史记录</a>
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>

</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>身体不适状况</legend>
</fieldset>

<form class="layui-form" action="/disease/add" method="get">
    <div class="layui-form-item">
        <label class="layui-form-label">开始日期</label>
        <div class="layui-input-inline">
            <input type="text" name="begindate" id="begindate" autocomplete="off" placeholder="请输入开始日期" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结束日期</label>
        <div class="layui-input-inline">
            <input type="text" name="enddate" id="enddate" autocomplete="off" placeholder="请输入结束日期" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="information"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">使用药物</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="medicine"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">就诊医院</label>
        <div class="layui-input-inline">
            <input type="text" name="hospital" autocomplete="off" placeholder="请输入医院" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">诊断医师</label>
        <div class="layui-input-inline">
            <input type="text" name="doctor" autocomplete="off" placeholder="请输入医师" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit lay-filter="diseaseRecord">确认</button>
        </div>
    </div>
</form>

<%--<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>--%>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        //日期
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        //监听提交
        laydate.render({
            elem: '#begindate'
        });
        laydate.render({
            elem: '#enddate'
        });
        form.on('submit(diseaseRecord)', function(data){
        });
    });
</script>

</body>
</html>
