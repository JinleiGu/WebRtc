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
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            会议预定 > 查看会议室
        </div>
        <table class="layui-table">
            <caption>所有会议室:</caption>
            <tr>
                <th>门牌编号</th>
                <th>会议室名称</th>
                <th>容纳人数</th>
                <th>当前状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="mr">
                <tr>
                    <td>${mr.roomnum}</td>
                    <td>${mr.roomname}</td>
                    <td>${mr.capacity}</td>
                    <td>
                        <c:choose>
                            <c:when test="${mr.status==0}">启用</c:when>
                            <c:when test="${mr.status==1}">停用</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <a class="layui-btn" href="/frontdemo_war_exploded/roomdetails?roomid=${mr.roomid}">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
        </table>


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

