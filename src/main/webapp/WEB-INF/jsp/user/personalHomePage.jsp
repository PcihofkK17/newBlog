<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        var onPageNum;
        $(function(){
            onPageNum  =  1;
            var isSuccess= "${isSuccess}";
            if(isSuccess=="true"){
                $("#alertInfo").show();
                $("#alertInfo").text("删除成功");
                setTimeout(function(){$("#alertInfo").hide();},2000);
            }
            else if(isSuccess=="false"){
                $("#alertWrong").show();
                $("#alertWrong").text("删除失败");
                setTimeout(function(){$("#alertInfo").hide();},2000);
            }
            <% request.getSession().removeAttribute("isSuccess");%>
        });
        function deleteArticle(articleID) {
            $('#myModal').modal();
            $("#articleID").val(articleID);
        }

        function page(goPage) {
            if(goPage=="next"){
                onPageNum = onPageNum+1;
            }
            else if(goPage=="prev"){
                if(onPageNum<=1) return ;
                else onPageNum = onPageNum-1;
            }
            var params = {
                pageNum : onPageNum
            };

            $.ajax({
                type: "POST",
                url: "/myBlog/goPage",
                data: params,
                dataType:"html", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
                success: function(data){
                    var blogArticleDTOList = $(data).find("#blogArticleDTOList");

                    if(blogArticleDTOList.html()!=null){
                        $("#blogArticles").empty();
                        $("#blogArticles").append(blogArticleDTOList).html();
                    }
                    else{
                        onPageNum=onPageNum-1;
                    }
                },
                error: function(data){
                    alert("服务器错误");
                    return false;
                }
            });
        }// end function page


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
        <h2>${currUser.loginName}的<span class="highlight"><strong>博客</strong></span></h2>
        <h5><em>你这家伙太懒了，什么都没有留下</em></h5>
        <div class="fancy"><span> <img src="${pageContext.request.contextPath}/res/img/loginImg/avtar.png" class="img-responsive" alt="Image"></span></div>
    </div>


    <div id="feature" class="gray-bg"> <!-- fullwidth gray background -->
        <div class="container"> <!-- container -->
            <div class="row" role="tabpanel"> <!-- row -->
                <div class="col-md-4 col-md-offset-1"> <!-- tab menu col 4 -->

                    <ul class="features nav nav-pills nav-stacked" role="tablist">
                        <li role="presentation" class="active">  <!-- feature tab menu #1 -->
                            <a href="#f1" aria-controls="f1" role="tab" data-toggle="tab">
                                文章管理
                            </a>
                        </li>
                        <li role="presentation"> <!-- feature tab menu #2 -->
                            <a href="#f2" aria-controls="f2" role="tab" data-toggle="tab">
                                评论管理
                            </a>
                        </li>
                        <li role="presentation"> <!-- feature tab menu #3 -->
                            <a href="#f3" aria-controls="f3" role="tab" data-toggle="tab">
                                博客专栏
                            </a>
                        </li>
                        <li role="presentation"> <!-- feature tab menu #4 -->
                            <a href="#f4" aria-controls="f4" role="tab" data-toggle="tab">
                                收藏博文
                            </a>
                        </li>
                        <li role="presentation"> <!-- feature tab menu #5 -->
                            <a href="#f5" aria-controls="f5" role="tab" data-toggle="tab">
                                草稿箱
                            </a>
                        </li>
                    </ul>

                </div><!-- end tab menu col 4 -->

                <div class="col-md-6"> <!-- right content col 6 -->
                    <!-- Tab panes -->
                    <div class="tab-content features-content"> <!-- tab content wrapper -->


                        <!--文章管理-->
                        <div role="tabpanel" class="tab-pane fade in active" id="f1"> <!-- feature #1 content open -->
                            <ul class="list-inline social">
                                <li><a href="/myBlog/goWriteBlog" class="fa"> <span class="fa fa-pencil"></span></a></li> <!-- facebook link here -->
                            </ul>
                            <div id="blogArticles">
                                <c:forEach var="blogArticle" items="${blogArticleDTOList}" varStatus="vs">
                                    <div  id="blogArticleDTOList" class="post-wrap"> <!-- Post Wrapper -->
                                        <div class="media post"> <!-- post wrap -->

                                            <div class="media-body">
                                                <p class="small">${blogArticle.genTime}</p>
                                                <a href="/home/loadBlogArticle?articleID=${blogArticle.articleID}">
                                                    <h5 class="media-heading"><strong>${blogArticle.articleName}</strong></h5>
                                                </a>
                                            </div>
                                        </div><!-- end post wrap -->

                                        <div class="post-meta"> <!-- Meta details -->
                                            <ul class="list-inline metas pull-left"> <!-- post metas -->
                                                <li><a href="/myBlog/goEditArticle?articleID=${blogArticle.articleID}">编辑</a></li> <!-- meta author -->
                                                <li><a href="" onclick="deleteArticle('${blogArticle.articleID}');return false" >删除</a></li> <!-- meta comments -->
                                            </ul>
                                            <ul class="list-inline meta-detail pull-right"> <!-- user meta interaction -->
                                                <li><a href="#"><i class="fa fa-heart"></i></a> ${blogArticle.likeNum}</li> <!-- like button -->
                                                <li><i class="fa fa-eye"></i> ${blogArticle.readNum}</li> <!-- no. of views -->
                                            </ul>
                                        </div><!-- end Meta details -->
                                    </div><!-- end Post Wrapper -->
                                </c:forEach>
                            </div>
                            <c:if test="${blogArticleDTOList!=null}">
                                <div class="text-left"> <!-- Blogrol Pagination -->
                                    <nav>
                                        <ul class="pagination">
                                            <li>
                                                <a href="" aria-label="Previous" onclick="page('prev');return false">
                                                    <span aria-hidden="true">Prev</span>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="" aria-label="Next" onclick="page('next');return false">
                                                    <span aria-hidden="true" >Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </c:if>
                        </div>
                        <!--文章管理结束段-->
                        <div role="tabpanel" class="tab-pane fade" id="f2"> <!-- feature #2 content -->
                            <h4>Branding and Development</h4>
                            <p>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec, tempor cursus vitae sit aliquet neque purus. Ultrices lacus proin conubia dictum tempus, tempor pede vitae faucibus, sem auctor, molestie diam dictum aliquam. Dolor leo, ridiculus est ut cubilia nec, fermentum arcu praesent.</p>
                            <img src="${pageContext.request.contextPath}/res/img/tab02.png" class="img-responsive" alt="...">
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="f3"> <!-- feature #3 content -->
                            <h4>Motion Graphics</h4>
                            <p>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec, tempor cursus vitae sit aliquet neque purus. Ultrices lacus proin conubia dictum tempus, tempor pede vitae faucibus, sem auctor, molestie diam dictum aliquam. Dolor leo, ridiculus est ut cubilia nec, fermentum arcu praesent.</p>
                            <img src="${pageContext.request.contextPath}/res/img/tab03.png" class="img-responsive" alt="...">
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="f4"> <!-- feature #4 content -->
                            <h4>Mobile Application</h4>
                            <p>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec, tempor cursus vitae sit aliquet neque purus. Ultrices lacus proin conubia dictum tempus, tempor pede vitae faucibus, sem auctor, molestie diam dictum aliquam. Dolor leo, ridiculus est ut cubilia nec, fermentum arcu praesent.</p>
                            <img src="${pageContext.request.contextPath}/res/img/tab04.png" class="img-responsive" alt="...">
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="f5"> <!-- feature #5 content -->
                            <h4>Relaible Company Analysis</h4>
                            <p>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec, tempor cursus vitae sit aliquet neque purus. Ultrices lacus proin conubia dictum tempus, tempor pede vitae faucibus, sem auctor, molestie diam dictum aliquam. Dolor leo, ridiculus est ut cubilia nec, fermentum arcu praesent.</p>
                            <img src="${pageContext.request.contextPath}/res/img/tab05.png" class="img-responsive" alt="...">
                        </div>
                    </div> <!-- end tab content wrapper -->
                </div><!-- end right content col 6 -->

            </div> <!-- end row -->
        </div> <!-- end container -->
    </div><!-- end fullwidth gray background -->
</div>

<!-- Works Section
================================================== -->




</div>

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
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">操作提示</h4>
            </div>
            <div id="optionInfo" class="modal-body">确定要删除该文章吗？</div>
            <div id="buttons" class="modal-footer">
                <form action="/myBlog/deleteArticle" method="post">
                    <input id="articleID" name="articleID" type="hidden" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">确定</button>
                </form>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>




<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.1.11.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/owl.carousel.js"></script><!-- Owl Carousel Plugin -->

<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/SmoothScroll.js"></script>






<!-- Javascripts
================================================== -->
<!--<script type="text/javascript" src="js/main.js"></script>-->


</body>
</html>
