
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/fonts/font-awesome/css/font-awesome.css">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/responsive.css">

</head>
<body>

<!-- Main Navigation
================================================== -->
<jsp:include   page="../nav.jsp" flush="true"/>


<!-- Why Us/Features Section
================================================== -->
<div id="tf-features">
    <div class="section-header">
        <h2>XXX的<span class="highlight"><strong>博客</strong></span></h2>
        <h5><em>你这家伙太懒了，什么都没有留下</em></h5>
        <div class="fancy"><span> <img src="${pageContext.request.contextPath}/res/img/loginImg/avtar.png" class="img-responsive" alt="Image"></span></div>
    </div>

    <div class="col-md-6 col-md-offset-3"> <!-- Left Blogrol col 8 -->
        <div class="comment">
            <h4 class="text-uppercase"></h4>
            <form action="/myBlog/publishBlog" method="post" id="contact-form" class="form">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <input name="articleName" id="articleName" type="text" class="form-control" placeholder="文章标题">
                    </div>
                </div>
                <textarea name="articleContent" id="articleContent" class="form-control" rows="6" placeholder="告诉我们，你的故事吧！"></textarea>
                <button type="submit" class="btn btn-default en-btn">发表</button>
            </form>
        </div>
    </div> <!-- end Left content col 8 -->

</div>

<!-- Works Section
================================================== -->




</div>

</div>



</body>
</html>
