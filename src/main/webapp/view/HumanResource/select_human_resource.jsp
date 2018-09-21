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
    <title>人事查询</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <%--<script src="../../../js/jquery.min.js"></script>--%>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%-- <script src="../../../js/bootstrap.min.js"></script>--%>
    <link href="../../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.getJSON("/showAllConfigFileFirstKind", "", function (result) {
                $("#first_kind_id").html("");
                $("#first_kind_id").append("<option value='0'>--请选择--</option>");
                for (var i = 0; i < result.length; i++) {
                    $("#first_kind_id").append(
                        "<option value='" + result[i].firstKindId + "'>" + result[i].firstKindName + "</option>")
                }
            })
            $.getJSON("/showAllConfigFileSecondKind", "", function (result) {
                $("#second_kind_id").html("");
                $("#second_kind_id").append("<option value='0'>--请选择--</option>");
                for (var i = 0; i < result.length; i++) {
                    $("#second_kind_id").append(
                        "<option value='" + result[i].secondKindId + "'>" + result[i].secondKindName + "</option>")
                }
            })
            $.getJSON("/showAllConfigFileThirdKind", "", function (result) {
                $("#third_kind_id").html("");
                $("#third_kind_id").append("<option value='0'>--请选择--</option>");
                for (var i = 0; i < result.length; i++) {
                    $("#third_kind_id").append(
                        "<option value='" + result[i].thirdKindId + "'>" + result[i].thirdKindName + "</option>")
                }
            })
            $.getJSON("/showAllMajorKind", "", function (result) {
                $("#human_major_kind_id").html("");
                $("#human_major_kind_id").append("<option value='0'>--请选择--</option>");
                for (var i = 0; i < result.length; i++) {
                    $("#human_major_kind_id").append(
                        "<option value='" + result[i].majorKindId + "'>" + result[i].majorKindName + "</option>"
                    )
                }
            })

            $.getJSON("/showConfigMajor", "", function (result) {
                $("#human_major_id").html("");
                $("#human_major_id").append("<option value='0'>--请选择--</option>");
                for (var i = 0; i < result.length; i++) {
                    $("#human_major_id").append(
                        "<option value='" + result[i].majorId + "'>" + result[i].majorName + "</option>"
                    )
                }
            })
            $("#first_kind_id").change(function () {
                if ($("#first_kind_id").val() != 0) {
                    $.getJSON("/showConfigFileFirstKindByFirstId", "firstKindId=" + $("#first_kind_id").val(), function (result) {
                        $("#second_kind_id").html("");
                        $("#second_kind_id").append("<option value='0'>--请选择--</option>");
                        for (var i = 0; i < result.length; i++) {
                            $("#second_kind_id").append(
                                "<option value='" + result[i].secondKindId + "'>" + result[i].secondKindName + "</option>")
                        }
                    })
                }
            })
            $("#second_kind_id,#first_kind_id").change(function () {
                if ($("#second_kind_id").val() != 0 && $("#first_kind_id").val() != 0) {
                    $.getJSON("/showConfigFileThirdKindById",
                        "firstKindId=" + $("#first_kind_id").val() + "&secondKindId=" + $("#second_kind_id").val(),
                        function (result) {
                            $("#third_kind_id").html("");
                            $("#third_kind_id").append("<option value='0'>--请选择--</option>");
                            for (var i = 0; i < result.length; i++) {
                                $("#third_kind_id").append(
                                    "<option value='" + result[i].thirdKindId + "'>" + result[i].thirdKindName + "</option>")
                            }
                        });
                }
            })


            $("#human_major_kind_id").change(function () {
                if ($("#human_major_kind_id").val() != 0) {
                    $.getJSON("/showConfigMajorById", "kindId=" + $("#human_major_kind_id").val(), function (result) {
                        $("#human_major_id").html("");
                        $("#human_major_id").append("<option value='0'>--请选择--</option>");
                        for (var i = 0; i < result.length; i++) {
                            $("#human_major_id").append(
                                "<option value='" + result[i].majorId + "'>" + result[i].majorName + "</option>"
                            )
                        }
                    })
                }

            })


        })
    </script>

</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>员工管理</li>
    </ul>
</div>
<form id="searchForm" class="form-horizontal">
    <div class="alert alert-info" style="margin:0px; padding:3px;">
        <div class="row">
            <div class="col-sm-3">
                <span>请选择员工所在一级机构</span>
                <select class="form-control  input-sm" name="firstKindId" id="first_kind_id">
                    <option>姓名</option>
                    <option>性别</option>
                </select>
            </div>
            <div class="col-sm-3">
                <span>请选择员工所在二级机构</span>
                <select class="form-control  input-sm" name="secondKindId" id="second_kind_id">
                    <option>姓名</option>
                    <option>性别</option>
                </select>
            </div>
            <div class="col-sm-3">
                <span>请选择员工所在三级机构</span>
                <select class="form-control  input-sm" name="thirdKindId" id="third_kind_id">
                    <option>姓名</option>
                    <option>性别</option>
                </select>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <span>请选择职位分类</span>
                <select class="form-control  input-sm" name="humanMajorKindId" id="human_major_kind_id">
                    <option>姓名</option>
                    <option>性别</option>
                </select>
            </div>
            <div class="col-sm-3">
                <span>请选择职位名称</span>
                <select class="form-control  input-sm" name="humanMajorId" id="human_major_id">
                    <option>姓名</option>
                    <option>性别</option>
                </select>
            </div>
            <div class="col-sm-3"></div>
            <div class="col-sm-3"></div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <span>请输入建档日期</span>
                <input type="text" name="beginTime" id="begin_time"
                       class="form-control input-sm form-control form_date">
            </div>
            <div class="col-sm-3">
                <span>至</span>
                <input type="text" name="endTime" id="end_time"
                       class="form-control  input-sm form-control form_date">
            </div>
            <div class="col-sm-3">
                <input type="button" name="search" id="search" style="padding: 6px;float: right"
                       class="btn btn-danger col-sm-3" value="查询"/>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
    <input type="hidden" name="humanFileStatus" value="3">


</form>
<div class="row" style="padding:15px; padding-top:0px; ">
    <table class="table table-condensed table-striped">
        <%--<tr>
            <th>档案编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>一级机构</th>
            <th>二级机构</th>
            <th>三级机构</th>
            <th>职称</th>
            <th>复核</th>
        </tr>--%>

    </table>
</div>
<div class="row alert alert-info" style="margin:0px; padding:3px;">
    <form class="form-horizontal">
        <div id="paginator" style="text-align: center">
            <ul id="pageLimit"></ul>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/jquery/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="../../jquery/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('#begin_time ,#end_time').datetimepicker({
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

    function dele() {
        if (confirm("你真的确认要删除吗？请确认")) {
            return true;
        }
        else {
            return false;
        }
    }


    $("#search").click(function () {
        $.getJSON("/search", $('#searchForm').serialize() + "&page=1&rows=10", function (result) {
            alert("total:" + result.total);
            alert("CurrentPage:" + result.CurrentPage);
            alert("pageCount:" + result.pageCount);
            alert("rows:" + result.rows);
            tbody = "<tr>" + "<th>档案编号</th>" + "<th>姓名</th>" + "<th>性别</th>" + "<th>一级机构</th>" +
                "<th>二级机构</th>" + "<th>三级机构</th>" + "<th>职位分类</th>" + "<th>职位名称</th>" + "<th>操作</th>" + "</tr>";
            for (var i = 0; i < result.rows.length; i++) {
                var trs = "";
                trs = "<tr>" +
                    "<td><a href='/showHumanResource?hufId=" + result.rows[i].hufId + "&target=HumanResource/show_human_resource'>" + result.rows[i].humanId + "</a></td>" +
                    "<td>" + result.rows[i].humanName + "</td>" +
                    "<td>" + result.rows[i].humanSex + "</td>" +
                    "<td>" + result.rows[i].firstKindName + "</td>" +
                    "<td>" + result.rows[i].secondKindName + "</td>" +
                    "<td>" + result.rows[i].thirdKindName + "</td>" +
                    "<td>" + result.rows[i].humanMajorKindName + "</td>" +
                    "<td>" + result.rows[i].hunmaMajorName + "</td>" +
                    "<td><a href='/showHumanResource?hufId=" + result.rows[i].hufId + "&target=HumanResource/update_human_resource'>修改</a> " +
                    "<a href='/delete_human_resource?hufId=" + result.rows[i].hufId + "&target=update_human_resource' " +
                    "onclick = 'if(dele()==false)return false;'>删除</a></td>" +
                    "</td>" +
                    "</tr>";
                tbody += trs;
            }
            ;
            $(".table").html(tbody);
            var currentPage = result.CurrentPage; //当前页数
            var pageCount = result.pageCount; //总页数
            var options = {
                currentPage: currentPage,//当前的请求页面。
                totalPages: pageCount,//一共多少页。
                size: "normal",//应该是页眉的大小。
                bootstrapMajorVersion: 3,//bootstrap的版本要求。
                alignment: "right",
                numberOfPages: 10,//一页列出多少数据。
                shouldShowPage: true,//是否显示该按钮
                itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                },
                onPageClicked: function (event, originalEvent, type, page) {//点击事件，用于通过Ajax来刷新整个list列表
                    $.getJSON("/search", $('#searchForm').serialize() + "&page=" + page + "&rows=10", function (result) {
                        tbody = "<tr>" + "<th>档案编号</th>" + "<th>姓名</th>" + "<th>性别</th>" + "<th>一级机构</th>" +
                            "<th>二级机构</th>" + "<th>三级机构</th>" + "<th>职位分类</th>" + "<th>职位名称</th>" + "<th>操作</th>" + "</tr>";
                        for (var i = 0; i < result.rows.length; i++) {
                            var trs = "";
                            trs = "<tr>" +
                                "<td><a href='/showHumanResource?hufId=" + result.rows[i].hufId + "&target=HumanResource/show_human_resource'>" + result.rows[i].humanId + "</a></td>" +
                                "<td>" + result.rows[i].humanName + "</td>" +
                                "<td>" + result.rows[i].humanSex + "</td>" +
                                "<td>" + result.rows[i].firstKindName + "</td>" +
                                "<td>" + result.rows[i].secondKindName + "</td>" +
                                "<td>" + result.rows[i].thirdKindName + "</td>" +
                                "<td>" + result.rows[i].humanMajorKindName + "</td>" +
                                "<td>" + result.rows[i].hunmaMajorName + "</td>" +
                                "<td><a href='/showHumanResource?hufId=" + result.rows[i].hufId + "&target=HumanResource/update_human_resource'>修改</a> " +
                                "<a href='/delete_human_resource?hufId=" + result.rows[i].hufId + "&target=update_human_resource' " +
                                "onclick = 'if(dele()==false)return false;'>删除</a></td>" +
                                "</td>" +
                                "</tr>";
                            tbody += trs;

                        }
                        $(".table").html(tbody);
                    })
                }
            };
            $('#pageLimit').bootstrapPaginator(options);
        })

    })
</script>
</html>

