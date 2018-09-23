<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/22
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../../../js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            if ($("#mess").val() != 0) {
                alert($("#mess").val())
            }

           /* $("#find").click(function () {
                $.getJSON("/staff_find", "condition=" + $("#condition").val() + "&staffInfo=" + $("#conditionIpt").val(), function (result) {
                    if (result != null) {
                        $("#info").html("");
                        $("#info").append(
                            "<tr>" +
                            "<th>员工编号</th>" +
                            "<th>员工姓名</th>" +
                            "<th>员工性别</th>" +
                            "<th>员工年龄</th>" +
                            "<th>电话号码</th>" +
                            "<th>QQ</th>" +
                            "<th>入职时间</th>" +
                            "<th>操作</th>" +
                            "</tr>");
                        for (var i = 0; i < result.length; i++) {
                            alert(result[i].staffName + "  " + result[i].staffAge + "  " + result[i].staffSex);
                            $("#info").append(
                                "<tr>" +
                                "<td>" + result[i].staffId + " </td>" +
                                "<td>" + result[i].staffName + " </td>" +
                                "<td>" + result[i].staffSex + " </td>" +
                                "<td>" + result[i].staffAge + " </td>" +
                                "<td>" + result[i].staffOfficePhone + " </td>" +
                                "<td>" + result[i].staffQQ + " </td>" +
                                "<td>" + result[i].staffEntryTime + "</td>" +
                                "<td>" +
                                "<a href=\"/staff_role_show?staffId=" + result[i].staffId + "\">角色变更</a>" +
                                "</td>" +
                                "</tr>");
                        }

                    }
                })
            })*/


        })
    </script>

</head>

<body>
<input type="hidden" value="${requestScope.mess}" id="mess">
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>员工管理</li>
    </ul>
</div>
<div class="row alert alert-info" style="margin:0px; padding:3px;">
    <form class="form-horizontal">
        <div class="col-sm-1">条件:</div>
        <div class="col-sm-3">
            <select id="condition" class="form-control  input-sm">
                <option>姓名</option>
                <option>性别</option>
            </select>
        </div>
        <div class="col-sm-3">
            <input type="text" id="conditionIpt" class="form-control input-sm"/>
        </div>
        <input type="button" id="find" class="btn btn-danger" value="查询"/>
        <input type="button" class="btn btn-success" value="添加"
               onClick="javascript:window.location='view/system/user/user_add.jsp'"/>
    </form>
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
    <table id="info" class="table  table-condensed table-striped">
        <tr>
            <th>员工编号</th>
            <th>员工用户名</th>
            <th>员工真实姓名</th>
            <th>操作</th>
        </tr>

        ${requestScope.noInfo}
        <c:forEach items="${requestScope.userPageBean}" var="user">
            <tr>
                <td>${user.uId}</td>
                <td>${user.uName}</td>
                <td>${user.uTrueName}</td>
                <td>
                    <a href="/user_role_show?userId=${user.uId}">角色变更</a>
                </td>
            </tr>
        </c:forEach>


    </table>
</div>

</body>
</html>
