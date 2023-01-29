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
            会议预定 > 修改会议室信息
        </div>
        <form class="layui-form" action="/frontdemo_war_exploded/addmr" method="post">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>会议室信息</legend>
                <table class="layui-table">
                    <tr>
                        <td>门牌号:</td>
                        <td>
                            <input name="roomid" value="${mr.roomid}" type="hidden">
                            <input id="roomnumber" name="roomnum" type="text" value="${mr.roomnum}" maxlength="10"/>
                        </td>
                    </tr>
                    <tr>
                        <td>会议室名称:</td>
                        <td>
                            <input id="capacity" type="text" name="roomname" value="${mr.roomname}" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>最多容纳人数：</td>
                        <td>
                            <input id="roomcapacity" type="text" name="capacity" value="${mr.capacity}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>当前状态：</td>
                        <td>
                            <c:choose>
                                <c:when test="${mr.status==0}">
                                    <input type="radio" id="status" name="status" checked="checked" value="0"/><label for="status">启用</label>
                                    <input type="radio" id="status" name="status" value="1"/><label for="status"
                                                                                                    value="0">停用</label>
                                </c:when>
                                <c:otherwise>
                                    <input type="radio" id="status" name="status" value="0"/><label for="status">启用</label>
                                    <input type="radio" id="status" name="status" checked="checked" value="1"/><label for="status"
                                                                                                                      value="0">停用</label>
                                </c:otherwise>
                            </c:choose>

                        </td>
                    </tr>
                    <tr>
                        <td>备注：</td>
                        <td>
                            <textarea  class="layui-textarea" id="description" maxlength="200" rows="5" name="description" cols="60">${mr.description}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="command">
                            <input type="submit" value="确认修改" class="layui-btn"/>
                            <input type="button" class="layui-btn" value="返回" onclick="window.history.back();"/>
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


