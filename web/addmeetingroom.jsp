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
            会议预定 > 添加会议室
        </div>
        <form class="layui-form" action="/frontdemo_war_exploded/addmr" method="post">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>会议室信息</legend>
                <table class="layui-table">
                    <tr>
                        <td>门牌号:</td>
                        <td>
                            <input id="roomnumber" name="roomnum" type="text" placeholder="例如：201" maxlength="10"/>
                        </td>
                    </tr>
                    <tr>
                        <td>会议室名称:</td>
                        <td>
                            <input id="capacity" name="roomname" type="text" placeholder="例如：第一会议室" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>最多容纳人数：</td>
                        <td>
                            <input id="roomcapacity" name="capacity" type="text" placeholder="填写一个正整数"/>
                        </td>
                    </tr>
                    <tr>
                        <td>当前状态：</td>
                        <td>
                            <input lay-ignore type="radio" id="status" name="status" checked="checked" value="0"/>启用
                            <input lay-ignore type="radio" id="status" name="status" value="1"/>停用
                        </td>
                    </tr>
                    <tr>
                        <td>备注：</td>
                        <td>
                            <textarea class="layui-textarea" id="description" name="description" maxlength="200" rows="5" cols="60"
                                      placeholder="200字以内的文字描述"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="添加" class="layui-btn"/>
                            <input type="reset" value="重置" class="layui-btn"/>
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

