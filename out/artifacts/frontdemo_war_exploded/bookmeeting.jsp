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
        #divfrom {
            float: left;
            width: 150px;
        }

        #divto {
            float: left;
            width: 150px;
        }

        #divoperator {
            float: left;
            width: 50px;
            padding: 60px 5px;
        }

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

            //这里的方法是用来给部门下拉框设置值用的
            for (var i = 0; i < data.length; i++) {
             var dep = document.createElement("option");
             dep.value = data[i].departmentid;
             dep.text = data[i].departmentname;
             selDepartments.appendChild(dep);
             }
            $.post("/frontdemo_war_exploded/getalldepjson", function (msg) {
                for (var i = 0; i < msg.length; i++) {
                    var item = msg[i];
                    var dep = document.createElement("option");
                    dep.value = item.departmentid;
                    dep.text = item.departmentname;
                    selDepartments.appendChild(dep);
                }
                fillEmployees();
            });
        }

        function fillEmployees() {
            //清空左边多选下拉框中的所有元素
            clearList(selEmployees);
            //获取当前选中部门的id
            var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
            //根据id去data数组中遍历找到对应的部门中的员工
            for (var i = 0; i < data.length; i++) {
                if (departmentid == data[i].departmentid) {
                        employees = data[i].employees;
                        break;
                }
            }
            $.post("/frontdemo_war_exploded/getempbydepid", {depid: departmentid}, function (msg) {
                for (var i = 0; i < msg.length; i++) {
                    var item = msg[i];
                    var emp = document.createElement("option");
                    emp.value = item.employeeid;
                    emp.text = item.employeename;
                    selEmployees.appendChild(emp);
                }
            });
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
            opt.selected = true;

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
            会议预定 > 预定会议
        </div>
        <form class="layui-form" action="/frontdemo_war_exploded/dobookmeeting" method="post">
            <fieldset>
                <legend>会议信息</legend>
                <table class="layui-table">
                    <tr>
                        <td>会议名称：</td>
                        <td>
                            <input class="layui-input" type="text" id="meetingname" name="meetingname" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>预计参加人数：</td>
                        <td>
                            <input class="layui-input" type="text" id="numofattendents" name="numberofparticipants"/>
                        </td>
                    </tr>
                    <tr>
                        <td>预计开始时间：</td>
                        <td>
                            <input class="Wdate" type="text" id="starttime" name="starttime"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                        </td>
                    </tr>
                    <tr>
                        <td>预计结束时间：</td>
                        <td>
                            <input class="Wdate" type="text" id="endtime" name="endtime"
                                   onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                        </td>
                    </tr>
                    <tr>
                        <td>会议室名称：</td>
                        <td>
                            <select name="roomid">
                                <c:forEach items="${mrs}" var="mr">
                                    <option value="${mr.roomid}">${mr.roomname}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>会议说明：</td>
                        <td>
                            <textarea class="layui-textarea" id="description" rows="5" name="description"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>选择参会人员：</td>
                        <td>
                            <div id="divfrom">
                                <select lay-ignore class="layui-select" id="selDepartments" onchange="fillEmployees()">
                                </select>
                                <select lay-ignore class="layui-select" id="selEmployees" multiple="true">
                                </select>
                            </div>
                            <div id="divoperator">
                                <input type="button" class="layui-btn" value="&gt;" onclick="selectEmployees()"/>
                                <input type="button" class="layui-btn" value="&lt;" onclick="deSelectEmployees()"/>
                            </div>
                            <div id="divto">
                                <select lay-ignore class="layui-select" id="selSelectedEmployees" name="selSelectedEmployees" multiple="true">
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="command" colspan="2">
                            <input type="submit" class="layui-btn" value="预定会议"/>
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
</script>
</body>
</html>

