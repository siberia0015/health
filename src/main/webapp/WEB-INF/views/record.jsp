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

<form class="layui-form" action="/record/select" method="get">
    <div class="layui-form-item">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-inline">
            <input type="text" name="date" id="date" autocomplete="off" placeholder="请选择日期" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <button type="submit" class="layui-btn" lay-submit lay-filter="select">搜索</button>
        </div>
    </div>
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>身体状况一览</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>姓名</th>
            <th>日期</th>
            <th>体重（kg）</th>
            <th>身高（cm）</th>
            <th>胸围（cm）</th>
            <th>腰围（cm）</th>
            <th>臀围（cm）</th>
            <th>血压（mmHg）</th>
            <th>血糖（mmol/L）</th>
            <th>血脂（mmol/L）</th>
            <th>脉搏（次/分）</th>
            <th>左眼视力（度）</th>
            <th>右眼视力（度）</th>
            <th>体温（℃）</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.SESSION_USERNAME}</td>
            <td>${sessionScope.RECORD_INFO.date}</td>
            <td>${sessionScope.RECORD_INFO.weight}</td>
            <td>${sessionScope.RECORD_INFO.height}</td>
            <td>${sessionScope.RECORD_INFO.bust}</td>
            <td>${sessionScope.RECORD_INFO.waist}</td>
            <td>${sessionScope.RECORD_INFO.hip}</td>
            <td>${sessionScope.RECORD_INFO.pressure}</td>
            <td>${sessionScope.RECORD_INFO.suger}</td>
            <td>${sessionScope.RECORD_INFO.fat}</td>
            <td>${sessionScope.RECORD_INFO.pulse}</td>
            <td>${sessionScope.RECORD_INFO.lefteye}</td>
            <td>${sessionScope.RECORD_INFO.righteye}</td>
            <td>${sessionScope.RECORD_INFO.temperature}</td>
        </tr>
        </tbody>
    </table>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>详细信息</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>运动情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.sport}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>饮食情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.food}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>睡眠情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.sleep}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>皮肤情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.skin}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>精力情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.energy}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>身体不适</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.pain}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>心理状况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.spirit}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>工作/学习时间</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.worktime}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>今日目标</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.goal}</td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.RECORD_INFO.tips}</td>
        </tr>
        </tbody>
    </table>
</div>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#date'
        });
        //监听提交
        form.on('submit(select)', function(data){
            /*            layer.alert(JSON.stringify(data.field), {
                            title: '最终的提交信息'
                        })
                        return false;*/
        });

    });
</script>

</body>
</html>

