<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/23
  Time: 10:32
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
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="../../../js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../../css/dtree.css">
    <script src="../../../js/dtree.js"></script>
    <script type="text/javascript">
        $(function () {
            if ($("#mess").val()!=0){
                alert($("#mess").val());
            }
        })
    </script>
</head>

<body>
<input type="hidden" value="${requestScope.mess}" id="mess">
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>权限管理</li>
    </ul>
</div>
<div class="row">
    <div id="anthrotyList" class="col-sm-2" style=" padding-left:30px;">
        <script type="text/javascript">

            $.post("/anthorty_showList", "", function (result) {
                d = new dTree('d');
                d.add(1,-1,'根目录');
                if (result != null) {
                    for (var i = 0; i < result.length; i++) {
                        var data = result[i];
                        var url = "/anthorty_show?anthortyId=" + data.anthortyId+"&target=anthorty_show";
                        if (data.anthortyPid == 1) {
                            url = "";
                        }
                        d.add(data.anthortyId, data.anthortyPid, data.anthortyName, url, data.anthortyDesc, 'mainiframe');
                    }
                    document.getElementById("anthrotyList").innerHTML=d;
                }
            }, "json")
        </script>
        <%--<script type="text/jscript">


        	 d = new dTree('d');
			d.add(0,-1,'根目录');
            d.add(1,0,'系统管理','','提示','');
			d.add(2,1,'员工管理','anthorty_show.html','提示','mainiframe');
			d.add(3,1,'角色管理','anthorty_add.html','提示','mainiframe');
			d.add(4,1,'角色变更','anthorty_add.html','提示','mainiframe');
			d.add(5,0,'招生管理','','提示','mainiframe');
			d.add(6,5,'学生线索','anthorty_add.html','提示','mainiframe');
			document.write(d);
        </script>--%>
    </div>
    <div class="col-sm-10">
        <iframe id="mainframe" name="mainiframe" style="width:100%; border:0px; "></iframe>
        <script type="text/javascript">
            var height = jQuery(window).height() - 50;
            jQuery("#mainframe").attr("height", height + "px");
            jQuery("#mainframe").attr("src", "view/system/anthorty/anthorty_add.jsp");
        </script>

    </div>

</div>


</body>
</html>

