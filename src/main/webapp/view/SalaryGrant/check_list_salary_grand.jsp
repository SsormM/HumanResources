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
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/bootstrap-3.3.7-dist/css/bootstrap.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="/jquery/jquery-3.3.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="/jquery/bootstrap-paginator.min.js"></script>
    <script type="text/javascript">
        var humanTotal = 0;
        var salaryTotal = 0;
        $(function () {

            $.getJSON("/showCheckListSalaryGrant", "page=1&rows=10", function (result) {
                alert("total:" + result.total);
                alert("CurrentPage:" + result.CurrentPage);
                alert("pageCount:" + result.pageCount);
                alert("rows:" + result.rows);

                tbody = "<tr>" + "<th>序号</th>" + "<th>一级机构</th>" + "<th>二级机构</th>" + "<th>人数</th>" +
                    "<th>基本薪酬总额(元)</th>" + "<th>复核</th>" + "</tr>";
                for (var i = 0; i < result.rows.length; i++) {
                    var trs = "";
                    trs = "<tr>" +
                        "<td>" + (i + 1) + "</td>" +
                        "<td>" + result.rows[i].firstKindName + "</td>" +
                        "<td>" + result.rows[i].secondKindName + "</td>" +
                        "<td>" + result.rows[i].humanAmount + "</td>" +
                        "<td>" + result.rows[i].salaryPaidSum + "</td>" +
                        "<td><a href='/showSalaryGrantDetailsBySalaryGrantId?salaryGrantId=" +
                        result.rows[i].salaryGantId + "&target=check_list_salary_grand_details'>查看</a>" +
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
                        $.getJSON("/showCheckListSalaryGrant", "page=" + page + "&rows=10", function (result) {
                            tbody = "<tr>" + "<th>序号</th>" + "<th>一级机构</th>" + "<th>二级机构</th>" + "<th>人数</th>" +
                                "<th>基本薪酬总额(元)</th>" + "<th>复核</th>" + "</tr>";
                            for (var i = 0; i < result.rows.length; i++) {
                                var trs = "";
                                trs = "<tr>" +
                                    "<td>" + (i + 1) + "</td>" +
                                    "<td>" + result.rows[i].firstKindName + "</td>" +
                                    "<td>" + result.rows[i].secondKindName + "</td>" +
                                    "<td>" + result.rows[i].humanAmount + "</td>" +
                                    "<td>" + result.rows[i].salaryPaidSum + "</td>" +
                                    "<td><a href='/showSalaryGrantDetailsBySalaryGrantId?salaryGrantId=" +
                                    result.rows[i].salaryGantId + "&target=check_list_salary_grand_details'>查看</a>" +
                                    "</td>" +
                                    "</tr>";
                                tbody += trs;
                            }
                            ;
                            $(".table").html(tbody);
                        })
                    }
                };
                $('#pageLimit').bootstrapPaginator(options);

            })

        })
    </script>

</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">薪酬管理</a></li>
        <li>薪酬发放复核</li>
    </ul>
</div>
<div class="row" style="padding:15px; padding-top:0px; ">
    <table class="table table-condensed table-striped">
    </table>
    <div id="paginator" style="text-align: center">
        <ul id="pageLimit"></ul>
    </div>
</div>


</body>


</html>

