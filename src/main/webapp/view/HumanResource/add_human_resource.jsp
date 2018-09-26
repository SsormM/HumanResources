<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/9/4
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人力资源档案登记</title>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/bootstrapValidator-dist/css/bootstrapValidator.min.css"/>


    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <%--//时间选择插线--%>
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="../../jquery/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../jquery/locales/bootstrap-datetimepicker.zh-CN.js"
            charset="UTF-8"></script>

    <script type="text/javascript" src="/bootstrapValidator-dist/js/bootstrapValidator.min.js"></script>

    <style type="text/css">
        select, input {
            font-size: 20px;
            width: 100%;
            height: 30px;
        }

        label, span {
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

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_pro_designation").val(),
                function (result) {
                    $("#human_pro_designation").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_pro_designation").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_sex").val(),
                function (result) {
                    $("#human_sex").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_sex").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_nationality").val(),
                function (result) {
                    $("#human_nationality").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_nationality").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_race").val(),
                function (result) {
                    $("#human_race").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_race").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_religion").val(),
                function (result) {
                    $("#human_religion").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_religion").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })
            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_party").val(),
                function (result) {
                    $("#human_party").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_party").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_educated_degree").val(),
                function (result) {
                    $("#human_educated_degree").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_educated_degree").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_educated_years").val(),
                function (result) {
                    $("#human_educated_years").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_educated_years").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_educated_major").val(),
                function (result) {
                    $("#human_educated_major").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_educated_major").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_speciality").val(),
                function (result) {
                    $("#human_speciality").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_speciality").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })
            $.getJSON("/showConfigPublicCharByKind", "attributeKind=" + $("#human_hobby").val(),
                function (result) {
                    $("#human_hobby").html("");
                    for (var i = 0; i < result.length; i++) {
                        $("#human_hobby").append(
                            "<option value='" + result[i].attributeName + "'>" + result[i].attributeName + "</option>"
                        )
                    }
                })

            $.getJSON("/showAllSalaryStandard", "", function (result) {
                $("#salary_standard_id").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#salary_standard_id").append(
                        "<option value='" + result[i].standardId + "'>" + result[i].standardName + "</option>"
                    )
                }
            })

            $("button[name='submit']").click(function () {
                //手动验证表单
                //$('#myModalForm').data('bootstrapValidator').validate();

                if ($('#humanFileForm').data('bootstrapValidator').isValid()) {
                    $.getJSON("/register", $("#humanFileForm").serialize(), function (result) {
                        if (result == 1) {
                            alert("提交成功，请等待复核")
                        } else {
                            alert("提交失败！")
                        }
                    })
                } else {
                    alert("请正确填写")
                }
            })


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


        })
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /**
             * 下面是进行插件初始化
             * 你只需传入相应的键值对
             * */
            $('#humanFileForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    /*输入框不同状态，显示图片的样式*/
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    /*验证*/
                    humanName: {
                        /*键名username和input name值对应*/
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                /*非空提示*/
                                message: '用户名不能为空'
                            }
                        }

                    },
                    humanEmail: {
                        /*键名username和input name值对应*/
                        message: 'The email is not valid',
                        validators: {
                            emailAddress: {
                                /*非空提示*/
                                message: '邮箱地址不合法'
                            }
                        }
                    },
                    humanMobilephone: {
                        /*键名username和input name值对应*/
                        message: 'The humanMobilephone is not valid',
                        validators: {
                            notEmpty: {
                                /*非空提示*/
                                message: '手机号不能为空'
                            }
                        }
                    },
                    humanIdCard: {
                        message: 'The humanIdCard is not valid',
                        validators: {
                            notEmpty: {
                                /*非空提示*/
                                message: '身份证不能为空'
                            },
                            creditCard: {
                                message: '身份证格式不正确'
                            }
                        }
                    },
                    registTime: {
                        message: 'The registTime is not valid',
                        validators: {
                            notEmpty: {
                                /*非空提示*/
                                message: '建档日期不能为空'
                            },
                            date: {
                                message: '建档日期格式不正确'
                            }
                        }
                    }
                }
            });
        });
    </script>

</head>
<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">人力资源档案管理</a></li>
        <li>人力资源档案登记</li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="table-responsive">
            <form action="" class="form-horizontal" method="post" role="form" id="humanFileForm">
                <table class="table table-bordered" STYLE="background-color:rgba(114,202,204,0.8)">
                    <caption><h1 style="display: block;float:left;width: 50%">人力资源资源档案登记</h1>

                        <button style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                                name="submit"
                                class="btn btn-success">提交复核
                        </button>

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
                        <td><select name="firstKindId" id="first_kind_id"></select></td>
                        <th><span>二级机构</span></th>
                        <td><select name="secondKindId" id="second_kind_id"></select></td>
                        <th><span>三级机构</span></th>
                        <td colspan="2"><select name="thirdKindId" id="third_kind_id"></select></td>
                        <td rowspan="5"><img src=""></td>
                    </tr>
                    <tr>
                        <th><span>职位分类</span></th>
                        <td><select name="humanMajorKindId" id="human_major_kind_id"></select></td>
                        <th><span>职位名称</span></th>
                        <td><select name="humanMajorId" id="human_major_id"></select></td>
                        <th><span>职称</span></th>
                        <td colspan="2"><select name="humanProDesignation" id="human_pro_designation">
                            <option value="职称" selected></option>
                        </select></td>
                    </tr>
                    <tr>
                        <th><span>姓名</span></th>
                        <td>
                            <div class="form-group" style="padding: 0px">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control" name="humanName" id="human_name"/>
                                </div>
                            </div>
                        </td>


                        <th><span>性别</span></th>
                        <td><select name="humanSex" id="human_sex">
                            <option value="性别" selected></option>
                        </select></td>
                        <th><span>EMAIL</span></th>
                        <td colspan="2">
                            <div class="form-group" style="padding: 0px">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control" name="humanEmail" id="human_email">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>电话</span></th>
                        <td>
                            <input type="text" name="humanTelephone" id="human_telephone">

                        </td>
                        <th><span>QQ</span></th>
                        <td>

                            <input type="text" name="humanQq" id="human_qq">

                        </td>
                        <th><span>手机</span></th>
                        <td colspan="2">
                            <div class="form-group" style="padding: 0px">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control" name="humanMobilephone"
                                           id="human_mobilephone">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>地址</span></th>
                        <td colspan="3"><input type="text" name="humanAddress" id="human_address"></td>
                        <th><span>邮编</span></th>
                        <td colspan="2"><input type="text" name="humanPostcode" id="human_postcode"></td>
                    </tr>
                    <tr>
                        <th><span>国籍</span></th>
                        <td><select name="humanNationality" id="human_nationality">
                            <option value="国籍" selected></option>
                        </select></td>
                        <th><span>出生地</span></th>
                        <td><input type="text" name="humanBirthplace" id="human_birthplace"></td>
                        <th><span>生日</span></th>
                        <td><input type="text" name="humanBirthday" id="human_birthday"
                                   class="form-control form_date" readonly>
                        </td>
                        <%--<div class="input-append date form_datetime">
                        <input id="humanBirthday" value="2014-09-23" type="text">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>--%>
                        <th><span>民族</span></th>
                        <td><select name="humanRace" id="human_race">
                            <option value="民族" selected></option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th><span>宗教信仰</span></th>
                        <td><select name="humanReligion" id="human_religion">
                            <option value="宗教信仰" selected></option>
                        </select>
                        </td>
                        <th><span>政治面貌</span></th>
                        <td><select name="humanParty" id="human_party">
                            <option value="政治面貌" selected></option>
                        </select>
                        </td>
                        <th><span>身份证号码</span></th>
                        <td>
                            <div class="form-group" style="padding: 0px">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control" name="humanIdCard" id="human_id_card"></div>
                            </div>
                        </td>
                        <th><span>社会保障号码</span></th>
                        <td><input type="text" name="humanSocietySecurityId" id="human_society_security_id"></td>
                    </tr>
                    <tr>
                        <th><span>年龄</span></th>
                        <td><input type="text" name="humanAge" id="human_age"></td>
                        <th><span>学历</span></th>
                        <td><select name="humanEducatedDegree" id="human_educated_degree">
                            <option value="学历" selected></option>
                        </select>
                        </td>
                        <th><span>教育年限</span></th>
                        <td><select name="humanEducatedYears" id="human_educated_years">
                            <option value="教育年限" selected></option>
                        </select>
                        </td>
                        <th><span>学历专业</span></th>
                        <td><select name="humanEducatedMajor" id="human_educated_major">
                            <option value="专业" selected></option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th><span>薪资标准</span></th>
                        <td><select name="salaryStandardId" id="salary_standard_id">
                            <option value="薪资标准" selected></option>
                        </select></td>
                        <th><span>开户行</span></th>
                        <td><input type="text" name="humanBank" id="human_bank  "></td>
                        <th><span>账号</span></th>
                        <td><input type="text" name="humanAccount" id="human_account"></td>
                        <th><span>登记人</span></th>
                        <td><input type="text" readonly name="register" id="register"
                                   value="${sessionScope.user.uName}"></td>
                    </tr>
                    <tr>
                        <th><span>建档日期</span></th>
                        <td>
                            <div class="form-group" style="padding: 0px">
                                <div class="col-lg-12">
                                    <input type="text" name="registTime" id="regist_time"
                                           class="form-control form_date" readonly></div>
                            </div>
                        </td>
                        <th><span>特长</span></th>
                        <td><select name="humanSpeciality" id="human_speciality">
                            <option value="特长" selected></option>
                        </select>
                        </td>
                        <th><span>爱好</span></th>
                        <td><select name="humanHobby" id="human_hobby">
                            <option value="爱好" selected></option>
                        </select>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th><span>个人简历</span></th>
                        <td colspan="7"><textarea name="humanHistroyRecords" id="human_histroy_records"
                                                  style="resize:none;font-size: 20px;" cols="150" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span>家庭关系信息</span></th>
                        <td colspan="7"><textarea name="humanFamilyMembership" id="human_family_membership"
                                                  style="resize:none;font-size: 20px;" cols="150" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th><span>备注</span></th>
                        <td colspan="7"><textarea name="remark" id="remark" style="resize:none;font-size: 20px;"
                                                  cols="150" rows="10"></textarea></td>
                    </tr>
                    </tbody>
                </table>

                <div class="row">
                    <div class="col-sm-3 col-sm-offset-4">
                        <input type="button" style="float:right;width:200px;height:50px;margin: 20px;font-size: 20px"
                               name="submit"
                               class="btn btn-success" value="提交复核"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <!-- class都是bootstrap定义好的样式，验证是根据input中的name值 -->
    <form id="testForm" method="post" class="form-horizontal" action="ajaxSubmit.php">
        <!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
        <div class="form-group">

            <div class="col-lg-5">
                <input type="text" class="form-control" name="username"/>
            </div>
            6
        </div>

        <div class="form-group">

            <div class="col-lg-5">
                <input type="text" class="form-control" name="email"/>
            </div>
        </div>

        <div class="form-group">

            <div class="col-lg-5">
                <input type="password" class="form-control" name="password"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-9 col-lg-offset-3">
                <button type="submit" class="btn btn-primary">Sign up</button>
            </div>
        </div>
    </form>

</div>

</body>
</html>
