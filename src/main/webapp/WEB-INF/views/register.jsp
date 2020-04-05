<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/30
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册账号</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
   欢迎您注册，请如实填写注册信息！&nbsp;&nbsp;<a style="float:right;" class="layui-btn layui-btn-normal" href="/to/login" target="_self">返回</a>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>必填信息</legend>
</fieldset>

<form class="layui-form" action="/user/register" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">至少6位，由数字和字母组成</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-inline">
            <input type="password" name="repeatPassword" lay-verify="required" placeholder="请重复密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="禁" title="？？？" disabled="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-inline">
            <input type="text" name="age" lay-verify="required" autocomplete="off" placeholder="请输入年龄" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" lay-verify="email" autocomplete="off" placeholder="请输入电子邮箱" class="layui-input">
        </div>
    </div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>其他信息</legend>
</fieldset>

    <div class="layui-form-item">
        <label class="layui-form-label">民族</label>
        <div class="layui-input-inline">
            <input type="text" name="nation" lay-verify="title" autocomplete="off" placeholder="请输入民族" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday" id="birthday" autocomplete="off" placeholder="请选择生日" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入手机号" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">个人简介</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="information"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit lay-filter="register">确认注册</button>
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

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            username: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,password: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(register)', function(data){
/*            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;*/
        });

    });
</script>

</body>
</html>
