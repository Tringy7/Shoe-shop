<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE HTML>
        <html>

        <head>
            <title>Shoeshop</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Facebook and Twitter integration -->
            <meta property="og:title" content="" />
            <meta property="og:image" content="" />
            <meta property="og:url" content="" />
            <meta property="og:site_name" content="" />
            <meta property="og:description" content="" />
            <meta name="twitter:title" content="" />
            <meta name="twitter:image" content="" />
            <meta name="twitter:url" content="" />
            <meta name="twitter:card" content="" />

            <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

            <!-- Animate.css -->
            <link rel="stylesheet" href="/client/css/animate.css">
            <!-- Icomoon Icon Fonts-->
            <link rel="stylesheet" href="/client/css/icomoon.css">
            <!-- Ion Icon Fonts-->
            <link rel="stylesheet" href="/client/css/ionicons.min.css">
            <!-- Bootstrap  -->
            <link rel="stylesheet" href="/client/css/bootstrap.min.css">

            <!-- Magnific Popup -->
            <link rel="stylesheet" href="/client/css/magnific-popup.css">

            <!-- Flexslider  -->
            <link rel="stylesheet" href="/client/css/flexslider.css">

            <!-- Owl Carousel -->
            <link rel="stylesheet" href="/client/css/owl.carousel.min.css">
            <link rel="stylesheet" href="/client/css/owl.theme.default.min.css">

            <!-- Date Picker -->
            <link rel="stylesheet" href="/client/css/bootstrap-datepicker.css">
            <!-- Flaticons  -->
            <link rel="stylesheet" href="/client/fonts/flaticon/font/flaticon.css">

            <!-- Theme style  -->
            <link rel="stylesheet" href="/client/css/style.css">

        </head>

        <body>

            <div class="colorlib-loader"></div>

            <div id="page">
                <jsp:include page="../layout/header.jsp" />

                <div class="breadcrumbs">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <p class="bread"><span><a href="/">Home</a></span> / <span>Contact</span></p>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="colorlib-contact">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3>Contact Information</h3>
                                <div class="row contact-info-wrap">
                                    <div class="col-md-3">
                                        <p><span><i class="icon-location"></i></span> 2/6 Linh Chieu Street, <br> Thu
                                            Duc,
                                            HCM,
                                            VietNam</p>
                                    </div>
                                    <div class="col-md-3">
                                        <p><span><i class="icon-phone3"></i></span> <a href="tel://0346500557">+84
                                                346500557</a>
                                        </p>
                                    </div>
                                    <div class="col-md-3">
                                        <p><span><i class="icon-paperplane"></i></span> <a
                                                href="mailto:huutria2005@gmail.com">huutria2005@gmail.com</a></p>
                                    </div>
                                    <div class="col-md-3">
                                        <p><span><i class="icon-globe"></i></span> <a href="/">Shoeshop.com</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="contact-wrap">
                                    <h3>Get In Touch</h3>
                                    <form:form action="/contact" class="contact-form" modelAttribute="user">
                                        <div class="row">
                                            <form:input path="id" type="hidden" class="form-control"  />
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="fname">Full Name</label>
                                                    <form:input path="fullName" type="text" class="form-control"
                                                        placeholder="Your name" />
                                                </div>
                                            </div>
                                            <div class="w-100"></div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="email">Email</label>
                                                    <form:input path="email" type="text" class="form-control"
                                                        placeholder="Your email address" />
                                                </div>
                                            </div>
                                            <div class="w-100"></div>
                                            <div class="w-100"></div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="message">Message</label>
                                                    <textarea name="message" id="message" cols="30" rows="10"
                                                        class="form-control"
                                                        placeholder="Say something about us"></textarea>
                                                </div>
                                            </div>
                                            <div class="w-100"></div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <input type="submit" value="Send Message" class="btn btn-primary">
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <a href="/product" class="prod-img">
                                    <img src="/client/img/product/about.jpg" class="img-fluid">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

            </div>

            <div class="gototop js-top">
                <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
            </div>

            <!-- jQuery -->
            <script src="/client/js/jquery.min.js"></script>
            <!-- popper -->
            <script src="/client/js/popper.min.js"></script>
            <!-- bootstrap 4.1 -->
            <script src="/client/js/bootstrap.min.js"></script>
            <!-- jQuery easing -->
            <script src="/client/js/jquery.easing.1.3.js"></script>
            <!-- Waypoints -->
            <script src="/client/js/jquery.waypoints.min.js"></script>
            <!-- Flexslider -->
            <script src="/client/js/jquery.flexslider-min.js"></script>
            <!-- Owl carousel -->
            <script src="/client/js/owl.carousel.min.js"></script>
            <!-- Magnific Popup -->
            <script src="/client/js/jquery.magnific-popup.min.js"></script>
            <script src="/client/js/magnific-popup-options.js"></script>
            <!-- Date Picker -->
            <script src="/client/js/bootstrap-datepicker.js"></script>
            <!-- Stellar Parallax -->
            <script src="/client/js/jquery.stellar.min.js"></script>
            <!-- Main -->
            <script src="/client/js/main.js"></script>

        </body>

        </html>