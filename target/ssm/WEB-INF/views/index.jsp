<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <!-- 引入样式 -->
    <script type="text/javascript" src="js/jquery-3.3.1.slim.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css"><!--引入layui文件-->
    <style>

        div{
            text-align:center;width:100%;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <div class="row">
            <div class="col-xs-12" id="aaa">
                <h1>健康管理系统</h1>
                <h3><em>made by YXY</em></h3>
                <div>
                    <a href="/to/login" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal">
                        开始使用
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
</body>
</html>
