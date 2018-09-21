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
        var salaryTotal = 0;
        $(function () {
            var bounsSum = 0;
            var saleSum = 0;
            var deductSum = 0;
            $(".1").each(function () {
                var salary = $(this).val();
                bounsSum += parseFloat(salary);
            })
            $(".2").each(function () {
                var salary = $(this).val();
                saleSum += parseFloat(salary);
            })
            $(".3").each(function () {
                var salary = $(this).val();
                deductSum += parseFloat(salary);
            })
            $("th[name=salary]").each(function () {
                var salary = $(this).text();
                salaryTotal += parseFloat(salary);
                $("#salary_standard_sum").text(salaryTotal + ", ");
                $("input[name=salaryStandardSum]").val(salaryTotal);
                $("#salary_paid_sum").text(parseFloat(salaryTotal) + bounsSum + saleSum - deductSum + ", ");
                $("#salaryPaidSum").val(parseFloat(salaryTotal) + bounsSum + saleSum - deductSum);
            })

            $("input[type=text]").blur(function () {
                bounsSum = 0;
                saleSum = 0;
                deductSum = 0;
                $(".1").each(function () {
                    var salary = $(this).val();
                    bounsSum += parseFloat(salary);
                })
                $(".2").each(function () {
                    var salary = $(this).val();
                    saleSum += parseFloat(salary);
                })
                $(".3").each(function () {
                    var salary = $(this).val();
                    deductSum += parseFloat(salary);
                })
                $("#salary_paid_sum").text(parseFloat(salaryTotal) + bounsSum + saleSum - deductSum + ", ");
                $("#salaryPaidSum").val(parseFloat(salaryTotal) + bounsSum + saleSum - deductSum);
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
               onClick="javascript:window.location='staffinfo_add.html'"/>
    </form>
</div>

<form action="/addSalaryGrantDetail" method="post">
    <div class="row" style="padding:15px; padding-top:0px; ">
        <span>薪酬单编号:${sessionScope.salaryGrant.salaryGrantId}</span>
        <input type="hidden" name="salaryGrant.salaryGrantId" value="${sessionScope.salaryGrant.salaryGrantId}">
    </div>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <span>机构:${requestScope.firstKindName}/${requestScope.secondKindName}</span>
        <input type="hidden" name="salaryGrant.firstKindName" value="${requestScope.firstKindName}">
        <input type="hidden" name="salaryGrant.secondKindName" value="${requestScope.secondKindName}">
    </div>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <%-- //显示薪酬发放次数--%>
        <div style="float: left"><span>薪酬次数:</span><span id="count">${sessionScope.salaryCount},</span></div>
        <%-- //显示薪酬发放人数--%>
        <div style="float: left"><span>总人数:</span><span id="human_amount">${requestScope.size}</span></div>
        <input type="hidden" name="salaryGrant.humanAmount" value="${requestScope.size}">
        <%--//显示基本薪酬总额--%>
        <div style="float: left"><span>基本薪酬总额:</span><span id="salary_standard_sum"></span></div>
        <input type="hidden" name="salaryGrant.salaryStandardSum">
        <%--//显示实发总额--%>
        <div style="float: left"><span>实发总额:</span><span
                id="salary_paid_sum">${sessionScope.salaryPaidSum}</span></div>
        <input type="hidden" id="salaryPaidSum" name="salaryGrant.salaryPaidSum">
        <%--//显示上次发薪时间--%>
        <div style="float: right"><span>上次发薪时间:</span><span
                id="check_time "><fmt:formatDate value="${requestScope.salaryGrantLast.checkTime}"
                                                 pattern="yyyy-MM-dd"></fmt:formatDate></span></div>
        <%--//显示登记人--%>
        <div style="float: right"><span>登记人:</span><span
                id="register">${sessionScope.user.uName}</span></div>
        <input type="hidden" name="salaryGrant.register" value="${sessionScope.user.uName} ">

    </div>
    <div class="row" style="padding:15px; padding-top:0px; ">
        <table class="table table-condensed table-striped">
            <tr>
                <th>序号</th>
                <th>档案编号</th>
                <th>姓名</th>
                <th>基本工资</th>
                <th>交通补贴</th>
                <th>通讯补贴</th>
                <th>浮动工资</th>
                <th>常规补助</th>
                <th>午餐补助</th>
                <th>交通补助</th>
                <th>车补</th>
                <th>奖励金额</th>
                <th>销售绩效金额</th>
                <th>应扣金额</th>
            </tr>
            <c:forEach items="${requestScope.humanFiles}" var="humanFile" varStatus="status">
                <tr>
                    <th>${status.count}</th>
                    <th>${humanFile.humanId}</th>
                    <input type="hidden" name="salaryGrantDetails[${status.index}].humanId"
                           value="${humanFile.humanId}">
                    <th>${humanFile.humanName}</th>
                    <input type="hidden" name="salaryGrantDetails[${status.index}].humanName"
                           value="${humanFile.humanName}">
                    <c:if test="${empty humanFile.salaryStandardDetails}">
                        <th name="salary" id="1">0.0</th>
                        <th name="salary" id="2">0.0</th>
                        <th name="salary" id="3">0.0</th>
                        <th name="salary" id="4">0.0</th>
                        <th name="salary" id="5">0.0</th>
                        <th name="salary" id="6">0.0</th>
                        <th name="salary" id="7">0.0</th>
                        <th name="salary" id="8">0.0</th>
                    </c:if>

                    <c:forEach items="${humanFile.salaryStandardDetails}" var="salaryStandardDetail">

                        <c:choose>
                            <c:when test="${salaryStandardDetail.itemName=='基本工资'}">
                                <th name="salary" id="1">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='交通补贴'}">
                                <th name="salary" id="2">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='通讯补贴'}">
                                <th name="salary" id="3">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='浮动工资'}">
                                <th name="salary" id="4">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='常规'}">
                                <th name="salary" id="5">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='午餐补助'}">
                                <th name="salary" id="6">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='交通补助'}">
                                <th name="salary" id="7">${salaryStandardDetail.salary}</th>
                            </c:when>
                            <c:when test="${salaryStandardDetail.itemName=='车补'}">
                                <th name="salary" id="8">${salaryStandardDetail.salary}</th>
                            </c:when>

                        </c:choose>

                    </c:forEach>

                    <th><input class="1" type="text" name="salaryGrantDetails[${status.index}].bounsSum" value="0.0"></th>
                    <th><input class="2" type="text" name="salaryGrantDetails[${status.index}].saleSum" value="0.0"></th>
                    <th><input class="3" type="text" name="salaryGrantDetails[${status.index}].deductSum" value="0.0"></th>

                    <input type="hidden" name="salaryGrantDetails[${status.index}].grdId"
                           value="${humanFile.salaryGrantDetail.grdId}">
                    <input type="hidden" name="salaryGrantDetails[${status.index}].salaryStandardSum"
                           value="${humanFile.salarySum}">
                    <input type="hidden" name="salaryGrantDetails[${status.index}].salaryGrantId"
                           value="${sessionScope.salaryGrant.salaryGrantId}">
                </tr>
            </c:forEach>

        </table>
    </div>
    <input type="submit" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
           name="submit"
           class="btn btn-success" value="提交复核"/>
</form>


</body>


</html>

