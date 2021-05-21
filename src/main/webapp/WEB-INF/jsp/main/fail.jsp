<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/res/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/res/img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/res/img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/res/img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/fonts/font-awesome/css/font-awesome.css">

    <!-- Nivo Lightbox
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/nivo-lightbox.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/nivo_lightbox_themes/default/default.css">

    <!-- Slider
    ================================================== -->
    <link href="${pageContext.request.contextPath}/res/css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/res/css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/responsive.css">

</head>
<body>

<!-- Main Navigation
================================================== -->
<jsp:include   page="nav.jsp" flush="true"/>

<!-- Page Header
================================================== -->
<div id="tf-header">
    <div class="container"> <!-- container -->
        <h1>FAIL PAGE</h1>

    </div><!-- end container -->
</div>

<!-- Contact Section
================================================== -->
<div id="tf-contact" class="contact">

    <div class="container"> <!-- container -->
        <div class="section-header">
            <h2>${hint}<span class="highlight"><strong><a href="">点击重试</a></strong></span></h2>
            <h5><em>${wrongInfo}</em></h5>
            <div class="fancy"><span><img src="${pageContext.request.contextPath}/res/img/favicon.ico" alt="..."></span></div>
        </div>

    </div><!-- end container -->

</div>

</body>
</html>