<%--
  Created by IntelliJ IDEA.
  User: youzhengjie666
  Date: 2020/12/19
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<html class="x-admin-sm">
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<!-- <link rel="stylesheet" href="./css/theme5.css"> -->
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<head>
    <title>DeptList</title>
</head>
<style>
    ul li a{
        text-decoration: none;
    }

    .left-nav{
        margin-top: 20px;
    }
    #tb{
        width: 1400px;
        height: 420px;
        float: left;
        margin-left: 200px;
        /*background-color: red;*/
    }
    .left-nav{
        width: 200px;
        height: 650px;
        position: absolute;
        /*background-color: #00F7DE;*/
    }

    #touxiang{
        border-radius: 50%;

    }

</style>


<body>


<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/toList">xx人力管理系统</a>
        </div>


        <ul class="nav navbar-nav navbar-right">
            <li><img id="touxiang" src="${pageContext.request.contextPath}/imgServlet"></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user} <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a data-toggle="modal" data-target="#myModal3" >个人中心</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->

</nav>




<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/adminList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/showDept">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite></a>
                    </li>
                    <li>

                        <a href="${pageContext.request.contextPath}/toEmpList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工管理</cite></a>
                    </li>



                    <%--                     签到  开始--%>

                    <li>
                        <a href="${pageContext.request.contextPath}/toPublishList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>发布签到</cite></a>
                    </li>
                    <%--                      签到   结束    --%>




                    <li>
                        <a href=" ${pageContext.request.contextPath}/toLogList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>日志操作</cite></a>
                    </li>
                </ul>


            </li>

            <%--          公司考勤开始   --%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="公司考勤">&#xe726;</i>
                    <cite>公司考勤</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/toSignList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>我的签到</cite></a>
                    </li>
                </ul>


            </li>
            <%--    公司考勤结束--%>

        </ul>

    </div>
</div>
<!-- 左侧菜单结束 -->


<div id="tb">
<%--    <!-- 按钮触发模态框 -->--%>
<%--    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新增部门</button>--%>

    <table  class="table table-hover">
        <tr>
            <td>签到编号</td>
<%--            <td>员工编号</td>--%>
            <td>结束时间</td>
            <td>操作(签到)</td>
        </tr>
        <c:forEach items="${signs}" var="sign">
            <tr>
                <td>${sign.sid}</td>
                <td>${sign.endTime}</td>
                <td>
                    <c:if test="${sign.flag==0}">
                        <a href="${pageContext.request.contextPath}/sign/${sign.sid}" class="btn btn-primary btn-sm">签到</a>
                    </c:if>
                    <c:if test="${sign.flag==1}">
                        <a href="#" class="btn btn-success btn-sm">已签到</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>








</body>
</html>
