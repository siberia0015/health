<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/4/7
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    修改信息&nbsp;&nbsp;<a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>修改基本信息</legend>
</fieldset>
<form class="layui-form" action="/user/changeInfo" method="get">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" autocomplete="off" placeholder="请输入姓名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" name="sex" placeholder="请输入性别" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday" id="birthday" autocomplete="off" placeholder="请选择日期" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-inline">
            <input type="text" name="age" placeholder="请输入年龄" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">民族</label>
        <div class="layui-input-inline">
            <input type="text" name="nation" autocomplete="off" placeholder="请输入民族" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" name="address" autocomplete="off" placeholder="请输入地址" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit lay-filter="change">确认修改</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#birthday'
        });
        //监听提交
        form.on('submit(change)', function(data){
            /*            layer.alert(JSON.stringify(data.field), {
                            title: '最终的提交信息'
                        })
                        return false;*/
        });
    });
</script>
</body>
</html>
