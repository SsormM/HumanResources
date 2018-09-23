<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/21
  Time: 21:40
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
        <li>添加角色信息</li>
    </ul>
</div>

<form action="/roleInfo_add" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">角色编号</label>
                <div class="col-sm-9">
                    <input type="text" name="roleId" readonly class="form-control input-sm" placeholder="请输入角色信息生成编号"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">角色名称</label>
                <div class="col-sm-9">
                    <input type="text" name="roleName" class="form-control input-sm" placeholder="请输入角色名称"/>
                </div>
            </div>
        </div>

    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">备注信息</h5>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <label class="col-sm-3 control-label">备注</label>
                <div class="col-sm-9">
                    <textarea class="form-control" name="roleDesc"></textarea>
                </div>
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input type="submit" class="btn btn-success" value="保存"/>
            <input type="reset" class="btn  btn-danger" value="取消"
                   onclick="location.href='/roleInfo_list?target=roleinfo/roleInfo_list'"/>
        </div>
    </div>
</form>

</body>
</html>

