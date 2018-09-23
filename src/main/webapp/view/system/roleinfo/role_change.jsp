<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/22
  Time: 13:45
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
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>角色管理</li>
        <li>角色变更</li>
    </ul>
</div>

<form action="/user_role_update" class="form-horizontal">

    <input type="hidden" value="${requestScope.user.uId}" name="uId">
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.user.uId}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.user.uName}</p>
                </div>
            </div>
        </div>

    </div>
    <!-- 开始2 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">真实姓名</label>
                <div class="col-sm-5">
                    <p class="form-control-static">${requestScope.user.uTrueName}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-4">
                    <p class="form-control-static">****</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束2 -->
    <!-- 开始3 -->
    <div class="row">

        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">角色</label>
                <div class="col-sm-6">
                    <select class="form-control input-sm" name="roleId">
                        <c:forEach items="${requestScope.roleList}" var="role">
                            <option <c:if test="${requestScope.user.role.roleName==role.roleName}">
                                        selected="selected"
                                    </c:if> value="${role.roleId}">
                                    ${role.roleName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束3 -->
    <div class="row">
        <div class="col-sm-5 col-sm-offset-4">
            <input type="submit" class="btn btn-success" value="角色变更"/>
            <a class="btn btn-warning" onclick="location.href='/user_list?target=roleinfo/user_role_list'">返回上一级</a>

        </div>
    </div>
</form>

</body>
</html>

