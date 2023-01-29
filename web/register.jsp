<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>视频会议管理系统</title>
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            员工管理 > 员工注册
        </div>
        <form class="layui-form" method="post" action="/frontdemo_war_exploded/doregister">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>员工信息</legend>
                <table class="layui-table" style="width:50%">
                    <c:if test="${error!=null}">
                        <tr>
                            <td colspan="2">${error}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>姓名：</td>
                        <td>
                            <input type="text" id="employeename" name="employeename" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>账户名：</td>
                        <td>
                            <input type="text" id="accountname" name="accountname" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input type="password" id="password" name="password" maxlength="20"
                                   placeholder="请输入6位以上的密码"/>
                        </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input type="password" id="confirm" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>联系电话：</td>
                        <td>
                            <input type="text" id="phone" name="phone" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>电子邮件：</td>
                        <td>
                            <input type="text" id="email" name="email" maxlength="20"/>
                        </td>
                    </tr>
                    <td>所在部门：</td>
                    <td>
                        <select lay-ignore name="deptid">
                            <c:forEach items="${list}" var="dep">
                                <option value="${dep.departmentid}">${dep.departmentname}</option>
                            </c:forEach>
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="command">
                            <input type="submit" class="layui-btn" value="注册"/>
                            <input type="reset" class="layui-btn" value="重置"/>
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

