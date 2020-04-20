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
    查看${sessionScope.hospital.name}信息
    <a class="layui-btn layui-btn-normal" href="/to/make_assess" target="_self">评分</a>
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>所在地址</legend>
</fieldset>
<p>${sessionScope.hospital.address}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>简介</legend>
</fieldset>
<p>${sessionScope.hospital.information}</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>相关链接</legend>
</fieldset>
&nbsp;
<button class="layui-btn layui-btn-normal" onclick="javascrtpt:window.location.href='${sessionScope.hospital.link}';">百度百科</button>
&nbsp;
<button class="layui-btn layui-btn-normal" onclick="javascrtpt:window.location.href='${sessionScope.hospital.website}';">官方网站</button>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户评价</legend>
</fieldset>
<table class="layui-hide" id="test" lay-filter="assess"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="agree">赞同</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="disagree">反对</a>
    <a class="layui-btn layui-btn-xs layui-btn-disabled" lay-event="delete">删除评价</a>
</script>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var $ =layui.jquery;
        var table = layui.table;
        table.render({
            elem: '#test'
            ,id:'test'
            ,url:'/assess/getByHospital'
            ,method:'get'
            ,page:true
            ,limit:10
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'user', width:200, title: '评价用户ID'}
                ,{field:'rank', width:200, title: '评分'}
                ,{field:'information', width:800, title: '评价内容'}
                ,{field:'agree', width:200, title: '赞同数'}
                ,{field:'disagree', width:200, title: '反对数'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
            ]]
            ,done: function (res, curr, count) {
                $("table").css("width", "100%");
            },
        });
        //监听行工具事件
        table.on('tool(assess)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'agree'){
                $.ajax({
                    type: 'get'
                    ,url: '/assess/agree'
                    ,data: data
                    ,success:function(res){
                        alert('点赞成功');
                    }
                });
            }else if(obj.event === 'disagree'){
                $.ajax({
                    type: 'get'
                    ,url: '/assess/disagree'
                    ,data: data
                    ,success:function(res){
                        alert('反对成功');
                    }
                });
            }else if(obj.event === 'delete'){
                alert('delete');
            }
        });
    });
</script>
</body>
</html>
