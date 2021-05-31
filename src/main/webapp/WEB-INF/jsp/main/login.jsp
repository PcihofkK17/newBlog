
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link href="${pageContext.request.contextPath}/res/css/LoginStyle.css" rel='stylesheet' type='text/css' />

    <script src="${pageContext.request.contextPath}/res/js/jquery-1.11.2.min.js"></script>

    <script>
        $(function(){
            var hasCount = "${hasCount}";
            if(hasCount!=""&&hasCount!=null){
                $("#hasCount").empty();
                $("#hasCount").text("账号注册成功，现在登录吧！")
            }
        });
    </script>
</head>
<body>

<!--SIGN UP-->
<h1 id="hasCount">没有账号？<a href="/user/goRegister">注册一个吧！</a></h1>
<div class="login-form">
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar">
        <img src="${pageContext.request.contextPath}/res/img/loginImg/avtar.png" />
    </div>
    <form action="/user/login" method="post">
        <span style="color: #c7254e">${wrongInfo}</span>
        <input type="text" id="loginName" name="loginName" class="text" value="账号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '账号';}" >
        <div class="key">
            <input type="password" id="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
        </div>
        <div class="signin">
            <input type="submit" value="登录" >
        </div>
    </form>

</div>
<div class="copy-rights">
    <p></p>
</div>

</body>
</html>
