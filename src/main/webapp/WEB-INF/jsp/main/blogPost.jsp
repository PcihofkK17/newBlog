
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Ethanol Portfolio Template - Single Blog Post</title>

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


<!--  Blog Section
================================================== -->
<div id="tf-blog" class="blog-post">
    <div class="container"> <!-- container -->
        <div class="section-header">
            <h2>Latest from the <span class="highlight"><strong>Blog</strong></span></h2>
            <h5><em>We design and build functional and beautiful websites</em></h5>
            <div class="fancy"><span><img src="${pageContext.request.contextPath}/res/img/favicon.ico" alt="..."></span></div>
        </div>
    </div>

    <div id="blog-post"> <!-- fullwidth gray background -->
        <div class="container"><!-- container -->

            <div class="row"> <!-- row -->
                <div class="col-md-6 col-md-offset-1"> <!-- Left Blogrol col 8 -->

                    <div class="post-wrap"> <!-- Post Wrapper -->
                        <p class="small">${blogArticleDTO.genTime}</p>
                        <a href="#">
                            <h5 class="media-heading"><strong>${blogArticleDTO.articleName}</strong></h5>
                        </a>

                        <ul class="list-inline metas pull-left"> <!-- post metas -->
                            <li><a href="#">${blogArticleDTO.userName}</a></li> <!-- meta author -->
                            <li><a href="#comments" class="scroll">${blogArticleDTO.commentNum} 条评论</a></li> <!-- meta comments -->
                        </ul>

                        <img src="http://placehold.it/800px500" class="img-responsive" alt="...">

                       <span>${blogArticleDTO.articleContent}</span>
                        <br>
                        <br>
                        <p><strong>Tags:</strong></p>
                        <ul class="list-inline meta-tags">
                            <li><a href="#">web design</a></li>
                            <li><a href="#">business</a></li>
                            <li><a href="#">psd design</a></li>
                            <li><a href="#">themeforest</a></li>
                            <li><a href="#">wordpress</a></li>
                            <li><a href="#">responsive</a></li>
                            <li><a href="#">bootstrap</a></li>
                        </ul>
                    </div><!-- end Post Wrapper -->

                    <div class="media post-author"> <!-- Author Box -->
                        <div class="media-left media-middle">
                            <a href="#">
                                <img class="media-object" src="http://placehold.it/90x90" alt="...">
                            </a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading">Post by <a href="#">Rudhi Design</a></h5>
                            Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                        </div>
                    </div>

                    <div id="comments" class="comment">
                        <h4 class="text-uppercase">Comment <span class="comments">(3)</span></h4>
                        <div class="media comment-block"> <!-- Comment Block #1 -->
                            <div class="media-left media-top">
                                <a href="#">
                                    <img class="media-object" src="http://placehold.it/90x90" alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <small class="pull-right">Feb. 15, 2015</small>
                                <h5 class="media-heading">Post by <a href="#">Rudhi Design</a></h5>
                                <div class="clearfix"></div>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                                <div class="clearfix"></div>
                                <a href="#" class="pull-right text-uppercase">Reply</a>
                            </div>
                        </div>

                        <div class="media comment-block"> <!-- Comment Block #2 -->
                            <div class="media-left media-top">
                                <a href="#">
                                    <img class="media-object" src="http://placehold.it/90x90" alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <small class="pull-right">Feb. 15, 2015</small>
                                <h5 class="media-heading">Post by <a href="#">Rudhi Design</a></h5>
                                <div class="clearfix"></div>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                                <div class="clearfix"></div>
                                <a href="#" class="pull-right text-uppercase">Reply</a>
                            </div>
                        </div>

                        <div class="media comment-block"> <!-- Comment Block #3 -->
                            <div class="media-left media-top">
                                <a href="#">
                                    <img class="media-object" src="http://placehold.it/90x90" alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <small class="pull-right">Feb. 15, 2015</small>
                                <h5 class="media-heading">Post by <a href="#">Rudhi Design</a></h5>
                                <div class="clearfix"></div>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                                <div class="clearfix"></div>
                                <a href="#" class="pull-right text-uppercase">Reply</a>
                            </div>
                        </div>
                    </div>

                    <div class="comment">
                        <h4 class="text-uppercase">Leave a Comment</h4>
                        <form id="contact-form" class="form">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Your Name">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Your Email">
                                </div>
                            </div>
                            <textarea class="form-control" rows="6" placeholder="Your Comment..."></textarea>
                            <button type="submit" class="btn btn-default en-btn">Submit Comment</button>
                        </form>
                    </div>

                </div> <!-- end Left content col 8 -->

                <div class="col-md-4"> <!-- Blog Sidebar -->
                    <div class="sidebar">

                        <div class="widget search"> <!-- Search Widget -->
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><span class="fa fa-search"></span></button>
                                    </span>
                            </div><!-- /input-group -->
                        </div> <!-- end Search Widget -->

                        <div class="widget categories"> <!-- Category Widget -->
                            <h4 class="text-uppercase">Category</h4>
                            <ul class="list-unstyled bullet-lists">
                                <li><a href="#"><span class="fa fa-circle"></span> Web Design</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> WordPress</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> Graphics Design</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> Branding</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> Marketing</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> Business</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> Outsourcing</a></li>
                            </ul>
                        </div>

                        <div class="widget archive"> <!-- Archive Widget -->
                            <h4 class="text-uppercase">Archives</h4>
                            <ul class="list-unstyled bullet-lists">
                                <li><a href="#"><span class="fa fa-circle"></span> March 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> February 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> January 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> December 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> November 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> October 2015</a></li>
                                <li><a href="#"><span class="fa fa-circle"></span> September 2015</a></li>
                            </ul>
                        </div>

                        <div class="widget post-tab"> <!-- Posts Tab Widget -->
                            <div role="tabpanel">

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#popular" aria-controls="popular" role="tab" data-toggle="tab">Popular</a></li><!-- Popular Posts -->
                                    <li role="presentation"><a href="#recent" aria-controls="recent" role="tab" data-toggle="tab">Recent</a></li><!-- Recent Posts -->
                                    <li role="presentation"><a href="#comment" aria-controls="comment" role="tab" data-toggle="tab">Comment</a></li><!-- Comments -->
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="popular"><!-- Popular Posts -->
                                        <div class="list-group">
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 27, 2015</p>
                                                <h5 class="media-heading"><strong>Condimentum aliquam, mollit magna velit nec et scelerisque</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Pellentesque vehicula. Eget sed, dapibus. Vel et scelerisque donec et</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">Feb 12, 2015</p>
                                                <h5 class="media-heading"><strong>Et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Scelerisque vestibulum Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">December 19, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="recent"><!-- Recent Posts -->
                                        <div class="list-group">
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">January 14, 2015</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="comment"><!-- Comments -->
                                        <div class="list-group">
                                            <a href="#" class="list-group-item">
                                                <p class="small">Ms. Lijoy <strong>Comments</strong> on:</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">Coder Expert <strong>Comments</strong> on:</p>
                                                <h5 class="media-heading"><strong>Pellentesque vehicula. Eget sed, dapibus. Vel et scelerisque donec et</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">Cool Design <strong>Comments</strong> on:</p>
                                                <h5 class="media-heading"><strong>Et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">Mark Szuckerburg <strong>Comments</strong> on:</p>
                                                <h5 class="media-heading"><strong>Scelerisque vestibulum Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                            <a href="#" class="list-group-item">
                                                <p class="small">Ruji <strong>Comments</strong> on:</p>
                                                <h5 class="media-heading"><strong>Vel donec et scelerisque vestibulum. Condimentum aliquam, mollit magna velit nec</strong></h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="widget tags"> <!-- Tags Widget -->
                            <h4 class="text-uppercase">Tags</h4>
                            <ul class="list-inline bullet-lists">
                                <li><a href="#">web design</a></li>
                                <li><a href="#">business</a></li>
                                <li><a href="#">psd design</a></li>
                                <li><a href="#">themeforest</a></li>
                                <li><a href="#">wordpress</a></li>
                                <li><a href="#">responsive</a></li>
                                <li><a href="#">bootstrap</a></li>
                            </ul>
                        </div>


                    </div>
                </div><!-- end right content col 4 -->

            </div><!-- end row -->

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
