<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>视频会议管理系统</title>
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
    <script src="./My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            会议预定 > 搜索会议
        </div>
        <form action="/frontdemo_war_exploded/searchmeeting" method="post">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>搜索栏</legend>
                <table class="layui-table">
                    <tr>
                        <td>会议名称：</td>
                        <td>
                            <input  class="layui-inline" type="text" id="meetingname" name="meetingname" value="${meetingname}" maxlength="20"/>
                        </td>
                        <td>会议室名称：</td>
                        <td>
                            <input  class="layui-inline" type="text" id="roomname" value="${roomname}" name="roomname" maxlength="20"/>
                        </td>
                        <td>预定者姓名：</td>
                        <td>
                            <input  class="layui-inline" type="text" id="reservername" value="${reservername}" name="reservername" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>预定日期：</td>
                        <td colspan="5">
                            从&nbsp;
                            <input  class="layui-inline" type="text" id="starttime" name="reservefromdate"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                            到&nbsp;
                            <input  class="layui-inline" type="text" id="endtime" name="reservetodate"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                        </td>
                    </tr>
                    <tr>
                        <td>会议日期：</td>
                        <td colspan="5">
                            从&nbsp;
                            <input class="layui-inline" type="text" name="meetingfromdate"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                            到&nbsp;
                            <input class="layui-inline" type="text" name="meetingtodate"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="command">
                            <input type="submit" class="layui-btn" value="查询"/>
                            <input type="reset" class="layui-btn" value="重置"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
        <div>
            <h3 style="text-align:center;color:black">查询结果</h3>

        </div>
        <table class="layui-table">
            <tr>
                <th>会议名称</th>
                <th>会议室名称</th>
                <th>会议开始时间</th>
                <th>会议结束时间</th>
                <th>会议预定时间</th>
                <th>预定者</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="m">
                <tr>
                    <td>${m.meetingname}</td>
                    <td>${m.roomname}</td>
                    <td><fmt:formatDate value="${m.starttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td><fmt:formatDate value="${m.endtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td><fmt:formatDate value="${m.reservationtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <td>${m.empname}</td>
                    <td>
                        <a class="layui-btn layui-btn-primary layui-btn-xs" href="/frontdemo_war_exploded/meetingdetail?mid=${m.meetingid}">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="pager-header" style="font-size: 15px">
            <div class="header-info">
                共<span class="info-number">${totalCount}</span>条结果，
                分成<span class="info-number">${totalPage}</span>页显示，
                当前第<span class="info-number">${page}</span>页
            </div>
            <div class="header-nav">
                <a type="button" class="layui-btn layui-btn-sm"
                   href="/frontdemo_war_exploded/searchmeeting?page=1&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">首页</a>
                <c:choose>
                    <c:when test="${page>1}">
                        <a type="button" class="layui-btn layui-btn-sm"
                           href="/frontdemo_war_exploded/searchmeeting?page=${page-1}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">上页</a>
                    </c:when>
                    <c:otherwise>上页</c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${page<totalPage}">
                        <a type="button" class="layui-btn layui-btn-sm"
                           href="/frontdemo_war_exploded/searchmeeting?page=${page+1}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">下页</a>
                    </c:when>
                    <c:otherwise>下页</c:otherwise>
                </c:choose>
                <a type="button" class="layui-btn layui-btn-sm"
                   href="/frontdemo_war_exploded/searchmeeting?page=${totalPage}&meetingname=${meetingname}&roomname=${roomname}&reservername=${reservername}&reservefromdate=${reservefromdate}&reservetodate=${reservetodate}&meetingfromdate=${meetingfromdate}&meetingtodate=${meetingtodate}">末页</a>
                <form action="/frontdemo_war_exploded/searchmeeting" style="display: inline" method="post">
                    <input type="hidden" value="${meetingname}" name="meetingname" maxlength="20"/>
                    <input type="hidden" value="${roomname}" name="roomname" maxlength="20"/>
                    <input type="hidden" value="${reservername}" name="reservername" maxlength="20"/>
                    <input type="hidden" value="${reservefromdate}" name="reservefromdate" maxlength="20"/>
                    <input type="hidden" value="${reservetodate}" name="reservetodate" maxlength="20"/>
                    <input type="hidden" value="${meetingfromdate}" name="meetingfromdate" maxlength="20"/>
                    <input type="hidden" value="${meetingtodate}" name="meetingtodate" maxlength="20"/>
                    跳到第<input type="text" id="pagenum" name="page" class="layui-inline"/>页
                    <input type="submit" class="layui-btn layui-btn-sm" value="跳转"/>
                </form>
            </div>
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


