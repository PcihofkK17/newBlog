
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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



    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/responsive.css">
    <script src="${pageContext.request.contextPath}/res/js/jquery-1.11.2.min.js"></script>
    <script>
        function checkPassword() {
            var password = $("#password").val();
            var repeat = $("#repeat").val();
            if(password==repeat && password!=""){
                $("#repeat").css("border","1px solid #ccc");
                $("#waring").text("");
                $("#subBtu").attr("disabled",false);
            }
            else if(repeat!=""){
                $("#repeat").css("border","1px solid #f00");
                $("#waring").text("两次输入密码不同！");
                $("#subBtu").attr("disabled",true);
            }
        }
        
    </script>

</head>
<body>

<!-- Main Navigation
================================================== -->
<jsp:include   page="../nav.jsp" flush="true"/>

<!-- Page Header
================================================== -->
<div id="tf-header">
    <div class="container"> <!-- container -->
        <h1>用户注册</h1>

    </div><!-- end container -->
</div>

<!-- Contact Section
================================================== -->
<div id="tf-contact" class="contact">

    <div class="container"> <!-- container -->


        <div class="row text-center"> <!-- contact form outer row with centered text-->

            <div class="col-md-5 col-md-offset-1">
                <form action="/user/doRegister" method="post"  id="contact-form" class="form" name="sentMessage" novalidate> <!-- form wrapper -->
                    <div class="form-group"> <!-- Your name input -->
                        <input type="text" autocomplete="off" class="form-control" placeholder="请输入您的账号" id="loginName" name="loginName">
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="form-group"> <!-- Your email input -->
                        <input type="password" autocomplete="off" class="form-control" placeholder="请输入您的密码" id="password" name="password" onkeyup="checkPassword()">
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="form-group"> <!-- Your email input -->
                        <input type="password" autocomplete="off" class="form-control" placeholder="重复您的密码" id="repeat" name="repeat"  onkeyup="checkPassword()">
                        <span id="waring" class="help-block text-danger" style="color:#f00"></span>
                    </div>

                    <button type="submit" id="subBtu" class="btn btn-primary tf-btn color" disabled="true" >注册</button> <!-- Send button -->

                </form>
            </div>

        </div> <!-- end contact form outer row with centered text-->



    </div><!-- end container -->

</div>

<!-- Footer
================================================== -->
<div id="tf-footer">
    <div class="container"><!-- container -->
        <p class="pull-left">Power by so </p> <!-- copyright text here-->

    </div><!-- end container -->
</div>


</body>
</html>
