<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/23
  Time: 22:08
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
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>数据字典</li>
        <li>修改信息</li>
    </ul>
</div>

<form action="/dataDictionary_update" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                    <input type="text" name="dataId" readonly value="${requestScope.data.dataId}"
                           class="form-control input-sm" placeholder="请输入编号"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">名称</label>
                <div class="col-sm-9">
                    <input type="text" name="dataContent" value="${requestScope.data.dataContent}" class="form-control input-sm"
                           placeholder="请输入名称"/>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">类型</label>
                <div class="col-sm-9">
                    <input type="text" name="dataType" value="${requestScope.data.dataType}" class="form-control input-sm" placeholder="请输入类型"/>
                </div>
            </div>

        </div>


    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">描述信息</h5>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <label class="col-sm-3 control-label">描述</label>
                <div class="col-sm-9">
                    <textarea class="form-control" name="dataDesc">${requestScope.data.dataDesc}</textarea>
                </div>
            </div>

        </div>

    </div>

    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input type="submit" class="btn btn-success" value="保存"/>
            <input type="reset" class="btn  btn-danger" value="取消"
                   onclick="location.href='/dataDictionary_list?target=dataDictionary_list'"/>
        </div>
    </div>
</form>

</body>
</html>

