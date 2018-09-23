<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/24
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:if test="${empty requestScope.anthorties}">
    <jsp:forward page="/anthorty_change_showList"></jsp:forward>
</c:if>--%>
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
            $(".parent").click(function () {
                var id = $(this).attr("id");
                $("input[class='"+id+"']").prop("checked",$(this).prop("checked"));
            })
        })
    </script>
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>权限变更</li>
    </ul>
    <form action="/anthorty_change" class="form-horizontal">

        <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
        <div class="row">
            <div class="col-sm-5">
                <div class="form-group">
                    <label class="col-sm-3 control-label">角色编号</label>
                    <div class="col-sm-9">
                        <p class="form-control-static">${requestScope.role.roleId}</p>
                        <input type="hidden" value="${requestScope.role.roleId}" name="roleId">
                    </div>
                </div>

            </div>
            <div class="col-sm-5">
                <div class="form-group">
                    <label class="col-sm-3 control-label">角色名称</label>
                    <div class="col-sm-9">
                        <p class="form-control-static">${requestScope.role.roleName}</p>
                    </div>
                </div>
            </div>

        </div>
        <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">菜单信息</h5>
        <table class="table">
            <tr>
                <th>一级菜单</th>
                <th>二三...级菜单</th>
            </tr>
            <c:forEach items="${requestScope.anthortyMap}" var="map" varStatus="status">
                <tr>
                    <td >
                        <label class="checkbox-inline">
                            <input id="${map.key.anthortyId}" class="parent " type="checkbox" name="anthortyId"
                                    <c:forEach items="${requestScope.roleAnthorties}" var="roleAnthorty">
                                        <c:if test="${roleAnthorty.anthortyId==map.key.anthortyId}">checked</c:if>
                                    </c:forEach>
                                   value="${map.key.anthortyId}"/>
                                ${map.key.anthortyName}
                        </label>

                    </td>
                    <td >
                        <c:forEach items="${map.value}" var="childAntohrty">
                            <label class="checkbox-inline">
                                <input  class="${map.key.anthortyId}" type="checkbox" name="anthortyId"
                                        <c:forEach items="${requestScope.roleAnthorties}" var="roleAnthorty">
                                            <c:if test="${roleAnthorty.anthortyId==childAntohrty.anthortyId}">checked</c:if>
                                        </c:forEach>
                                       value="${childAntohrty.anthortyId}"/>
                                    ${childAntohrty.anthortyName}
                            </label>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="row">
            <div class="col-sm-5 col-sm-offset-4">
                <input type="submit" class="btn btn-success" value="权限变更"/>
                <a href="roleInfo_list?target=anthotychange/anthorty_changeList" class="btn btn-warning">返回上一级</a>

            </div>
        </div>

    </form>
</div>
</body>
</html>

