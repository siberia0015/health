<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/30
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <legend>修改身体状况</legend>
</fieldset>

<form class="layui-form" action="/body/changeInfo" method="get">
    <div class="layui-form-item">
        <label class="layui-form-label">体重</label>
        <div class="layui-input-inline">
            <input type="text" name="weight" autocomplete="off" placeholder="请输入体重" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">目标体重</label>
        <div class="layui-input-inline">
            <input type="text" name="goalweight" placeholder="请输入目标体重" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">到达目标体重日期</label>
        <div class="layui-input-inline">
            <input type="text" name="goalweightdate" id="goalweightdate" autocomplete="off" placeholder="请选择日期" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身高</label>
        <div class="layui-input-inline">
            <input type="text" name="height" placeholder="请输入身高" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">胸围</label>
        <div class="layui-input-inline">
            <input type="text" name="bust" autocomplete="off" placeholder="请输入胸围" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">腰围</label>
        <div class="layui-input-block">
            <input type="text" name="waist" autocomplete="off" placeholder="请输入腰围" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">臀围</label>
        <div class="layui-input-block">
            <input type="text" name="hip" autocomplete="off" placeholder="请输入臀围" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">血型</label>
        <div class="layui-input-block">
            <input type="text" name="blood" autocomplete="off" placeholder="请输入血型" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">血压</label>
        <div class="layui-input-block">
            <input type="text" name="pressure" autocomplete="off" placeholder="请输入血压" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">血糖</label>
        <div class="layui-input-block">
            <input type="text" name="suger" autocomplete="off" placeholder="请输入血糖" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">血脂</label>
        <div class="layui-input-block">
            <input type="text" name="fat" autocomplete="off" placeholder="请输入血脂" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">脉搏</label>
        <div class="layui-input-block">
            <input type="text" name="pulse" autocomplete="off" placeholder="请输入脉搏" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">左眼视力</label>
        <div class="layui-input-block">
            <input type="text" name="lefteye" autocomplete="off" placeholder="请输入左眼视力" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">右眼视力</label>
        <div class="layui-input-block">
            <input type="text" name="righteye" autocomplete="off" placeholder="请输入右眼视力" class="layui-input">
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
            elem: '#goalweightdate'
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

