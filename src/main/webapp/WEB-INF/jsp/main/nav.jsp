<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/res/img/logo.png" alt="..."></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="home.html" class="scroll">主页</a></li>
                <li><a href="Blog Column.html" class="scroll">博客专栏 </a></li>
                <li><a href="#tf-works" class="scroll">我的博客</a></li>
                <li><a href="#tf-process" class="scroll">排行榜</a></li>
                <li><a href="#tf-pricing"></a></li>
                <li><a href="#tf-blog"></a></li>
                <c:choose>
                    <c:when test="${currUser!=null}">
                        <li><a href="" style="padding: auto;margin: auto"><img src="${pageContext.request.contextPath}/res/img/loginImg/avtar.png" height="40" width="40" class="img-circle img-responsive  center-block" /></a></li>
                    </c:when>
                    <c:otherwise>
                        <li id="currUser"><a href="/home/toLoginPage" class="scroll">登录</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
    <div id="alertInfo" class="alert alert-success navbar-fixed-top" style="display: none">
    </div>
</nav>




