<%--
  Created by IntelliJ IDEA.
  User: 厦门科长
  Date: 2020/3/15
  Time: 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/RefResources/layui/css/layui.css"><!--引入layui文件-->
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        #wrap {
            height: 719px;
            width: 100;
            background-image: url(/images/indexIMG.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
        }

        #head {
            height: 120px;
            width: 100;
            background-color: #66CCCC;
            text-align: center;
            position: relative;
        }

        #foot {
            width: 100;
            height: 126px;
            background-color: #CC9933;
            position: relative;
        }

        #wrap .logGet {
            height: 408px;
            width: 368px;
            position: absolute;
            background-color: #FFFFFF;
            top: 20%;
            right: 15%;
        }

        .logC a button {
            width: 100%;
            height: 45px;
            background-color: #ee7700;
            border: none;
            color: white;
            font-size: 18px;
        }

        .logGet .logD.logDtip .p1 {
            display: inline-block;
            font-size: 28px;
            margin-top: 30px;
            width: 86%;
        }

        #wrap .logGet .logD.logDtip {
            width: 86%;
            border-bottom: 1px solid #ee7700;
            margin-bottom: 60px;
            margin-top: 0px;
            margin-right: auto;
            margin-left: auto;
        }

        .logGet .lgD img {
            position: absolute;
            top: 12px;
            left: 8px;
        }

        .logGet .lgD input {
            width: 100%;
            height: 42px;
            text-indent: 2.5rem;
        }

        #wrap .logGet .lgD {
            width: 86%;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        #wrap .logGet .logC {
            width: 86%;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .title {
            font-family: "宋体";
            color: #FFFFFF;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* 使用css3的transform来实现 */
            font-size: 36px;
            height: 40px;
            width: 30%;
        }

        .copyright {
            font-family: "宋体";
            color: #FFFFFF;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* 使用css3的transform来实现 */
            height: 60px;
            width: 40%;
            text-align: center;
        }

        #foot .copyright .img {
            width: 100%;
            height: 24px;
            position: relative;
        }

        .copyright .img .icon {
            display: inline-block;
            width: 24px;
            height: 24px;
            margin-left: 22px;
            vertical-align: middle;
            background-image: url(/images/indexIMG.jpg);
            background-repeat: no-repeat;
            vertical-align: middle;
            margin-right: 5px;
        }

        .copyright .img .icon1 {
            display: inline-block;
            width: 24px;
            height: 24px;
            margin-left: 22px;
            vertical-align: middle;
            background-image: url(/images/indexIMG.jpg);
            background-repeat: no-repeat;
            vertical-align: middle;
            margin-right: 5px;
        }

        .copyright .img .icon2 {
            display: inline-block;
            width: 24px;
            height: 24px;
            margin-left: 22px;
            vertical-align: middle;
            background-image: url(/images/indexIMG.jpg);
            background-repeat: no-repeat;
            vertical-align: middle;
            margin-right: 5px;
        }

        #foot .copyright p {
            height: 24px;
            width: 100%;
        }
    </style>

</head>
<body>
<div class="header" id="head">
    <div class="title">健康管理系统</div>
    <div style="float:right;">
        <a class="layui-btn" href="/to/register">注     册</a>
    </div>
</div>
<div class="wrap" id="wrap">
    <div class="logGet">
        <form name="login" class="layui-form bg-blue" action="/user/login" method="post">
            <!-- 头部提示信息 -->
            <div class="logD logDtip">
                <p class="p1">登录</p>
            </div>
            <!-- 输入框 -->
            <div class="lgD">
                <label class="layui-form-label">用户ID
                    <i class="layui-icon">&#xe66f;</i>
                </label>
                <input class="layui-input" type="text" name="userid" required lay-verify="required" placeholder="请输入用户ID" autocomplete="off" lay-verType="msg"/>
            </div>
            <div class="lgD">
                <label class="layui-form-label">密码
                    <i class="layui-icon"> &#xe672;</i>
                </label>
                <input class="layui-input" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" lay-verType="msg"/>
            </div>
            <div class="logC">
                <button class="layui-btn" lay-submit lay-filter="login">登     陆</button>
            </div>

        </form>

    </div>
</div>

<div class="footer" id="foot">
    <div class="copyright">
        <p>Copyright © 2020 yxy Inc. All Rights Reserved.</p>
        <div class="img">
            <span>联系邮箱：18965375150@163.com</span>
        </div>
        <div class="img">
            <span>联系地址：福州大学</span>
        </div>
        <div class="img">
            <span>联系电话：18965375150</span>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/RefResources/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['jquery','form','layer'], function(){
        var $ =layui.jquery;
        var form = layui.form;//表单验证
        var layer= layui.layer;
        layer.msg('欢迎使用');
        form.on('submit(login)', function(data){
        });
    });
</script>
</body>
</html>