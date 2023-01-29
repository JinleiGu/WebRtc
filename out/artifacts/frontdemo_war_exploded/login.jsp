<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登陆页面</title>
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
<jsp:include page="logintop.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-main" style="padding-top: 200px; width: 100%">
            <form method="post" action="/frontdemo_war_exploded/login">
                <div class="login-title" style="text-align: center;font-size: 32px">登录信息</div>
                <table class="formtable" style="width: 100%">
                    <tr>
                        <td class="td-first">用户名:</td>
                        <td class="td-second">
                            <input class="layui-input" name="username" type="text" style="width: 230px"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-first">密码:</td>
                        <td class="td-second">
                            <input class="layui-input" name="password" type="password" style="width: 230px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="登录" class="layui-btn"/>
                            <input type="button" value="返回" class="layui-btn" onclick="window.history.back();"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        更多问题，欢迎联系管理员
    </div>
</div>
<script src="js/layui.all.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script>
    if(${error!=null}){
        alert("${error}");
    }
</script>
</body>
</html>

