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
    <jsp:include page="logintop.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            员工管理 > 部门管理
        </div>
        <form class="layui-form" method="post" action="/frontdemo_war_exploded/adddepartment">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加部门</legend>
                ${error}
                部门编号
                <input type="text" id="departmentid" name="departmentid" maxlength="20"/>
                部门名称:
                <input type="text" id="departmentname" name="departmentname" maxlength="20"/>
                <input type="submit" class="layui-btn-sm" value="添加"/>
            </fieldset>
        </form>
        <table class="layui-table">
            <caption>所有部门:</caption>
            <tr>
                <th>部门编号</th>
                <th>部门名称</th>
                <th>操作</th>
            </tr>
            <c:if test="${error!=null}">
                <tr>
                    <td colspan="3">${error}</td>
                </tr>
            </c:if>
            <c:forEach items="${list}" var="dep">
                <tr>
                    <td>${dep.departmentid}</td>
                    <td id="depname${dep.departmentid}">${dep.departmentname}</td>
                    <td>
                        <a class="layui-btn" href="#" style="display: none" id="cancel${dep.departmentid}"
                           onclick="cancelEdit(${dep.departmentid},'${dep.departmentname}')">取消</a>
                        <a class="layui-btn" href="/frontdemo_war_exploded/deletedepartment?depid=${dep.departmentid}">删除</a>
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
<script>
    function cancelEdit(depid, depName) {
        var cancelBtn = $("#cancel" + depid);
        var editBtn = $("#edit" + depid);
        var ele = $("#depname" + depid);
        cancelBtn.css("display", "none");
        editBtn.html("编辑");
        ele.html(depName);
    }
    function editDep(depid) {
        var cancelBtn = $("#cancel" + depid);
        var editBtn = $("#edit" + depid);
        var ele = $("#depname" + depid);//<td id="13">技术部</td>
        if (cancelBtn.css("display") == 'none') {
            cancelBtn.css("display", "inline")
            editBtn.html("确定");
            var depName = ele.text();
            ele.html("<input type='text' value='" + depName + "'/>");
        } else {
            //提交修改
            var children = ele.children("input");
            var val = children.val();
            $.post("/frontdemo_war_exploded/updateDepartment", {id: depid, depName: val}, function (msg) {
                alert(msg);
                cancelBtn.css("display", "none")
                editBtn.html("编辑");
                ele.html(val);
            });
        }
    }
</script>
</body>
</html>

