<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>视频会议管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
            个人中心 > <a href="notifications">最新通知</a>
            </div>
            <table class="layui-table">
                <caption style="text-align: left; font-weight:bold">
                未来七天需要参加的会议:
                </caption>
                <tr class="listheader">
                    <th style="width:300px">会议名称</th>
                    <th>会议室</th>
                    <th>起始时间</th>
                    <th>结束时间</th>
                    <th style="width:100px">操作</th>
                    </tr>
                <c:forEach items="${mt7}" var="mt">
                <tr>
                    <td>${mt.meetingname}</td>
                    <td>${mt.roomname}</td>
                    <td><fmt:formatDate value="${mt.starttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td><fmt:formatDate value="${mt.endtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td>
                        <a class="layui-btn" href="/frontdemo_war_exploded/meetingdetail?mid=${mt.meetingid}">查看详情</a>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <table class="layui-table">
                <caption style="text-align: left; font-weight:bold">
                    已取消的会议:
                </caption>
                <tr class="listheader">
                    <th style="width:300px">会议名称</th>
                    <th>会议室</th>
                    <th>起始时间</th>
                    <th>结束时间</th>
                    <th>取消原因</th>
                    <th style="width:100px">操作</th>
                </tr>
                <c:forEach items="${cm}" var="m">
                <tr>
                    <td>${m.meetingname}</td>
                    <td>${m.roomname}</td>
                    <td><fmt:formatDate value="${m.starttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td><fmt:formatDate value="${m.endtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td>${m.canceledreason}</td>
                    <td>
                        <a class="layui-btn" href="/frontdemo_war_exploded/meetingdetail?mid=${m.meetingid}">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
            </table>
        </div>
    </div>
</div>
<div class="layui-footer">
    <!-- 底部固定区域 -->
    更多问题，欢迎联系管理员
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
