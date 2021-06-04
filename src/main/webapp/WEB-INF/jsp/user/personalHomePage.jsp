
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
                            <div class="post-wrap"> <!-- Post Wrapper -->
                                <div class="media post"> <!-- post wrap -->

                                    <div class="media-body">
                                        <p class="small">January 14, 2015</p>
                                        <a href="#">
                                            <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                        </a>
                                    </div>
                                </div><!-- end post wrap -->

                                <div class="post-meta"> <!-- Meta details -->
                                    <ul class="list-inline metas pull-left"> <!-- post metas -->
                                        <li><a href="#">编辑</a></li> <!-- meta author -->
                                        <li><a href="#">删除</a></li> <!-- meta comments -->
                                        <li><a href="#">详情</a></li> <!-- read more link -->
                                    </ul>
                                    <ul class="list-inline meta-detail pull-right"> <!-- user meta interaction -->
                                        <li><a href="#"><i class="fa fa-heart"></i></a> 50</li> <!-- like button -->
                                        <li><i class="fa fa-eye"></i> 110</li> <!-- no. of views -->
                                    </ul>
                                </div><!-- end Meta details -->
                            </div><!-- end Post Wrapper -->
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
