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
    <style type="text/css">
        input,span{
            margin: 5px;
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
        <li><a href="#">薪酬管理</a></li>
        <li>薪酬发放查询</li>
    </ul>
</div>
<form id="searchForm" class="form-horizontal">
    <div class="alert alert-info" style="margin:0px; padding:3px;">
        <div class="row">
            <div class="col-sm-2">
                <span>请输入薪酬单号</span>
            </div>
            <div class="col-sm-5">
                <input class="form-control  input-sm" name="salaryGrantId" id="salaryGrantId"/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <span>请输入关键字</span>
            </div>
            <div class="col-sm-5">
                <input class="form-control  input-sm" name="keyword" id="keyword"/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <span>请输入发放时间</span>
            </div>
            <div class="col-sm-2">
                <input type="text" name="beginTime" id="begin_time" style="display: block"
                       class="form-control input-sm form-control form_date"/>
            </div>

            <div class="col-sm-2">
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
<div id="table" class="row" style="padding:15px; padding-top:0px; ">

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
        $.getJSON("/searchSalaryGrant", $('#searchForm').serialize() + "&page=1&rows=10", function (result) {
          /*  alert("total:" + result.total);
            alert("CurrentPage:" + result.CurrentPage);
            alert("pageCount:" + result.pageCount);
            alert("rows:" + result.rows);*/
            tbody = "<tr>" + "<th>序号</th>" + "<th>薪酬单号</th>" + "<th>一级机构</th>" + "<th>二级机构</th>" + "<th>人数</th>" +
                "<th>实发薪酬总额(元)</th>" + "<th>发放日期</th>" + "<th>查看详情</th>" + "</tr>";
            for (var i = 0; i < result.rows.length; i++) {
                var trs = "";
                trs = "<tr>" +
                    "<td>" + (i + 1) + "</td>" +
                    "<td>" + result.rows[i].salaryGrantId + "</td>" +
                    "<td>" + result.rows[i].firstKindName + "</td>" +
                    "<td>" + result.rows[i].secondKindName + "</td>" +
                    "<td>" + result.rows[i].humanAmount + "</td>" +
                    "<td>" + result.rows[i].salaryPaidSum + "</td>" +
                    "<td>" + result.rows[i].checkTime + "</td>" +
                    "<td><a href='/showSalaryGrantDetailsBySalaryGrantId?salaryGrantId=" +
                    result.rows[i].salaryGrantId + "&target=select_salary_grand_details'>查看详情</a>" +
                    "</td>" +
                    "</tr>";
                tbody += trs;
            }
            ;
            $("#table").html("<table class=\"table table-condensed table-striped\">" +
                tbody + "</table>");
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
                    $.getJSON("/searchSalaryGrant", $('#searchForm').serialize() + "&page=" + page + "&rows=10", function (result) {
                        tbody = "<tr>" + "<th>序号</th>" + "<th>薪酬单号</th>" + "<th>一级机构</th>" + "<th>二级机构</th>" + "<th>人数</th>" +
                            "<th>实发薪酬总额(元)</th>" + "<th>发放日期</th>" + "<th>查看详情</th>" + "</tr>";
                        for (var i = 0; i < result.rows.length; i++) {
                            var trs = "";
                            trs = "<tr>" +
                                "<td>" + (i + 1) + "</td>" +
                                "<td>" + result.rows[i].salaryGrantId + "</td>" +
                                "<td>" + result.rows[i].firstKindName + "</td>" +
                                "<td>" + result.rows[i].secondKindName + "</td>" +
                                "<td>" + result.rows[i].humanAmount + "</td>" +
                                "<td>" + result.rows[i].salaryPaidSum + "</td>" +
                                "<td>" + result.rows[i].checkTime + "</td>" +
                                "<td><a href='/showSalaryGrantDetailsBySalaryGrantId?salaryGrantId=" +
                                result.rows[i].salaryGrantId + "&target=select_salary_grand_details'>查看详情</a>" +
                                "</td>" +
                                "</tr>";
                            tbody += trs;
                        }
                        ;
                        $("#table").html("<table class=\"table table-condensed table-striped\">" +
                            tbody + "</table>");
                    })
                }
            };
            $('#pageLimit').bootstrapPaginator(options);
        })

    })
</script>
</html>

