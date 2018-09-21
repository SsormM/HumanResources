<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/9/2
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>简洁的Material Design风格用户登录界面设计</title>
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <!--[if IE]>
   <!-- <script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>-->
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        $(function () {
            if ($("#mess").val()!=0){
                alert($("#mess").val())
            }


        })
    </script>
</head>
<body>
<input type="hidden" id="mess" value="${mess}">
<article class="htmleaf-container">
    <header class="htmleaf-header">
        <h1>人力资源管理后台 <span>Human Resources Backstage</span></h1>
        <div class="htmleaf-links">

        </div>
    </header>
    <form action="/login" method="post" class="panel-lite">
        <div class="thumbur">
            <div class="icon-lock"></div>
        </div>
        <h4>用户登录</h4>
        <div class="form-group">
            <input required="required" class="form-control" name="uName" id="uName"/>
            <label class="form-label">用户名    </label>
        </div>
        <div class="form-group">
            <input type="password" required="required" class="form-control" name="uPassword" id="uPassword"/>
            <label class="form-label">密　码</label>
        </div><a href="#">忘记密码 ?  </a>
        <button type="submit" class="floating-btn"><i class="icon-arrow"></i></button>
    </form>

</article>

</body>
</html>
