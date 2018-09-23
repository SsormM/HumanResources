<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/23
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<form action="/anthorty_show" class="form-horizontal">
    <div class="row">
        <div class="col-xs-9 ">
            <input type="button" class="btn btn-success" value="添加权限信息"
                   onClick="javascript:window.location='view/system/anthorty/anthorty_add.jsp'"/>
            <a class="btn btn-info"
               href="/anthorty_show?anthortyId=${requestScope.anthorty.anthortyId}&target=anthorty_update">修改权限信息</a>
            <a class="btn btn-danger" href="/anthorty_delete?anthortyId=${requestScope.anthorty.anthortyId}"
               onclick="if(dele()==false)return false;">删除权限信息</a>
        </div>

    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label" name="anthortyId">权限编号</label>
                <div class="col-xs-9">
                    <p class="form-control-static">${requestScope.anthorty.anthortyId}</p>
                </div>
            </div>

        </div>
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">权限名称</label>
                <div class="col-xs-9">
                    <p class="form-control-static">${requestScope.anthorty.anthortyName}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">上级权限</label>
                <div class="col-xs-9">
                    <p class="form-control-static">${requestScope.anthorty.anthortyPName}</p>
                </div>
            </div>

        </div>
        <div class="col-xs-5">
            <div class="form-group">
                <label class="col-xs-3 control-label">权限URL</label>
                <div class="col-xs-9">
                    <p class="form-control-static">${requestScope.anthorty.anthortyUrl}</p>
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
                    <p class="form-control-static">${requestScope.anthorty.anthortyDesc}</p>
                </div>
            </div>

        </div>

    </div>


</form>
<script>
    function dele() {
        if (confirm("你真的确认要修改吗？请确认")) {
            return true;
        }
        else {
            return false;
        }
    }
</script>
</body>
</html>

