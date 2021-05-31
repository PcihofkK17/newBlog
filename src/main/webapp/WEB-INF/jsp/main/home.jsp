
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
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
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
                url: "/home/loadMoreBlogArticleList",
                data: params,
                dataType:"html", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
                success: function(date){
                    var articleList = $(date).find("#articleList");
                    var articleCol =  articleList.find("#articleCol").html();
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
<jsp:include   page="nav.jsp" flush="true"/>




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
                                <li><a href="/home/loadBlogArticle?articleID=${blogArticle.articleID}">阅读</a></li> <!-- read more link -->
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


</body>
</html>
