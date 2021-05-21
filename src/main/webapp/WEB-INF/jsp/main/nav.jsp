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
                <li><a href="/home/toLoginPage" class="scroll">登录</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
