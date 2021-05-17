
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>





    <link rel="shortcut icon" href="${pageContext.request.contextPath}/res/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/res/img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/res/img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/res/img/apple-touch-icon-114x114.png">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/nivo-lightbox.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/nivo_lightbox_themes/default/default.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/res/css/style.css">

    <script src="${pageContext.request.contextPath}/res/js/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
    <script>
        var onPageNum;
        $(function(){
            onPageNum  =  ${pageNum};
        });

        function loadArticle() {
            //页码加1

            onPageNum=onPageNum+1;
            var params = {
                pageNum : onPageNum
            };
            $.ajax({
                type: "POST",
                url: "/home/                                         ",
                data: params,
                dataType:"html", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
                success: function(date){
                 //   var obj = JSON.parse(json);  //使用这个方法解析json
                  //  var state_value = obj.model;  //result是和action中定义的result变量的get方法对应的
                 //   var array = eval(state_value);
                    // alert(obj);
                    var articleList = $(date).find("#articleList");
                    var articleCol =  articleList.find("#articleCol").html();
                    alert(articleCol);
                    if(articleCol!=null){
                        $("#page").append(articleList).html() ;
                    }
                    else{
                        $("#loadArticleBut").text("没有更多文章了！");
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
                <li><a href="#tf-contact" class="scroll" data-toggle="modal" data-target="#myModal">登录</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>




<!--  Blog Section
================================================== -->
<div id="tf-blog">
    <div id="dayRecommend" class="container"> <!-- container -->
        <div class="section-header">
            <h2><span class="highlight"><strong>每日推荐</strong></span></h2>
            <h5><em><a href="">近期阅读量最多的博客近期阅读量最多的博客近期阅读量最多的博客近期阅读量最多的博客近期阅读量最多的博客</a></em></h5>
        </div>
    </div>

    <div id="blog-post" class="gray-bg"> <!-- fullwidth gray background -->
        <div class="container"><!-- container -->

            <div class="row jq22" id="page"> <!-- row -->
                <div id="articleList">
                <c:forEach var="blogArticle" items="${blogArticleDTOList}" varStatus="vs">
                <div class="col-md-6" id="articleCol"> <!-- Left content col 6 -->

                    <div class="post-wrap"> <!-- Post Wrapper -->
                        <div class="media post"> <!-- post wrap -->
                            <div class="media-left">
                                <a href="#"> <!-- link to your post single page -->
                                    <img class="media-object" src="http://placehold.it/120x150" alt="..."> <!-- Your Post Image -->
                                </a>
                            </div>
                            <div class="media-body">
                                <p class="small">${blogArticle.genTime}</p>

                                <a href="/home/loadBlogArticle?articleID=${blogArticle.articleID}">

                                <h5 class="media-heading"><strong>${blogArticle.articleName}</strong></h5>

                                </a>
                                <p>${blogArticle.articleContent}</p>

                            </div>
                        </div><!-- end post wrap -->

                        <div class="post-meta"> <!-- Meta details -->
                            <ul class="list-inline metas pull-left"> <!-- post metas -->
                                <li><a href="#">${blogArticle.userName}</a></li> <!-- meta author -->
                                <li><a href="#">${blogArticle.commentNum}条评论</a></li> <!-- meta comments -->
                                <li><a href="#">Read More</a></li> <!-- read more link -->
                            </ul>
                            <ul class="list-inline meta-detail pull-right"> <!-- user meta interaction -->
                                <li><a href=""><i class="fa fa-heart"></i></a>${blogArticle.likeNum}</li> <!-- like button -->
                                <li><i class="fa fa-eye"></i> ${blogArticle.readNum}</li> <!-- no. of views -->
                            </ul>
                        </div><!-- end Meta details -->
                    </div><!-- end Post Wrapper -->





                </div> <!-- end Left content col 6 -->
                </c:forEach>

</div>
            </div><!-- end row -->

            <div class="text-center">
                <button  id="loadArticleBut" class="btn btn-primary tf-btn color" onclick="loadArticle()" >加载更多</button>
            </div>
        </div><!-- end container -->
    </div> <!-- end fullwidth gray background -->
</div>



<!-- Footer
================================================== -->

<div id="tf-footer">
    <div class="container"><!-- container -->
        <p class="pull-left">© 2015 ethanol. All rights reserved. Theme by Rudhi Sasmito.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p> <!-- copyright text here-->
        <ul class="list-inline social pull-right">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li> <!-- Change # With your FB Link -->
            <li><a href="#"><i class="fa fa-twitter"></i></a></li> <!-- Change # With your Twitter Link -->
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li> <!-- Change # With your Google Plus Link -->
            <li><a href="#"><i class="fa fa-dribbble"></i></a></li> <!-- Change # With your Dribbble Link -->
            <li><a href="#"><i class="fa fa-behance"></i></a></li> <!-- Change # With your Behance Link -->
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li> <!-- Change # With your LinkedIn Link -->
            <li><a href="#"><i class="fa fa-youtube"></i></a></li> <!-- Change # With your Youtube Link -->
            <li><a href="#"><i class="fa fa-pinterest"></i></a></li> <!-- Change # With your Pinterest Link -->
        </ul>
    </div><!-- end container -->
</div>



<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog" style=" margin: 200px auto; ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    账号登录
                </h4>
            </div>

            <form action="/user/login" method="post">
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon">账号</span>
                        <input type="text" class="form-control" id="loginName" name="loginName" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">密码</span>
                        <input type="password" class="form-control" id="password" name="password" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default" >登录
                    </button>
                    <a  class="btn btn-default" style="    color: #ffffff;     background: #FFCC33;">注册
                    </a>
                </div>
            </form>
        </div><!-- /.modal-content -->
        </div>
    </div><!-- /.modal -->
</div>








</body>
</html>
