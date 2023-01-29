<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>视频会议管理系统</title>
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
    <script  type="text/javascript">
        function userCheck()
        {
            var pwd2=document.form1.new.value;
            var pwd3=document.form1.confirm.value;

            if(pwd1=="" || pwd2==""|| pwd3=="")
            {
                window.alert("请填写密码");
                return false;
            }
            else if(pwd2!=pwd3)
            {
                window.alert("两次得密码不正确,请重新填写");
                return false;
            }
        }

    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            修改密码
        </div>
        <form name="form1" onsubmit="return userCheck()" class="layui-form" action="/frontdemo_war_exploded/changepassword" method="post">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>修改密码信息</legend>
                <table class="layui-table" style="width:50%">
                    <tr>
                        <td>新密码:</td>
                        <td>
                            <input name="new"  type="password" />
                        </td>
                    </tr>
                    <tr>
                        <td>确认新密码：</td>
                        <td>
                            <input name="confirm" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="确认修改" class="layui-btn"/>
                            <input type="button" value="返回" class="layui-btn" onclick="window.history.back();"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>

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
</body>
</html>

