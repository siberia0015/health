<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>医疗资源</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<blockquote class="layui-elem-quote">
    具体信息请以官方网站为准
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>医院&药店</legend>
</fieldset>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">详情</a>
</script>
<script>
    layui.use('table', function(){
        var $ =layui.jquery;
        var table = layui.table;
        table.render({
            elem: '#test'
            ,id:'test'
            ,url:'/medical/getAll'
            ,method:'get'
            ,page:true
            ,limit:10
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'name', width:300, title: '医院名'}
                ,{field:'place', width:400, title: '所属地区'}
                ,{field:'information', width:800, title: '简介'}
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
            if(obj.event === 'edit'){
                $.ajax({
                    type: 'get'
                    ,url: '/medical/getDetail'
                    ,data: data
                    ,success:function(res){
                        window.location.href="/to/medical_detail";
                    }
                });
            }
        });
    });
</script>

</body>
</html>