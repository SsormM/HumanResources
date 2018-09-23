<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/21
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>

<body>
<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style="  margin:0px; ">
        <li><a href="#">系统管理</a></li>
        <li>员工管理</li>
        <li>查看员工信息</li>
    </ul>
</div>

<form action="" class="form-horizontal">
    <div class="row">
        <div class="col-sm-5 col-sm-offset-4">
            <a href="/staffinfo_show?staffId=${staff.staffId}&target=staffInfo_update" class="btn btn-success">修改</a>
            <a href="/staff_delete?staffId=${staff.staffId}" class="btn  btn-danger"
               onclick="if(dele()==false)return false; ">删除</a>
            <input type="reset" class="btn btn-warning" value="返回上一级" onclick="location.href='/staffinfo_list?target=staffinfo/staffInfo_list'"/>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffId}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">姓名</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffName}</p>
                </div>
            </div>
        </div>

    </div>
    <!-- 开始2 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">年龄</label>
                <div class="col-sm-5">
                    <p class="form-control-static">${requestScope.staff.staffAge}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">性别</label>
                <div class="col-sm-4">
                    <p class="form-control-static">${requestScope.staff.staffSex}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束2 -->
    <!-- 开始3 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">籍贯</label>
                <div class="col-sm-6">
                    <p class="form-control-static">${requestScope.staff.staffNativePlace}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">身份证</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffIdcard}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束3 -->
    <!-- 开始4 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">出生日期</label>
                <div class="col-sm-9">
                    <p class="form-control-static"><fmt:formatDate value="${requestScope.staff.staffBirthday}"
                                                                   pattern="yyyy-MM-dd"/></p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">办公电话</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffOfficePhone}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束4 -->
    <!-- 开始4 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">电子邮件</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffEmail}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">移动电话</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffMobilePhone}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束4 -->
    <!-- 开始5 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">家庭住址</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffAddr}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">QQ</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.staffQQ}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束5 -->
    <!-- 开始6 -->
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">入职时间</label>
                <div class="col-sm-9">
                    <p class="form-control-static"><fmt:formatDate value="${requestScope.staff.staffEntryTime}"
                                                                   pattern="yyyy-MM-dd HH:mm-ss"/></p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">教育水平</label>
                <div class="col-sm-6">
                    <p class="form-control-static">${requestScope.staff.staffEductionLevel}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- 结束6 -->
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">备注信息</h5>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <label class="col-sm-3 control-label">备注</label>
                <div class="col-sm-9">
                    <p class="form-control-static">
                        ${requestScope.staff.staffRemark}</p>
                </div>
            </div>

        </div>

    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">账号信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">账号</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.userNumber}</p>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                    <p class="form-control-static">${requestScope.staff.userPassword}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5 col-sm-offset-4">
            <a href="/staffinfo_show?staffId=${staff.staffId}&target=staffInfo_update" class="btn btn-success">修改</a>
            <a href="/staff_delete?staffId=${staff.staffId}" class="btn  btn-danger"
               onclick="if(dele()==false)return false;">删除</a>
            <input type="reset" class="btn btn-warning" value="返回上一级" onclick="location.href='/staffinfo_list?target=staffinfo/staffInfo_list'"/>
        </div>
        <script>
            function dele() {
                if (confirm("你真的确认要修改吗？请确认")) {
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>
    </div>
</form>

</body>


</html>
