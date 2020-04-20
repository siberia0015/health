<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/30
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>身体状况</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css">--%><!--引入layui文件-->
</head>
<body>
<blockquote class="layui-elem-quote">
    更新您的信息
    <a class="layui-btn layui-btn-normal" href="/to/body_changeInfo" target="_self">编辑</a>
    <a style="float:right;" class="layui-btn layui-btn-normal" href="/to/home" target="_self">返回</a>
</blockquote>

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
            <th>体重（kg）</th>
            <th>目标体重（kg）</th>
            <th>到达目标体重日期</th>
            <th>身高（cm）</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.SESSION_USERNAME}</td>
            <td>${sessionScope.BODY_INFO.weight}</td>
            <td>${sessionScope.BODY_INFO.goalweight}</td>
            <td>${sessionScope.BODY_INFO.goalweightdate}</td>
            <td>${sessionScope.BODY_INFO.height}</td>
        </tr>
        </tbody>
    </table>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>胸围（cm）</th>
            <th>腰围（cm）</th>
            <th>臀围（cm）</th>
            <th>血型</th>
            <th>血压（mmHg）</th>
            <th>血糖（mmol/L）</th>
            <th>血脂（mmol/L）</th>
            <th>脉搏（次/分）</th>
            <th>左眼视力（度）</th>
            <th>右眼视力（度）</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${sessionScope.BODY_INFO.bust}</td>
            <td>${sessionScope.BODY_INFO.waist}</td>
            <td>${sessionScope.BODY_INFO.hip}</td>
            <td>${sessionScope.BODY_INFO.blood}</td>
            <td>${sessionScope.BODY_INFO.pressure}</td>
            <td>${sessionScope.BODY_INFO.suger}</td>
            <td>${sessionScope.BODY_INFO.fat}</td>
            <td>${sessionScope.BODY_INFO.pulse}</td>
            <td>${sessionScope.BODY_INFO.lefteye}</td>
            <td>${sessionScope.BODY_INFO.righteye}</td>
        </tr>
        </tbody>
    </table>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>推荐正常值</legend>
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
            <th>血压（mmHg）</th>
            <th>血糖（mmol/L）</th>
            <th>血脂（mmol/L）</th>
            <th>脉搏（次/分）</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>≈90</td>
            <td>3.9~6.1</td>
            <td>2.8~5.17</td>
            <td>60~100</td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>

<%--<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>--%>
<script>

</script>

</body>
</html>