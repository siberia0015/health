<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/4/12
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>发表评价</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    发表评价：${sessionScope.hospital.name}&nbsp;&nbsp;<a style="float:right;" class="layui-btn layui-btn-normal" href="/to/medical_detail" target="_self">返回</a>
</blockquote>
<form class="layui-form" action="/assess/add" method="get">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>评分</legend>
    </fieldset>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <div id="number"></div>
            <input id="rank" type="text" name="rank" value="" style="display:none">
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>评价内容</legend>
    </fieldset>
    <div class="layui-form-item layui-form-text">
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="information"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit lay-filter="assess">确认提交</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    layui.use(['rate','form'], function(){
        var rate = layui.rate;
        var $ = layui.jquery;
        //渲染
        var ins1 = rate.render({
            elem: '#number'  //绑定元素
            ,text:true
            ,setText: function(value){
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
                $("#rank").val(value);
            }
            ,choose: function(value){
            }
        });
        form.on('submit(assess)',function (data) {
            /*layer.alert(JSON.stringify(data.field), {
                title: rank
            })*/
        });
    });
</script>
</body>
</html>
