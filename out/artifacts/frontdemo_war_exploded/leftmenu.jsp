<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">个人中心</a>
                <dl class="layui-nav-child">
                    <dd><a href="/frontdemo_war_exploded/notifications">最新通知</a></dd>
                    <dd><a href="/frontdemo_war_exploded/mybooking">我的预定</a></dd>
                    <dd><a href="/frontdemo_war_exploded/mymeeting">我的会议</a></dd>
                </dl>
            </li>
            <c:if test="${loginUser.role==1}">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">员工管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="departments">部门管理</a></dd>
                    <dd><a href="register">员工注册</a></dd>
                    <dd><a href="approveaccount">员工审批</a></dd>
                    <dd><a href="searchemp">员工搜索</a></dd>
                </dl>
            </li>
            </c:if>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">会议预定</a>
                <dl class="layui-nav-child">
                    <c:if test="${loginUser.role==1}">
                        <dd><a href="addmeetingroom.jsp">添加会议室</a></dd>
                    </c:if>
                    <dd><a href="getallmr">查看会议室</a></dd>
                    <dd><a href="/frontdemo_war_exploded/bookmeeting">预定会议</a></dd>
                    <c:if test="${loginUser.role==1}">
                        <dd><a href="/frontdemo_war_exploded/searchmeeting">搜索会议</a></dd>
                    </c:if>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">发起会议</a>
                <dl class="layui-nav-child">
                    <dd><a href="#">开始视频会议</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
