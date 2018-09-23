<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/22
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../../../js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap.min.js"></script>
    <script type="text/javascript" >
        $(function () {
            if ($("#mess").val() != 0) {
                alert($("#mess").val())
            }

            $("#find").click(function () {
                $.getJSON("/roleInfo_find", "roleName=" + $("#findIpt").val(), function (result) {
                    if (result != null) {
                        $("#info").html("");
                        $("#info").append(
                            "<tr>" +
                            "<th>角色编号</th>" +
                            "<th>角色名称</th>" +
                            "<th>角色描述</th>" +
                            "<th>操作</th>" +
                            "</tr>");
                        for (var i = 0; i < result.length; i++) {
                            alert(result[i].roleId + "  " + result[i].roleName + "  " + result[i].roleDesc);
                            $("#info").append(
                                "<tr>" +
                                "<td>" + result[i].roleId + "</td>" +
                                "<td>" + result[i].roleName + "</td>" +
                                "<td>" + result[i].roleDesc + "</td>" +
                                "<th>"+ "<a href=\"/roleInfo_show?roleId="+ result[i].roleId+"&target=anthotychange/anthorty_change\">权限变更</a>"+
                                "</th>"+
                                "</tr>")
                        }
                    }

                })


            })

        })
    </script>

</head>

<body>
<input type="hidden" value="${requestScope.mess}" id="mess">
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; " >
        <li><a href="#">系统管理</a></li>
        <li>权限变更</li>
    </ul>
</div>
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >
    <form class="form-horizontal" >
        <div class="col-sm-2">角色名称:</div>
        <div class="col-sm-3">
            <input id="findIpt" type="text"  class="form-control input-sm"/>
        </div>
        <input type="button"  id="find"  class="btn btn-danger"   value="查询"/>

    </form>
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
    <table id="info" class="table  table-condensed table-striped">
        <tr>
            <th>角色编号</th>
            <th>角色名称</th>
            <th>角色描述</th>
            <th>操作</th>
        </tr>
        ${requestScope.noInfo}
        <c:forEach items="${requestScope.roleList}" var="role">
            <tr>
                <td>${role.roleId}</td>
                <td>${role.roleName}</td>
                <td>${role.roleDesc}</td>
                <th><a href="/roleInfo_show?roleId=${role.roleId}&target=anthotychange/anthorty_change">权限变更</a></th>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>

