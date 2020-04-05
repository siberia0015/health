<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/19
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医疗资源信息</title>
</head>
<body>
<form id="form" action="/medical/select" method="get">
    选择地点：<input type="text" id="place" name="place"><input type="submit" value="确定">
</form>
<a href="/user/goTest" methods="post">测试</a>
<table border="1" cellpadding="1" cellspacing="10">
    <tr>
        <th></th>
        <td>医院名</td>
        <td>所属地区</td>
        <td>简介</td>
    </tr>
</table>
<form action="/user/goHome"><input type="submit" value="返回"></input></form>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
</body>
</html>
