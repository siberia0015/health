<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>公告</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<blockquote class="layui-elem-quote">
    请及时阅读公告
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>公告列表</legend>
</fieldset>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
</script>
<script>
    layui.use(['table','util'], function(){
        var $ =layui.jquery;
        var table = layui.table;
        var util = layui.util;
        table.render({
            elem: '#test'
            ,id:'test'
            ,url:'/notice/getAll'
            ,method:'get'
            ,page:true
            ,limit:10
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'title', width:300, title: '标题'}
                ,{field:'date', width:400, title: '发布日期',templet:function(d){return util.toDateString(d.date, "yyyy-MM-dd HH:mm:ss");}}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,done: function (res, curr, count) {
                $("table").css("width", "100%");
            },
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'detail'){
                $.ajax({
                    type: 'get'
                    ,url: '/notice/getDetail'
                    ,data: data
                    ,success:function(res){
                        window.open('/to/notice_detail');
                    }
                });
            }
        });
    });
</script>

</body>
</html>