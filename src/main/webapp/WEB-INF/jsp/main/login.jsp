
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link href="${pageContext.request.contextPath}/res/css/LoginStyle.css" rel='stylesheet' type='text/css' />
    <!--webfonts-->

</head>
<body>

<!--SIGN UP-->
<h1>没有账号？<a href="/user/goRegister">注册一个吧！</a></h1>
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
    <form action="">
        <input type="text" class="text" value="账号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '账号';}" >
        <div class="key">
            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
        </div>
    </form>
    <div class="signin">
        <input type="submit" value="登录" >
    </div>
</div>
<div class="copy-rights">
    <p></p>
</div>

</body>
</html>
