<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/23
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty requestScope.parents}">
    <jsp:forward page="/anthorty_showParent?target=anthorty_add"></jsp:forward>
</c:if>

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

<form action="/anthorty_add" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">权限编号</label>
                <div class="col-xs-9">
                    <input type="text" name="" readonly class="form-control input-sm" placeholder="输入信息生成编号"/>
                </div>
            </div>

        </div>
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">权限名称</label>
                <div class="col-xs-9">
                    <input type="text" name="anthortyName" class="form-control input-sm" placeholder="请输入权限名称"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">上级权限</label>
                <div class="col-xs-9">
                    <select id="parent" name="anthortyPid" class="form-control input-sm">
                        <c:forEach items="${requestScope.parents}" var="parent">
                            <option value="${parent.anthortyId}">${parent.anthortyName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

        </div>
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">权限URL</label>
                <div class="col-xs-9">
                    <input type="text" name="anthortyUrl" class="form-control input-sm" placeholder="请输入权限URL"/>
                </div>
            </div>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">备注信息</h5>
    <div class="row">
        <div class="col-xs-10">
            <div class="form-group">
                <label class="col-xs-3 control-label">备注</label>
                <div class="col-xs-9">
                    <textarea class="form-control" name="anthortyDesc"></textarea>
                </div>
            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-xs-3 col-xs-offset-3">
            <input type="submit" class="btn btn-success" value="保存权限信息"/>
        </div>
    </div>

</form>

</body>
</html>

