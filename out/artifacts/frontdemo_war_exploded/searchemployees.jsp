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
            员工管理 > 搜索员工
        </div>
        <form action="/frontdemo_war_exploded/searchemp" method="post">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>搜索员工</legend>
                <table class="layui-table">
                    <tr>
                        <td>姓名：</td>
                        <td>
                            <input type="text" id="employeename" name="employeename" value="${employeename}"
                                   maxlength="20"/>
                        </td>
                        <td>账号名：</td>
                        <td>
                            <input type="text" id="accountname" name="username" value="${username}" maxlength="20"/>
                        </td>
                        <td>状态：</td>
                        <td>
                            <c:choose>
                                <c:when test="${status==0}">
                                    <input type="radio" id="status" name="status" value="1"
                                    /><label>已批准</label>
                                    <input checked="checked" type="radio" id="status" name="status" value="0"/><label>待审批</label>
                                    <input type="radio" id="status" name="status" value="-1"/><label>已关闭</label>
                                </c:when>
                                <c:when test="${status==1}">
                                    <input type="radio" checked="checked" id="status" name="status" value="1"
                                    /><label>已批准</label>
                                    <input type="radio" id="status" name="status" value="0"/><label>待审批</label>
                                    <input type="radio" id="status" name="status" value="-1"/><label>已关闭</label>
                                </c:when>
                                <c:when test="${status==-1}">
                                    <input type="radio" id="status" name="status" value="1"
                                    /><label>已批准</label>
                                    <input type="radio" id="status" name="status" value="0"/><label>待审批</label>
                                    <input type="radio" checked="checked" id="status" name="status" value="-1"/><label>已关闭</label>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="command" style="text-align: center">
                            <input type="submit" class="layui-btn" value="查询"/>
                            <input type="reset" class="layui-btn" value="重置"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
        <h3 style="text-align:center;color:black">查询结果</h3>
        <table class="layui-table" >
            <tr>
                <th>姓名</th>
                <th>账号名</th>
                <th>联系电话</th>
                <th>电子邮件</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${list}" var="emp">
                <tr>
                    <td>${emp.employeename}</td>
                    <td>${emp.username}</td>
                    <td>${emp.phone}</td>
                    <td>${emp.email}</td>
                    <td>
                        <form method="post" action="/frontdemo_war_exploded/serachemp">
                            <input type="hidden" name="employeename" value="${employeename}">
                            <input type="hidden" name="username" value="${username}">
                            <input type="hidden" name="status" value="${status}">
                            <input type="hidden" name="updateStatus" value="-1">
                            <input type="hidden" name="empid" value="${emp.employeeid}">
                            <a class="layui-btn layui-btn-primary layui-btn-xs" href="/frontdemo_war_exploded/editemployee?empid=${emp.employeeid}">编辑</a>
                            <input class="layui-btn layui-btn-primary layui-btn-xs" value="关闭账号" type="submit">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>


        <div class="pager-header">
            <div class="header-info">
                共<span class="info-number">${totalCount}</span>条结果，
                分成<span class="info-number">${totalPage}</span>页显示，
                当前第<span class="info-number">${page}</span>页
            </div>
            <div class="header-nav">
                <a type="button" class="clickbutton"
                   href="/frontdemo_war_exploded/serachemp?page=1&status=${status}&employeename=${employeename}&username=${username}">首页</a>
                <c:choose>
                    <c:when test="${page>1}">
                        <a type="button" class="clickbutton"
                           href="/frontdemo_war_exploded/serachemp?page=${page-1}&status=${status}&employeename=${employeename}&username=${username}">上页</a>
                    </c:when>
                    <c:otherwise>
                        上页
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${page<totalPage}">
                        <a type="button" class="clickbutton"
                           href="/frontdemo_war_exploded/serachemp?page=${page+1}&status=${status}&employeename=${employeename}&username=${username}">下页</a>
                    </c:when>
                    <c:otherwise>
                        下页
                    </c:otherwise>
                </c:choose>
                <a type="button" class="clickbutton"
                   href="/frontdemo_war_exploded/serachemp?page=${totalPage}&status=${status}&employeename=${employeename}&username=${username}">末页</a>
                <form action="/meeting/serachemp" method="post" style="display: inline">
                    <input type="hidden" name="employeename" value="${employeename}">
                    <input type="hidden" name="username" value="${username}">
                    <input type="hidden" name="status" value="${status}">
                    跳到第<input type="text" id="pagenum" name="page" class="nav-number"/>页
                    <input type="submit" class="clickbutton" value="跳转"/>
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
</body>
</html>

