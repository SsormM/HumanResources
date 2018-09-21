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
<html>
<head>
    <title>用户添加界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.css">
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
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
            $.getJSON("/showConfigPublicCharByKind", "attributeKind=职称",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_pro_designation").val()) {
                            $("#human_pro_designation").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=性别",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_sex").val()) {
                            $("#human_sex").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=国籍",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_nationality").val()) {
                            $("#human_nationality").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=民族",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_race").val()) {
                            $("#human_race").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=宗教信仰",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_religion").val()) {
                            $("#human_religion").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=政治面貌",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_party").val()) {
                            $("#human_party").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=学历",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_educated_degree").val()) {
                            $("#human_educated_degree").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=教育年限",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_educated_years").val()) {
                            $("#human_educated_years").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=专业",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_educated_major").val()) {
                            $("#human_educated_major").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })


            $.getJSON("/showConfigPublicCharByKind", "attributeKind=特长",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_speciality").val()) {
                            $("#human_speciality").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=爱好",
                function (result) {
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].attributeName != $("#human_hobby").val()) {
                            $("#human_hobby").append(
                                "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                            )
                        }
                    }
                })

            $.getJSON("/showAllSalaryStandard", "", function (result) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].standardId != $("#salary_standard_id").val()) {
                        $("#salary_standard_id").append(
                            "<option value='" + result[i].standardId + "'>" + result[i].standardName + "</option>"
                        )
                    }
                }
            })

        })
    </script>
</head>
<body>
<div class="container-fluid">

    <div class="row-fluid">
        <div class="table-responsive">
            <form action="/complete" method="post" role="form" id="humanFileForm">
                <input type="hidden" name="hufId" value="${requestScope.humanFile.hufId}">
                <input type="hidden" name="checker" value="${sessionScope.user.uName}">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">人力资源资源档案登记</h1>
                        <a type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           href="/uncomplete?hufId=${requestScope.humanFile.hufId}"
                           name="uncomplete"
                           class="btn btn-danger">不通过</a>
                        <input type="submit" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
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
                        <th><span>一级机构</span></th>
                        <td><input name="firstKindName" id="first_kind_id" readonly
                                   value="${requestScope.humanFile.firstKindName}"/>
                            <input name="firstKindId" value="${requestScope.humanFile.firstKindId}" type="hidden">
                        </td>
                        <th><span>二级机构</span></th>
                        <td><input name="secondKindName" id="second_kind_id" readonly
                                   value="${requestScope.humanFile.secondKindName}"/>
                            <input name="secondKindId" value="${requestScope.humanFile.secondKindId}" type="hidden">
                        </td>
                        <th><span>三级机构</span></th>
                        <td colspan="2"><input name="thirdKindName" id="third_kind_id" readonly
                                               value="${requestScope.humanFile.thirdKindName}"/>
                            <input name="thirdKindId" value="${requestScope.humanFile.thirdKindId}" type="hidden">
                        </td>
                        <td rowspan="5"><img src=""></td>
                    </tr>
                    <tr>
                        <th><span>职位分类</span></th>
                        <td><input name="humanMajorKindName" id="human_major_kind_id" readonly
                                   value="${requestScope.humanFile.humanMajorKindName}"/>
                            <input name="humanMajorKindId" value="${requestScope.humanFile.humanMajorKindId}"
                                   type="hidden">
                        </td>
                        <th><span>职位名称</span></th>
                        <td><input name="hunmaMajorName" id="human_major_id" readonly
                                   value="${requestScope.humanFile.hunmaMajorName}"/>
                            <input name="humanMajorId" value="${requestScope.humanFile.humanMajorId}" type="hidden">
                        </td>
                        <th><span>职称</span></th>
                        <td colspan="2"><select name="humanProDesignation" id="human_pro_designation">
                            <option>${requestScope.humanFile.humanProDesignation}</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th><span>姓名</span></th>
                        <td><input type="text" name="humanName" id="human_name"
                                   value="${requestScope.humanFile.humanName}"></td>
                        <th><span>性别</span></th>
                        <td><select name="humanSex" id="human_sex">
                            <option>${requestScope.humanFile.humanSex}</option>
                        </select>
                        </td>
                        <th><span>EMAIL</span></th>
                        <td colspan="2"><input type="text" name="humanEmail"
                                               id="human_email" value="${requestScope.humanFile.humanEmail}"></td>
                    </tr>
                    <tr>
                        <th><span>电话</span></th>
                        <td><input type="text" name="humanTelephone"
                                   id="human_telephone" value="${requestScope.humanFile.humanTelephone}"></td>
                        <th><span>QQ</span></th>
                        <td><input type="text" name="humanQq" id="human_qq"
                                   value="${requestScope.humanFile.humanQq}">
                        </td>
                        <th><span>手机</span></th>
                        <td colspan="2"><input type="text" name="humanMobilephone" id="human_mobilephone"
                                               value="${requestScope.humanFile.humanMobilephone}"></td>
                    </tr>
                    <tr>
                        <th><span>地址</span></th>
                        <td colspan="3"><input type="text" name="humanAddress"
                                               id="human_address" value="${requestScope.humanFile.humanAddress}"></td>
                        <th><span>邮编</span></th>
                        <td colspan="2"><input type="text" name="humanPostcode"
                                               id="human_postcode" value="${requestScope.humanFile.humanPostcode}"></td>
                    </tr>
                    <tr>
                        <th><span>国籍</span></th>
                        <td><select name="humanNationality" id="human_nationality">
                            <option>${requestScope.humanFile.humanNationality}</option>
                        </select>
                        </td>
                        <th><span>出生地</span></th>
                        <td><input type="text" name="humanBirthplace"
                                   id="human_birthplace" value="${requestScope.humanFile.humanBirthplace}"></td>
                        <th><span>生日</span></th>
                        <td><input type="text" name="humanBirthday" id="human_birthday"
                                   class="form-control form_date"
                                   value="<fmt:formatDate value='${requestScope.humanFile.humanBirthday}' pattern='yyyy-MM-dd'/>">
                        </td>
                        <%--<div class="input-append date form_datetime">
                        <input id="humanBirthday" value="2014-09-23" type="text">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>--%>
                        <th><span>民族</span></th>
                        <td><select name="humanRace" id="human_race">
                            <option>${requestScope.humanFile.humanRace}</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th><span>宗教信仰</span></th>
                        <td><select name="humanReligion" id="human_religion">
                            <option>${requestScope.humanFile.humanReligion}</option>
                        </select>
                        </td>
                        <th><span>政治面貌</span></th>
                        <td><select name="humanParty" id="human_party">
                            <option>${requestScope.humanFile.humanParty}</option>
                        </select>
                        </td>
                        <th><span>身份证号码</span></th>
                        <td><input type="text" name="humanIdCard" id="human_id_card"
                                   value="${requestScope.humanFile.humanIdCard}"></td>
                        <th><span>社会保障号码</span></th>
                        <td><input type="text" name="humanSocietySecurityId" id="human_society_security_id"
                                   value="${requestScope.humanFile.humanSocietySecurityId}"></td>
                    </tr>
                    <tr>
                        <th><span>年龄</span></th>
                        <td><input type="text" name="humanAge" id="human_age"
                                   value="${requestScope.humanFile.humanAge}"></td>
                        <th><span>学历</span></th>
                        <td><select name="humanEducatedDegree" id="human_educated_degree">
                            <option>${requestScope.humanFile.humanEducatedDegree}</option>
                        </select>
                        </td>
                        <th><span>教育年限</span></th>
                        <td><select name="humanEducatedYears" id="human_educated_years">
                            <option>${requestScope.humanFile.humanEducatedYears}</option>
                        </select>
                        </td>
                        <th><span>学历专业</span></th>
                        <td><select name="humanEducatedMajor" id="human_educated_major">
                            <option>${requestScope.humanFile.humanEducatedMajor}</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th><span>薪资标准</span></th>
                        <td><select name="salaryStandardId" id="salary_standard_id">
                            <option value="${requestScope.humanFile.salaryStandardId}">
                                ${requestScope.humanFile.salaryStandardName}</option>
                        </select>
                        <th><span>开户行</span></th>
                        <td><input type="text" name="humanBank" id="human_bank"
                                   value="${requestScope.humanFile.humanBank}"></td>
                        <th><span>账号</span></th>
                        <td><input type="text" name="humanAccount" id="human_account"
                                   value="${requestScope.humanFile.humanAccount}"></td>
                        <th><span>登记人</span></th>
                        <td><input type="text" readonly name="register" id="register" readonly
                                   value="${requestScope.humanFile.register}"></td>
                    </tr>
                    <tr>
                        <th><span>建档日期</span></th>
                        <td><input type="text" name="registTime" id="regist_time"
                                   class="form-control form_date" readonly
                                   value="<fmt:formatDate value='${requestScope.humanFile.registTime}' pattern='yyyy-MM-dd'/>">
                        </td>
                        <th><span>特长</span></th>
                        <td><select name="humanSpeciality" id="human_speciality">
                            <option>${requestScope.humanFile.humanSpeciality}</option>
                        </select>
                        </td>
                        <th><span>爱好</span></th>
                        <td><select name="humanHobby" id="human_hobby">
                            <option>${requestScope.humanFile.humanHobby}</option>
                        </select>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>个人简历</span></th>
                        <td colspan="7"><textarea name="humanHistroyRecords" id="human_histroy_records" readonly
                                                  style="resize:none;font-size: 20px;" cols="150"
                                                  rows="10">${requestScope.humanFile.humanHistroyRecords}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span>家庭关系信息</span></th>
                        <td colspan="7"><textarea name="humanFamilyMembership" id="human_family_membership" readonly
                                                  style="resize:none;font-size: 20px;" cols="150"
                                                  rows="10">${requestScope.humanFile.humanFamilyMembership}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span>备注</span></th>
                        <td colspan="7"><textarea name="remark" id="remark" style="resize:none;font-size: 20px;"
                                                  readonly
                                                  cols="150" rows="10">${requestScope.humanFile.remark}</textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="row">
                    <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           name="submit"
                           class="btn btn-danger" value="不通过"/>
                    <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           name="submit"
                           class="btn btn-success" value="通过"/>

                </div>

            </form>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="../../jquery/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('#human_birthday ,#regist_time').datetimepicker({
        language: "zh-CN",
        format: 'yyyy-mm-dd',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>
</html>
