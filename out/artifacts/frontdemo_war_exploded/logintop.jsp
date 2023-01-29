<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo">视频会议管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            欢迎您 <strong><c:if test="${loginUser!=null}">${loginUser.employeename}</c:if></strong>
        </li>
    </ul>
</div>
