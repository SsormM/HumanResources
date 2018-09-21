<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/9/4
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="time" class="java.util.Date"/>
<c:set var="salary_sum" value="0"/>
<html>
<head>
    <title>薪酬标准复核</title>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <style type="text/css">
        select, input {
            font-size: 20px;
            width: 100%;
            height: 30px;
        }

        span {
            font-size: 20px;
            display: block;
            width: 120px;
        }

        .table-bordered {
            border: 2px solid black;
        }
    </style>
    <script type="text/javascript">
        $(function () {

            function Calculation() {
                salary_sum = parseFloat($("#1").val()) + parseFloat($("#2").val()) +
                    parseFloat($("#3").val()) + parseFloat($("#4").val()) +
                    parseFloat($("#5").val()) + parseFloat($("#6").val()) +
                    parseFloat($("#7").val()) + parseFloat($("#8").val());
                return salary_sum
            };

            $("#1,#2,#3,#4,#5,#6,#7,#8").blur(function () {
                $("#salary_sum").val(Calculation());
            })

            $("input[name=uncomplete]").click(function () {
                $("#salaryStandardForm").attr('action', '/uncompleteSalaryStandard');
                $("#salaryStandardForm").submit();
            })

            $("input[name=complete]").click(function () {
                $("#salaryStandardForm").attr('action', '/completeSalaryStandard');
                $("#salaryStandardForm").submit();
            })


        })


    </script>
</head>
<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">薪酬标准管理</a></li>
        <li>薪酬标准复核</li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="table-responsive">
            <form action="" method="post" role="form" id="salaryStandardForm">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">薪酬标准复核</h1>
                        <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="uncomplete"
                               class="btn btn-danger" value="不通过"/>
                        <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="complete"
                               class="btn btn-success" value="通过"/>
                    </caption>
                    <colgroup>
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                        <col style="width:12.5%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th><span>薪酬标准编号</span></th>
                        <td><input type="text" name="standardId" id="standard_id"
                                   value="${requestScope.salaryStandard.standardId}" readonly/></td>
                        <th><span>薪酬标准名称</span></th>
                        <td><input type="text" name="standardName" id="standard_name"
                                   value="${requestScope.salaryStandard.standardName}"/></td>
                        <th><span>薪酬标准总额</span></th>
                        <td><input type="text" name="salarySum" id="salary_sum"
                                   value="<fmt:formatNumber  value="${requestScope.salaryStandard.salarySum}" pattern="0.00"/>"
                                   readonly/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>制定人</span></th>
                        <td><input type="text" name="designer" id="designer" readonly
                                   value="${requestScope.salaryStandard.designer}"/></td>
                        <th><span>复核人</span></th>
                        <td><input type="text" name="checker" id="checker" readonly
                                   value="${sessionScope.user.uName}"/></td>
                        <th><span>登记时间</span></th>
                        <th><input type="text" name="registTime" id="regist_time" readonly
                                   value="<fmt:formatDate value='${requestScope.salaryStandard.registTime}'
                                   pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                        </th>
                        <td></td>
                        <td></td>
                    </tr>
                    <c:if test="${requestScope.salaryStandard.changeStatus==1}">
                        <tr>
                            <th><span>复核意见</span></th>
                            <td colspan="7"><textarea name="checkComment" id="check_comment"
                                                      style="resize:none;font-size: 20px;"
                                                      cols="150" rows="5"
                                                      readonly>${requestScope.salaryStandard.checkComment}</textarea>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th><span>复核意见</span></th>
                        <td colspan="7"><textarea name="remark" id="remark" style="resize:none;font-size: 20px;"
                                                  cols="150" rows="10"></textarea></td>
                    </tr>
                    <tr>
                        <th><span>序号</span></th>
                        <th colspan="2"><span>薪酬项目名称</span></th>
                        <th colspan="5"><span>金额</span></th>
                    </tr>
                    <c:forEach items="${requestScope.salaryStandardDetails}" var="salaryStandardDetail"
                               varStatus="statu">
                        <tr>
                            <th><span>${statu.count}</span></th>
                            <th colspan="2"><span>${salaryStandardDetail.itemName}</span></th>
                            <td colspan="2"><input type="text" id="${statu.count}" name="salary"
                                                   value="<fmt:formatNumber  value="${salaryStandardDetail.salary}" pattern="0.00"/>">
                                <input type="hidden" name="itemName" value="${salaryStandardDetail.itemName}">
                                <input type="hidden" name="sdtId" value="${salaryStandardDetail.sdtId}"></td>
                            <td colspan="3"></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <div class="row">

                    <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           name="uncomplete"
                           class="btn btn-danger" value="不通过"/>
                    <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           name="complete"
                           class="btn btn-success" value="通过"/>

                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</html>
