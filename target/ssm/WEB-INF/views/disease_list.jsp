<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查询历史记录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
</head>
<body>

<blockquote class="layui-elem-quote layui-text">
    查询历史记录&nbsp;&nbsp;<a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询历史记录</legend>
</fieldset>
<div class="demoTable">
    起始时间：
    <div class="layui-inline">
        <input class="layui-input" name="begin" id="begin" autocomplete="off">
    </div>
    结束时间：
    <div class="layui-inline">
        <input class="layui-input" name="end" id="end" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="tablea" lay-filter="tablea"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    layui.use(['form', 'layer','util', 'laydate','table'], function(){
        var form = layui.form
            ,laydate = layui.laydate
            ,table = layui.table
            ,$ = layui.jquery
            ,util = layui.util;
        //日期
        laydate.render({
            elem: '#begin'
        });
        laydate.render({
            elem: '#end'
        });
        //方法级渲染
        table.render({
            elem: '#tablea'
            ,id:'tablea'
            ,url:'/disease/selectByUser'
            , cols: [[
                {field:'title', title: '标题', align: 'center',width:100}
                ,{field:'begindate', title: '开始日期', align: 'center',width:200,templet:function(d){return util.toDateString(d.date, "yyyy-MM-dd");}}
                ,{field:'enddate', title: '结束日期', align: 'center',width:200,templet:function(d){return util.toDateString(d.date, "yyyy-MM-dd");}}
                ,{fixed: 'right', title:'操作', align: 'center',toolbar: '#barDemo', width:150}
            ]]
            , id: 'testReload'
            , page: true
            , method:'get'
            , limit:10
            ,done: function (res, curr, count) {
                $("table").css("width", "100%");
            },
        });
        //监听行工具事件
        table.on('tool(tablea)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'detail'){
                $.ajax({
                    type: 'get'
                    ,url: '/disease/getDetail'
                    ,data: data
                    ,success:function(res){
                        window.open('/to/disease_detail');
                    }
                });
            }else if(obj.event === 'delete'){
                layer.confirm('确认要删除吗？', {
                        btn : [ '确定', '取消' ]//按钮
                    },function(index) {
                    //do something
                    $.ajax({
                        type: 'get'
                        ,url: '/disease/delete'
                        ,data: data
                        ,success:function(res){
                            layer.msg('删除成功！');
                        }
                        ,fail:function (res) {
                            layer.msg('删除失败！');
                        }
                    });
                    layer.close(index);
                });
            }
        });
        $('.layui-btn').click(function () {
            var begin = $('#begin').val();
            var end = $('#end').val();
            table.reload('testReload', {
                url: '/disease/selectByUser'
                ,methods:"get"
                ,limit:10
                ,where: {
                    beginDate : begin
                    ,endDate : end
                }
                ,page: {
                    curr: 1
                }
                ,done: function (res, curr, count) {
                    $("table").css("width", "100%");
                },
            });
        })

    });
</script>

</body>
</html>

