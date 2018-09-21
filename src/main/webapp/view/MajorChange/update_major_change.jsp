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
                $("#first_kind_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#first_kind_id").append(
                        "<option value='" + result[i].firstKindId + "'>" + result[i].firstKindName + "</option>")
                }
            })
            $.getJSON("/showAllConfigFileSecondKind", "", function (result) {
                $("#second_kind_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#second_kind_id").append(
                        "<option value='" + result[i].secondKindId + "'>" + result[i].secondKindName + "</option>")
                }
            })
            $.getJSON("/showAllConfigFileThirdKind", "", function (result) {
                $("#third_kind_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#third_kind_id").append(
                        "<option value='" + result[i].thirdKindId + "'>" + result[i].thirdKindName + "</option>")
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
                $("#human_major_kind_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#human_major_kind_id").append(
                        "<option value='" + result[i].majorKindId + "'>" + result[i].majorKindName + "</option>"
                    )
                }
            })

            $.getJSON("/showConfigMajor", "", function (result) {
                $("#human_major_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#human_major_id").append(
                        "<option value='" + result[i].majorId + "'>" + result[i].majorName + "</option>"
                    )
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

        })
    </script>
</head>
<body>
<div class="container-fluid">

    <div class="row-fluid">
        <div class="table-responsive">
            <form action="/addMajorChange" method="post" role="form" id="majorChangeForm">
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
                        <td colspan="7"><span>${requestScope.humanFile.humanId}</span></td>
                        <input type="hidden" name="humanId" value="${requestScope.humanFile.humanId}">
                    </tr>
                    <tr>
                        <th><span>原一级机构</span></th>
                        <td><span>${requestScope.humanFile.firstKindName}</span></td>
                        <input type="hidden" name="firstKindId" value="${requestScope.humanFile.firstKindId}">
                        <input type="hidden" name="firstKindName" value="${requestScope.humanFile.firstKindName}">
                        <th><span>原二级机构</span></th>
                        <td><span>${requestScope.humanFile.secondKindName}</span></td>
                        <input type="hidden" name="secondKindId" value="${requestScope.humanFile.secondKindId}">
                        <input type="hidden" name="secondKindName" value="${requestScope.humanFile.secondKindName}">
                        <th><span>原三级机构</span></th>
                        <td><span>${requestScope.humanFile.thirdKindName}</span></td>
                        <input type="hidden" name="thirdKindId" value="${requestScope.humanFile.thirdKindId}">
                        <input type="hidden" name="thirdKindName" value="${requestScope.humanFile.thirdKindName}">
                        <th><span>姓名</span></th>
                        <td><span>${requestScope.humanFile.humanName}</span></td>
                        <input type="hidden" name="humanName" value="${requestScope.humanFile.humanName}">
                    </tr>
                    <tr>
                        <th><span>原职位分类</span></th>
                        <td><span>${requestScope.humanFile.humanMajorKindName}</span></td>
                        <input type="hidden" name="majorKindId" value="${requestScope.humanFile.humanMajorKindId}"/>
                        <input type="hidden" name="majorKindName" value="${requestScope.humanFile.humanMajorKindName}"/>
                        <th><span>原职位名称</span></th>
                        <td><span>${requestScope.humanFile.hunmaMajorName}</span></td>
                        <input type="hidden" name="majorId" value="${requestScope.humanFile.humanMajorId}"/>
                        <input type="hidden" name="majorName" value="${requestScope.humanFile.hunmaMajorName}"/>
                        <th><span>原薪酬标准</span></th>
                        <td><span>${requestScope.humanFile.salaryStandardName}</span></td>
                        <input type="hidden" name="salaryStandardId" value="${requestScope.humanFile.salaryStandardId}"/>
                        <input type="hidden" name="salaryStandardName" value="${requestScope.humanFile.salaryStandardName}"/>
                        <input type="hidden" name="salarySum" value="${requestScope.humanFile.salarySum}"/>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>新一级机构</span></th>
                        <td><select name="newFirstKindId" id="first_kind_id"></select></td>
                        <th><span>新二级机构</span></th>
                        <td><select name="newSecondKindId" id="second_kind_id"></select></td>
                        <th><span>新三级机构</span></th>
                        <td><select name="newThirdKindId" id="third_kind_id"></select></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>新职位分类</span></th>
                        <td><select name="newMajorKindId" id="human_major_kind_id"></select></td>
                        <th><span>新职位名称</span></th>
                        <td><select name="newMajorId" id="human_major_id"></select></td>
                        <th><span>新薪资标准</span></th>
                        <td><select name="newSalaryStandardId" id="salary_standard_id"></select></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>登记人</span></th>
                        <td><span>${sessionScope.user.uName}</span></td>
                        <input type="hidden" name="register" value="${sessionScope.user.uName}">
                        <th><span>登记时间</span></th>
                        <td><span><fmt:formatDate value="${time}" pattern="yyyy-MM-dd"></fmt:formatDate> </span></td>
                        <th></th>
                        <td></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>调动原因</span></th>
                        <td colspan="7"><textarea name="changeReason" id="change_reason"
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
