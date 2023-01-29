<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="page-content">
            <div class="content-nav">
                个人中心 > 我的会议
            </div>
            <table class="layui-table">
                <caption style="font-weight: bold">我将参加的会议：</caption>
                <tr>
                    <th>会议名称</th>
                    <th>会议室名称</th>
                    <th>会议开始时间</th>
                    <th>会议结束时间</th>
                    <th>会议预定时间</th>
                    <th>预定者</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${mrs}" var="mr">
                    <tr>
                        <td>${mr.meetingname}</td>
                        <td>${mr.roomname}</td>
                        <td><fmt:formatDate value="${mr.starttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                        <td><fmt:formatDate value="${mr.endtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                        <td><fmt:formatDate value="${mr.reservationtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                        <td>${mr.empname}</td>
                        <td>
                            <a class="layui-btn" href="/frontdemo_war_exploded/meetingdetail?mid=${mr.meetingid}">查看详情</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
</body>
</html>

