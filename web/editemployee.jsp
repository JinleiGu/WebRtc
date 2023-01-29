<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>视频会议管理系统</title>
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #divoperator input[type="button"] {
            margin: 10px 0;
        }

        #selDepartments {
            display: block;
            width: 100%;
        }

        #selEmployees {
            display: block;
            width: 100%;
            height: 200px;
        }

        #selSelectedEmployees {
            display: block;
            width: 100%;
            height: 225px;
        }
    </style>
    <script type="application/javascript">
        function employee(employeeid, employeename) {
            this.employeeid = employeeid;
            this.employeename = employeename;
        }
        function department(departmentid, departmentname, employees) {
            this.departmentid = departmentid;
            this.departmentname = departmentname;
            this.employees = employees;
        }
        var selDepartments;
        function body_load() {
            selDepartments = document.getElementById("selDepartments");
            selEmployees = document.getElementById("selEmployees");
            $.post("/frontdemo_war_exploded/getalldepjson", function (msg) {
                for (var i = 0; i < msg.length; i++) {
                    var item = msg[i];
                    var dep = document.createElement("option");
                    dep.value = item.departmentid;
                    dep.text = item.departmentname;
                    selDepartments.appendChild(dep);
                }
            });
        }
    </script>
</head>
<body class="layui-layout-body" onload="body_load()">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="top.jsp"/>
    <jsp:include page="leftmenu.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="content-nav">
            员工管理 > 编辑员工信息
        </div>
        <form class="layui-form" action="/frontdemo_war_exploded/doeditemployee" method="post">
            <fieldset>
                <legend>员工信息</legend>
                <table class="layui-table">
                    <tr>
                        <input class="layui-inline" type="hidden" name="empid" value="${emp.employeeid}"/>
                        <td>员工姓名：</td>
                        <td>
                            <input value="${emp.employeename}" class="layui-input" type="text" id="employeename" name="employeename" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户名：</td>
                        <td>
                            <input value="${emp.username}" class="layui-input" type="text" id="username" name="username"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input value="${emp.password}" class="layui-input" type="text" id="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>电话：</td>
                        <td>
                            <input value="${emp.phone}"  class="layui-input" type="text" id="phone" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <td>邮箱：</td>
                        <td>
                            <input value="${emp.email}"  class="layui-input" type="text" id="email" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>部门：</td>
                        <td>
                            <select lay-ignore class="layui-select" id="selDepartments" name="Departmentid">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="command" colspan="2">
                            <input type="submit" class="layui-btn" value="修改"/>
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
    document.getElementById("t1").value="${m.description}"
</script>
</body>
</html>

