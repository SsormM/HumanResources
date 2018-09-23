<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/9/5
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty requestScope.salaryGrant}">
    <jsp:forward page="/createSalaryGrant"></jsp:forward>
</c:if>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>薪酬发放登记</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="/jquery/bootstrap-paginator.min.js"></script>
    <script type="text/javascript">
        var humanTotal = 0;
        var salaryTotal = 0;
        $(function () {
            $("th[name=human]").each(function () {
                var human = $(this).text();
                humanTotal += parseInt(human);
                $("#human_amount").text(humanTotal + ", ");
                $("input[name=humanAmount]").val(humanTotal);
            })

            $("th[name=salary]").each(function () {
                var salary = $(this).text();
               /* alert($(this).text());*/
                salaryTotal += parseFloat(salary);
                $("#salary_standard_sum").text(salaryTotal + ", ");
                $("input[name=salaryStandardSum]").val(salaryTotal);
            })

        })
    </script>

</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">薪酬发放管理</a></li>
        <li>薪酬发放登记</li>
    </ul>
</div>

<div class="row alert alert-info" style="margin:0px; padding:3px;">
    <form class="form-horizontal">
        <div class="col-sm-1">条件:</div>
        <div class="col-sm-3">
            <select class="form-control  input-sm">
                <option>姓名</option>
                <option>性别</option>
            </select>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control input-sm"/>
        </div>
        <input type="button" class="btn btn-danger" value="查询"/>
        <input type="button" class="btn btn-success" value="添加"
               onClick="javascript:window.location=''"/>
    </form>
</div>

<form action="" method="post">
    <div class="row" style="padding:15px; padding-top:0px; ">
        <span>薪酬单编号:${sessionScope.salaryGrant.salaryGrantId}</span>
        <input type="hidden" name="salaryGrantId" value="${sessionScope.salaryGrant.salaryGrantId}">
    </div>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <div style="float: left"><span>薪酬次数:</span><span id="count">${sessionScope.salaryCount},</span></div>
        <div style="float: left"><span>总人数:</span><span id="human_amount"></span></div>
        <div style="float: left"><span>基本薪酬总额:</span><span id="salary_standard_sum"></span></div>
        <div style="float: left"><span>实发总额:</span><span id="salary_paid_sum">${requestScope.salaryPaidSum}</span></div>
    </div>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <table class="table table-condensed table-striped">
            <tr>
                <th>序号</th>
                <th>一级机构名称</th>
                <th>二级机构名称</th>
                <th>人数</th>
                <th>基本薪酬总额</th>
                <th>登记</th>
            </tr>

            <c:forEach items="${sessionScope.salaryGrant.humanFiles}" var="humanFile" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <th>${humanFile.firstKindName}</th>
                    <th>${humanFile.secondKindName}</th>
                    <th name="human"><c:if test="${empty humanFile.hufId}">0</c:if>${humanFile.hufId}</th>
                    <th name="salary"><c:if test="${empty humanFile.salarySum}">0.0</c:if>${humanFile.salarySum}</th>
                    <th>
                        <a href="/showSalaryGrantDetails?firstKindName=${humanFile.firstKindName}&secondKindName=${humanFile.secondKindName}">登记</a>
                    </th>
                </tr>
            </c:forEach>

        </table>
    </div>
</form>


</body>


</html>

