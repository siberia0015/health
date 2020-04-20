<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/17
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
    <h1>恭喜你，注册成功！<br>你的ID是${sessionScope.userInfo.userid}</h1>
    <form action="/to/login"><input type="submit" value="返回"></input></form>
    <script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
</body>
</html>
