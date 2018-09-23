<%--
  Created by IntelliJ IDEA.
  User: SM
  Date: 2018/8/21
  Time: 10:33
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
        <li>修改员工</li>
    </ul>
</div>

<form action="/staffinfo_update" class="form-horizontal">
    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input type="submit" class="btn btn-success" value="保存"/>
            <input type="reset" class="btn  btn-danger" value="取消" onclick="location.href='/staffinfo_list?target=staffinfo/staffInfo_list'"/>
        </div>
    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                    <input type="text" value="${requestScope.staff.staffId}" name="staffId"
                           class="form-control input-sm"
                           placeholder="请输入编号"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">姓名</label>
                <div class="col-sm-9">
                    <input type="text" value="${requestScope.staff.staffName}" name="staffName"
                           class="form-control input-sm"
                           placeholder="请输入姓名"/>
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
                    <input type="text" value="${requestScope.staff.staffAge}" name="staffAge"
                           class="form-control input-sm"
                           placeholder="请输入年龄"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">${requestScope.staff.staffSex}性别</label>
                <div class="col-sm-4">
                    <select class="form-control input-sm" name="staffSex">
                        <option <c:if test="${requestScope.staff.staffSex=='保密'}">selected="selected"</c:if>>保密</option>
                        <option <c:if test="${requestScope.staff.staffSex=='男'}">selected="selected"</c:if>>男</option>
                        <option <c:if test="${requestScope.staff.staffSex=='女'}">selected="selected"</c:if>>女</option>
                    </select>
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
                    <input type="text" name="staffNativePlace" value="${requestScope.staff.staffNativePlace}"
                           class="form-control input-sm"
                           placeholder="请输入籍贯"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">身份证</label>
                <div class="col-sm-9">
                    <input type="text" name="staffIdcard" value="${requestScope.staff.staffIdcard}"
                           class="form-control input-sm"
                           placeholder="请输入身份证号码"/>
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
                    <input type="text" name="staffBirthday"
                           value="<fmt:formatDate value='${requestScope.staff.staffBirthday}' pattern='yyyy-MM-dd' />"
                           class="form-control input-sm" placeholder="请输入出生日期"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">办公电话</label>
                <div class="col-sm-9">
                    <input type="text" name="staffOfficePhone" value="${requestScope.staff.staffOfficePhone}"
                           class="form-control input-sm"
                           placeholder="请输入办公电话"/>
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
                    <input type="text" name="staffEmail" value="${requestScope.staff.staffEmail}"
                           class="form-control input-sm"
                           placeholder="请输入电子邮件"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">移动电话</label>
                <div class="col-sm-9">
                    <input type="text" name="staffMobilePhone" value="${requestScope.staff.staffMobilePhone}"
                           class="form-control input-sm" placeholder="请输入移动电话"/>
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
                    <input type="text" name="staffAddr" value="${requestScope.staff.staffAddr}"
                           class="form-control input-sm"
                           placeholder="请输入家庭住址 "/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">QQ</label>
                <div class="col-sm-9">
                    <input type="text" name="staffQQ" value="${requestScope.staff.staffQQ}"
                           class="form-control input-sm"
                           placeholder="请输入QQ"/>
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
                    <input type="text" name="staffEntryTime"
                           value="<fmt:formatDate value='${requestScope.staff.staffEntryTime}' pattern='yyyy-MM-dd HH:mm:ss' />"
                           class="form-control input-sm"
                           placeholder="请输入入职时间 "/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">教育水平</label>
                <div class="col-sm-6">
                    <select class="form-control input-sm" name="staffEductionLevel">
                        <option <c:if test="${requestScope.staff.staffEductionLevel=='保密'}">selected="selected"</c:if>>保密</option>
                        <option <c:if test="${requestScope.staff.staffEductionLevel=='博士'}">selected="selected"</c:if>>博士</option>
                        <option <c:if test="${requestScope.staff.staffEductionLevel=='硕士'}">selected="selected"</c:if>>硕士</option>
                        <option <c:if test="${requestScope.staff.staffEductionLevel=='本科'}">selected="selected"</c:if>>本科</option>
                    </select>
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
                	<textarea class="form-control" name="staffRemark">
                        ${requestScope.staff.staffRemark}
                    </textarea>
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
                    <input type="text" name="userNumber" class="form-control input-sm" placeholder="请输入账号 "
                           value="${requestScope.staff.userNumber}"/>
                </div>
            </div>

        </div>
        <div class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                    <input type="password" name="userPassword" class="form-control input-sm"
                           value="${requestScope.staff.userPassword}"
                           placeholder="请输入密码"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3 col-sm-offset-4">
            <input type="submit" class="btn btn-success" value="保存"/>
            <input type="reset" class="btn  btn-danger" value="取消" onclick="location.href='/staffinfo_list?target=staffinfo/staffInfo_list'"/>
        </div>
    </div>
</form>

</body>
</html>
