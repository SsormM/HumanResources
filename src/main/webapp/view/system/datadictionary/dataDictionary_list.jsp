<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/22
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmy" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript">
        $(function () {
            if ($("#mess").val() != 0) {
                alert($("#mess").val())
            }

            $("#find").click(function () {
                $.getJSON("/dataDictionary_find", "dataType=" + $("#findIpt").val(), function (result) {
                    if (result != null) {
                        $("#info").html("");
                        $("#info").append(
                            "<tr>" +
                            "<th>编号</th>" +
                            "<th>名称</th>" +
                            "<th>类型</th>" +
                            "<th>描述</th>" +
                            "<th>操作</th>" +
                            "</tr>");
                        for (var i = 0; i < result.length; i++) {
                            alert(result[i].dataId + "  " + result[i].dataContent + "  " + result[i].dataType);
                            $("#info").append(
                                "<tr>" +
                                "<td>" + result[i].dataId + "</td>" +
                                "<td>" + result[i].dataContent + "</td>" +
                                "<td>" + result[i].dataType + "</td>" +
                                "<td>" + result[i].dataDesc + "</td>" +
                                "<th>"+ "<a href=‘datadictionary_update.html?dataId="+result[i].dataId+"'>修改</a> "+
                                "<a href='#?dataId="+result[i].dataId+"' onclick='if(dele()==false)return false;'>删除</a>"+
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
        <li>数据字典</li>
    </ul>
</div>
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >
    <form class="form-horizontal">
        <div class="col-sm-2">类型:</div>
        <div class="col-sm-3">
            <input type="text" id="findIpt" class="form-control input-sm"/>
        </div>
        <input type="button" id="find"  class="btn btn-danger"     value="查询"/>
        <a  class="btn btn-success"  href="view/system/datadictionary/dataDictionary_add.jsp">添加</a>
    </form>
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
    <table id="info" class="table  table-condensed table-striped">
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>类型</th>
            <th>描述</th>
            <th>操作</th>
        </tr>

        ${requestScope.noInfo}
        <c:forEach items="${requestScope.dataList}" var="data">
            <tr>
                <td>${data.dataId}</td>
                <td>${data.dataContent}</td>
                <td>${data.dataType}</td>
                <td>${data.dataDesc}</td>
                <th><a href="/dataDictionary_show?dataId=${data.dataId}&target=dataDictionary_update">修改</a>
                    <a href="/dataDictionary_delete?dataId=${data.dataId}" onclick="if(dele()==false)return false;">删除</a>
                </th>
            </tr>
        </c:forEach>
    </table>
</div>


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

