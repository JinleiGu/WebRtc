<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>视频会议管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="styles/layui.css">
    <link rel="stylesheet" href="styles/main.css">
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
        var data = new Array();

        var selDepartments;
        var selEmployees;
        var selSelectedEmployees;

        function body_load() {
            selDepartments = document.getElementById("selDepartments");
            selEmployees = document.getElementById("selEmployees");
            selSelectedEmployees = document.getElementById("selSelectedEmployees");

            for (var i = 0; i < data.length; i++) {
                var dep = document.createElement("option");
                dep.value = data[i].departmentid;
                dep.text = data[i].departmentname;
                selDepartments.appendChild(dep);
            }

            fillEmployees();
        }

        function fillEmployees() {
            clearList(selEmployees);
            var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
            var employees;
            for (var i = 0; i < data.length; i++) {
                if (departmentid == data[i].departmentid) {
                    employees = data[i].employees;
                    break;
                }
            }
            for (i = 0; i < employees.length; i++) {
                var emp = document.createElement("option");
                emp.value = employees[i].employeeid;
                emp.text = employees[i].employeename;
                selEmployees.appendChild(emp);
            }
        }

        function clearList(list) {
            while (list.childElementCount > 0) {
                list.removeChild(list.lastChild);
            }
        }

        function selectEmployees() {
            for (var i = 0; i < selEmployees.options.length; i++) {
                if (selEmployees.options[i].selected) {
                    addEmployee(selEmployees.options[i]);
                    selEmployees.options[i].selected = false;
                }
            }
        }

        function deSelectEmployees() {
            var elementsToRemoved = new Array();
            var options = selSelectedEmployees.options;
            for (var i = 0; i < options.length; i++) {
                if (options[i].selected) {
                    elementsToRemoved.push(options[i]);
                }
            }
            for (i = 0; i < elementsToRemoved.length; i++) {
                selSelectedEmployees.removeChild(elementsToRemoved[i]);
            }
        }

        function addEmployee(optEmployee) {
            var options = selSelectedEmployees.options;
            var i = 0;
            var insertIndex = -1;
            while (i < options.length) {
                if (optEmployee.value == options[i].value) {
                    return;
                } else if (optEmployee.value < options[i].value) {
                    insertIndex = i;
                    break;
                }
                i++;
            }
            var opt = document.createElement("option");
            opt.value = optEmployee.value;
            opt.text = optEmployee.text;

            if (insertIndex == -1) {
                selSelectedEmployees.appendChild(opt);
            } else {
                selSelectedEmployees.insertBefore(opt, options[insertIndex]);
            }
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
            会议预定 > 修改会议预定
        </div>
        <form>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>会议信息</legend>
                <table class="layui-table">
                    <tr>
                        <td>会议名称：</td>
                        <td>${mt.meetingname}</td>
                    </tr>
                    <tr>
                        <td>预计参加人数：</td>
                        <td>${mt.numberofparticipants}</td>
                    </tr>
                    <tr>
                        <td>预计开始时间：</td>
                        <td>${mt.starttime}</td>
                    </tr>
                    <tr>
                        <td>预计结束时间：</td>
                        <td>${mt.endtime}</td>
                    </tr>
                    <tr>
                        <td>会议说明：</td>
                        <td>
                            <textarea class="layui-textarea" id="description" rows="5" readonly>${mt.description}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>参会人员：</td>
                        <td>
                            <table class="layui-table">
                                <tr>
                                    <th>姓名</th>
                                    <th>联系电话</th>
                                    <td>电子邮件</td>
                                </tr>
                                <c:forEach items="${emps}" var="emp">
                                    <tr>
                                        <td>${emp.employeename}</td>
                                        <td>${emp.phone}</td>
                                        <td>${emp.email}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td class="command" colspan="2">
                            <c:if test="${mt.reservationistid==loginUser.employeeid}">
                            <input type="button" class="layui-btn" value="取消会议"
                                       onclick="window.location.href='/frontdemo_war_exploded/cancelmeeting?mid=${mt.meetingid}';"/>
                            <input type="button" class="layui-btn" value="编辑会议"
                                       onclick="window.location.href='/frontdemo_war_exploded/editmeeting?mid=${mt.meetingid}';"/>
                            <input type="button" class="layui-btn" value="删除会议记录"
                                       onclick="window.location.href='/frontdemo_war_exploded/deletemeeting?mid=${mt.meetingid}'"/>
                            </c:if>
                            <input type="button" class="layui-btn" value="返回" onclick="window.history.back();"/>
                        </td>
                    </tr>
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
