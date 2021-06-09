
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
    <script src="${pageContext.request.contextPath}/res/js/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
    <script>
        function publishBlog() {
            var articleName = $("#articleName").val();
            var articleContent=$("#articleContent").val();
            var params={
                articleName:articleName,
                articleContent:articleContent
            };

            $.ajax({
                type: "POST",
                url: "/myBlog/publishBlog",
                data: params,
                dataType:"json", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
                success: function(data){
                    var status = data.isSuccess;
                    if(status=="true"){

                        $("#optionInfo").text("发表成功");
                    }
                    else{
                        $("#optionInfo").text("发表失败，请稍后重试");
                        var failButton = $("#failButton").html();
                        if(failButton==""||failButton==null){
                            $("#buttons").append("<button id=\"failButton\" type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">继续尝试\n" +
                            "\t\t\t\t</button>");
                        }
                    }
                },
                error: function(date){
                    alert("date=" + date);
                    return false;
                }
            });
        }

    </script>

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

                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <input name="articleName" id="articleName" type="text" class="form-control" placeholder="文章标题">
                    </div>
                </div>
                <textarea name="articleContent" id="articleContent" class="form-control" rows="6" placeholder="告诉我们，你的故事吧！"></textarea>
                <button type="button" class="btn btn-default en-btn" data-toggle="modal" data-target="#myModal" onclick="publishBlog()">发表</button>
        </div>
    </div> <!-- end Left content col 8 -->

</div>

<!-- Works Section
================================================== -->




</div>

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">操作提示</h4>
            </div>
            <div id="optionInfo" class="modal-body"></div>
            <div id="buttons" class="modal-footer">
                <a href="/myBlog/" type="button" class="btn btn-primary">确定</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
