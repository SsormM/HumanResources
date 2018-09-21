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
    <title>人事资料展示</title>
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

        })

    </script>
</head>
<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">人力资源档案管理</a></li>
        <li>人力资源档案查询</li>
    </ul>
</div>
<div class="container-fluid">

    <div class="row-fluid">
        <div class="table-responsive">
            <form action="/complete" method="post" role="form" id="humanFileForm">
                <input type="hidden" name="hufId" value="${requestScope.humanFile.hufId}">
                <input type="hidden" name="checker" value="${sessionScope.user.uName}">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">人力资源资源档案</h1>
                        <div class="row">
                            <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                                   name="delete"
                                   class="btn btn-danger" value="删除"/>
                            <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                                   name="update"
                                   class="btn btn-success" value="修改"/>

                        </div>
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
                        <td colspan="2"><input name="humanProDesignation" id="human_pro_designation" readonly
                                               value="${requestScope.humanFile.humanProDesignation}">
                        </input>
                        </td>
                    </tr>
                    <tr>
                        <th><span>姓名</span></th>
                        <td><input type="text" name="humanName" id="human_name" readonly
                                   value="${requestScope.humanFile.humanName}"></td>
                        <th><span>性别</span></th>
                        <td><input name="humanSex" id="human_sex" readonly value="${requestScope.humanFile.humanSex}">

                        </td>
                        <th><span>EMAIL</span></th>
                        <td colspan="2"><input type="text" name="humanEmail" readonly
                                               id="human_email" value="${requestScope.humanFile.humanEmail}"></td>
                    </tr>
                    <tr>
                        <th><span>电话</span></th>
                        <td><input type="text" name="humanTelephone" readonly
                                   id="human_telephone" value="${requestScope.humanFile.humanTelephone}"></td>
                        <th><span>QQ</span></th>
                        <td><input type="text" name="humanQq" id="human_qq" readonly
                                   value="${requestScope.humanFile.humanQq}">
                        </td>
                        <th><span>手机</span></th>
                        <td colspan="2"><input type="text" name="humanMobilephone" id="human_mobilephone" readonly
                                               value="${requestScope.humanFile.humanMobilephone}"></td>
                    </tr>
                    <tr>
                        <th><span>地址</span></th>
                        <td colspan="3"><input type="text" name="humanAddress" readonly
                                               id="human_address" value="${requestScope.humanFile.humanAddress}"></td>
                        <th><span>邮编</span></th>
                        <td colspan="2"><input type="text" name="humanPostcode" readonly
                                               id="human_postcode" value="${requestScope.humanFile.humanPostcode}"></td>
                    </tr>
                    <tr>
                        <th><span>国籍</span></th>
                        <td><input name="humanNationality" id="human_nationality" readonly
                                   value="${requestScope.humanFile.humanNationality}">
                        </td>
                        <th><span>出生地</span></th>
                        <td><input type="text" name="humanBirthplace" readonly
                                   id="human_birthplace" value="${requestScope.humanFile.humanBirthplace}"></td>
                        <th><span>生日</span></th>
                        <td><input type="text" name="humanBirthday" id="human_birthday" readonly
                                   class="form-control form_date"
                                   value="<fmt:formatDate value='${requestScope.humanFile.humanBirthday}' pattern='yyyy-MM-dd'/>">
                        </td>
                        <%--<div class="input-append date form_datetime">
                        <input id="humanBirthday" value="2014-09-23" type="text">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>--%>
                        <th><span>民族</span></th>
                        <td><input name="humanRace" id="human_race" readonly
                                   value="${requestScope.humanFile.humanRace}">
                        </td>
                    </tr>
                    <tr>
                        <th><span>宗教信仰</span></th>
                        <td><input name="humanReligion" id="human_religion" readonly
                                   value="${requestScope.humanFile.humanReligion}">
                        </td>
                        <th><span>政治面貌</span></th>
                        <td><input name="humanParty" id="human_party" readonly
                                   value="${requestScope.humanFile.humanParty}"/>
                        </td>
                        <th><span>身份证号码</span></th>
                        <td><input type="text" name="humanIdCard" id="human_id_card" readonly
                                   value="${requestScope.humanFile.humanIdCard}"></td>
                        <th><span>社会保障号码</span></th>
                        <td><input type="text" name="humanSocietySecurityId" id="human_society_security_id" readonly
                                   value="${requestScope.humanFile.humanSocietySecurityId}"></td>
                    </tr>
                    <tr>
                        <th><span>年龄</span></th>
                        <td><input type="text" name="humanAge" id="human_age" readonly
                                   value="${requestScope.humanFile.humanAge}"></td>
                        <th><span>学历</span></th>
                        <td><input name="humanEducatedDegree" id="human_educated_degree" readonly
                                   value="${requestScope.humanFile.humanEducatedDegree}"/>
                        </td>
                        <th><span>教育年限</span></th>
                        <td><input name="humanEducatedYears" id="human_educated_years" readonly
                                   value="${requestScope.humanFile.humanEducatedYears}"/>
                        </td>
                        <th><span>学历专业</span></th>
                        <td><input name="humanEducatedMajor" id="human_educated_major" readonly
                                   value="${requestScope.humanFile.humanEducatedMajor}"/>
                        </td>
                    </tr>
                    <tr>
                        <th><span>薪资标准</span></th>
                        <td><input name="salaryStandardId" id="salary_standard_id" readonly
                                   value="${requestScope.humanFile.salaryStandardId}"/></td>
                        <th><span>开户行</span></th>
                        <td><input type="text" name="humanBank" id="human_bank" readonly
                                   value="${requestScope.humanFile.humanBank}"></td>
                        <th><span>账号</span></th>
                        <td><input type="text" name="humanAccount" id="human_account" readonly
                                   value="${requestScope.humanFile.humanAccount}"></td>
                        <th><span>登记人</span></th>
                        <td><input type="text" readonly name="register" id="register" readonly
                                   value="${requestScope.humanFile.register}"></td>
                    </tr>
                    <tr>
                        <th><span>建档日期</span></th>
                        <td><input type="text" name="registTime" id="regist_time" readonly
                                   class="form-control form_date" readonly
                                   value="<fmt:formatDate value='${requestScope.humanFile.registTime}' pattern='yyyy-MM-dd'/>">
                        </td>
                        <th><span>特长</span></th>
                        <td><input name="humanSpeciality" id="human_speciality" readonly
                                   value="${requestScope.humanFile.humanSpeciality}">
                        </td>
                        <th><span>爱好</span></th>
                        <td><input name="humanHobby" id="human_hobby" readonly
                                   value="${requestScope.humanFile.humanHobby}"/>
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
                           name="delete"
                           class="btn btn-danger" value="删除"/>
                    <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                           name="update"
                           class="btn btn-success" value="修改"/>

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
