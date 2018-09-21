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
<html>
<head>
    <title>用户添加界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.css">
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        input, select {
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
            $.getJSON("/showAllConfigFileFirstKind", "", function (result) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].firstKindName != $("#first_kind_id").val()) {
                        $("#first_kind_id").append(
                            "<option value='" + result[i].firstKindId + "'>" + result[i].firstKindName + "</option>")
                    }
                }
            })

            $.getJSON("/showAllConfigFileSecondKind", "", function (result) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].secondKindName != $("#second_kind_id").val()) {
                        $("#second_kind_id").append(
                            "<option value='" + result[i].secondKindId + "'>" + result[i].secondKindName + "</option>")
                    }
                }
            })

            $.getJSON("/showAllConfigFileThirdKind", "", function (result) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].thirdKindName != $("#third_kind_id").val()) {
                        $("#third_kind_id").append(
                            "<option value='" + result[i].thirdKindId + "'>" + result[i].thirdKindName + "</option>")
                    }
                }
            })

            $("#first_kind_id").change(function () {
                $.getJSON("/showConfigFileFirstKindByFirstId", "firstKindId=" + $("#first_kind_id").val(), function (result) {
                    $("#second_kind_id").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#second_kind_id").append(
                            "<option value='" + result[i].secondKindId + "'>" + result[i].secondKindName + "</option>")
                    }
                })
            })
            $("#second_kind_id,#first_kind_id").change(function () {
                alert("firstKindId=" + $("#first_kind_id").val())
                alert("secondKindId=" + $("#second_kind_id").val())
                $.getJSON("/showConfigFileThirdKindById",
                    /*"firstKindId=1" + "&secondKindId=2",*/
                    "firstKindId=" + $("#first_kind_id").val() + "&secondKindId=" + $("#second_kind_id").val(),
                    function (result) {
                        $("#third_kind_id").html("");
                        for (var i = 0; i < result.length; i++) {
                            $("#third_kind_id").append(
                                "<option value='" + result[i].thirdKindId + "'>" + result[i].thirdKindName + "</option>")
                        }
                    });
            })

            $.getJSON("/showAllMajorKind", "", function (result) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].majorKindName != $("#human_major_kind_id").val()) {
                        $("#human_major_kind_id").append(
                            "<option value='" + result[i].majorKindId + "'>" + result[i].majorKindName + "</option>"
                        )
                    }
                }
            })

            $.getJSON("/showConfigMajor", "", function (result) {

                for (var i = 0; i < result.length; i++) {
                    if (result[i].majorName != $("#human_major_id").val()) {
                        $("#human_major_id").append(
                            "<option value='" + result[i].majorId + "'>" + result[i].majorName + "</option>"
                        )
                    }
                }

            })

            $("#human_major_kind_id").change(function () {
                $.getJSON("/showConfigMajorById", "kindId=" + $("#human_major_kind_id").val(), function (result) {
                    $("#human_major_id").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_major_id").append(
                            "<option value='" + result[i].majorId + "'>" + result[i].majorName + "</option>"
                        )
                    }
                })
            })

            $.getJSON("/showAllSalaryStandard", "", function (result) {
                $("#salary_standard_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#salary_standard_id").append(
                        "<option value='" + result[i].standardId + "'>" + result[i].standardName + "</option>"
                    )
                }
            })

            $("input[name=uncomplete]").click(function () {
                $("#majorChangeForm").attr('action', '/uncompleteMajorChange');
                $("#majorChangeForm").submit();
            })

            $("input[name=complete]").click(function () {
                $("#majorChangeForm").attr('action', '/completeMajorChange');
                $("#majorChangeForm").submit();
            })

        })
    </script>
</head>
<body>
<div class="container-fluid">

    <div class="row-fluid">
        <div class="table-responsive">
            <form action="" method="post" role="form" id="majorChangeForm">
                <input type="hidden" name="mchId" value="${requestScope.majorChange.mchId}">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">人力资源职位变更登记</h1>
                        <a type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           href="view/MajorChange/search_human_resource.jsp"
                           name="uncomplete"
                           class="btn btn-danger">取消</a>
                        <input type="submit" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="complete"
                               class="btn btn-success" value="提交"/>
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
                        <th><span>档案编号</span></th>
                        <td colspan="7"><span>${requestScope.majorChange.humanId}</span></td>
                        <input type="hidden" name="humanId" value="${requestScope.majorChange.humanId}">
                    </tr>
                    <tr>
                        <th><span>原一级机构</span></th>
                        <td><span>${requestScope.majorChange.firstKindName}</span></td>

                        <th><span>原二级机构</span></th>
                        <td><span>${requestScope.majorChange.secondKindName}</span></td>

                        <th><span>原三级机构</span></th>
                        <td><span>${requestScope.majorChange.thirdKindName}</span></td>

                        <th><span>姓名</span></th>
                        <td><span>${requestScope.majorChange.humanName}</span></td>

                    </tr>
                    <tr>
                        <th><span>原职位分类</span></th>
                        <td><span>${requestScope.majorChange.majorKindName}</span></td>
                        <th><span>原职位名称</span></th>
                        <td><span>${requestScope.majorChange.majorName}</span></td>
                        <th><span>原薪酬标准</span></th>
                        <td><span>${requestScope.majorChange.salaryStandardName}</span></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>新一级机构</span></th>
                        <td><select name="newFirstKindId" id="first_kind_id">
                            <option value="${requestScope.majorChange.newFirstKindId}">
                                ${requestScope.majorChange.newFirstKindName}</option>
                        </select></td>
                        <th><span>新二级机构</span></th>
                        <td><select name="newSecondKindId" id="second_kind_id">
                            <option value="${requestScope.majorChange.newSecondKindId}">
                                ${requestScope.majorChange.newSecondKindName}</option>
                        </select></td>
                        <th><span>新三级机构</span></th>
                        <td><select name="newThirdKindId" id="third_kind_id">
                            <option value="${requestScope.majorChange.newThirdKindId}">
                                ${requestScope.majorChange.newThirdKindName}</option>
                        </select></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>新职位分类</span></th>
                        <td><select name="newMajorKindId" id="human_major_kind_id">
                            <option value="${requestScope.majorChange.newMajorKindId}">
                                ${requestScope.majorChange.newMajorKindName}</option>
                        </select></td>
                        <th><span>新职位名称</span></th>
                        <td><select name="newMajorId" id="human_major_id">
                            <option value="${requestScope.majorChange.newMajorId}">
                                ${requestScope.majorChange.newMajorName}</option>
                        </select></td>
                        <th><span>新薪资标准</span></th>
                        <td><select name="newSalaryStandardId" id="salary_standard_id">
                            <option value="${requestScope.majorChange.newSalaryStandardId}">
                                ${requestScope.majorChange.newSalaryStandardName}</option>
                        </select></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>登记人</span></th>
                        <td><span>${requestScope.majorChange.register}</span></td>
                        <th><span>登记时间</span></th>
                        <td><span><fmt:formatDate value="${requestScope.majorChange.registTime}"
                                                  pattern="yyyy-MM-dd"></fmt:formatDate>
                        </span></td>
                        <th><span>审核人</span></th>
                        <td><span>${sessionScope.user.uName}</span></td>
                        <input type="hidden" name="checker" value="${sessionScope.user.uName}">
                        <th><span>审核时间</span></th>
                        <td><span><fmt:formatDate value="${time}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></td>
                    </tr>
                    <tr>
                        <th><span>调动原因</span></th>
                        <td colspan="7"><textarea name="changeReason" id="change_reason" readonly
                                                  style="resize:none;font-size: 20px;" cols="150" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span>审核原因</span></th>
                        <td colspan="7"><textarea name="checkReason" id="check_reason"
                                                  style="resize:none;font-size: 20px;" cols="150" rows="10"></textarea>
                        </td>
                    </tr>


                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

</body>


</html>
