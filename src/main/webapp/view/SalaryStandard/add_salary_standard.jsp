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
    <title>薪酬标准登记</title>
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
            $.post("/createStandardId", "", function (result) {
                $("#standard_id").val(result)
            })


            function Calculation() {
                salary_sum = parseFloat($("#base_pay").val()) + parseFloat($("#traffic_allowance").val()) +
                    parseFloat($("#communication_subsidy").val()) + parseFloat($("#floating_wage").val()) +
                    parseFloat($("#conventional_wages").val()) + parseFloat($("#lunch_allowance").val()) +
                    parseFloat($("#traffic_subsidy").val()) + parseFloat($("#car_allowance").val());
                return salary_sum
            };

            $("#base_pay").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#traffic_allowance").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#communication_subsidy").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#floating_wage").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#conventional_wages").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#lunch_allowance").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#traffic_subsidy").blur(function () {
                $("#salary_sum").val(Calculation());
            })
            $("#car_allowance").blur(function () {
                $("#salary_sum").val(Calculation());
            })

        })
    </script>
</head>
<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">薪酬标准管理</a></li>
        <li>薪酬标准登记</li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="table-responsive">
            <form action="/addSalaryStandard" method="post" role="form" id="salaryStandardForm">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">薪酬标准登记</h1>
                        <input type="submit" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="submit"
                               class="btn btn-success" value="提交复核"/>
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
                        <td><input type="text" name="standardId" id="standard_id" readonly/></td>
                        <th><span>薪酬标准名称</span></th>
                        <td><input type="text" name="standardName" id="standard_name"/></td>
                        <th><span>薪酬标准总额</span></th>
                        <td><input type="text" name="salarySum"
                                   value="<fmt:formatNumber  value="${salary_sum}" pattern="0.00"/>" id="salary_sum"
                                   readonly/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>制定人</span></th>
                        <td><input type="text" name="designer" id="designer"/></td>
                        <th><span>登记人</span></th>
                        <td><input type="text" name="register" id="register" readonly
                                   value="${sessionScope.user.uName}"/></td>
                        <th><span>登记时间</span></th>
                        <th><input type="text" name="registTime" id="regist_time" readonly
                                   value="<fmt:formatDate value='${time}' pattern='yyyy-MM-dd HH:mm:ss'/>"/></th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>序号</span></th>
                        <th colspan="2"><span>薪酬项目名称</span></th>
                        <th colspan="5"><span>金额</span></th>
                    </tr>
                    <tr>
                        <th><span>1</span></th>
                        <th colspan="2"><span>基本工资</span></th>
                        <td colspan="2"><input type="text" id="base_pay" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="基本工资"></td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>2</span></th>
                        <th colspan="2"><span>交通补贴</span></th>
                        <td colspan="2"><input type="text" id="traffic_allowance" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="交通补贴"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>3</span></th>
                        <th colspan="2"><span>通讯补贴</span></th>
                        <td colspan="2"><input type="text" id="communication_subsidy" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="通讯补贴"></td>
                        </td>
                        <td colspan="3"></td>

                    </tr>
                    <tr>
                        <th><span>4</span></th>
                        <th colspan="2"><span>浮动工资</span></th>
                        <td colspan="2"><input type="text" id="floating_wage" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="浮动工资"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>5</span></th>
                        <th colspan="2"><span>常规</span></th>
                        <td colspan="2"><input type="text" id="conventional_wages" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="常规"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>6</span></th>
                        <th colspan="2"><span>午餐补助</span></th>
                        <td colspan="2"><input type="text" id="lunch_allowance" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="午餐补助"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>7</span></th>
                        <th colspan="2"><span>交通补助</span></th>
                        <td colspan="2"><input type="text" id="traffic_subsidy" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="交通补助"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th><span>8</span></th>
                        <th colspan="2"><span>车补</span></th>
                        <td colspan="2"><input type="text" id="car_allowance" name="salary"
                                               value="<fmt:formatNumber  value="0" pattern="0.00"/>">
                            <input type="hidden" name="itemName" value="车补"></td>
                        </td>
                        <td colspan="3"></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-4">
                        <input type="submit" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="submit"
                               class="btn btn-success" value="提交复核"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</html>
