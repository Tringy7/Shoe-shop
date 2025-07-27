<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE HTML>
        <html>

        <head>
            <title>Shoeshop</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

                <aside id="colorlib-hero">
                    <div class="flexslider">
                        <ul class="slides">
                            <li style="background-image: url(/client/img/banner/banner1.jpg);">
                                <div class="overlay"></div>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                            <div class="slider-text-inner">
                                                <div class="desc">
                                                    <h1 class="head-1">Men's</h1>
                                                    <h2 class="head-2">Shoes</h2>
                                                    <h2 class="head-3">Collection</h2>
                                                    <p class="category"><span>New trending shoes</span></p>
                                                    <p><a href="/product" class="btn btn-primary">Shop Collection</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(/client/img/banner/banner2.jpg);">
                                <div class="overlay"></div>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                            <div class="slider-text-inner">
                                                <div class="desc">
                                                    <h1 class="head-1">Huge</h1>
                                                    <h2 class="head-2">Sale</h2>
                                                    <h2 class="head-3"><strong class="font-weight-bold">50%</strong> Off
                                                    </h2>
                                                    <p class="category"><span>Big sale sandals</span></p>
                                                    <p><a href="/product" class="btn btn-primary">Shop Collection</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(/client/img/banner/banner3.jpg);">
                                <div class="overlay"></div>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                            <div class="slider-text-inner">
                                                <div class="desc">
                                                    <h1 class="head-1">New</h1>
                                                    <h2 class="head-2">Arrival</h2>
                                                    <h2 class="head-3">up to <strong
                                                            class="font-weight-bold">30%</strong>
                                                        off
                                                    </h2>
                                                    <p class="category"><span>New stylish shoes for men</span></p>
                                                    <p><a href="/product" class="btn btn-primary">Shop Collection</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </aside>
                <div class="colorlib-intro">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <h2 class="intro">It started with a simple idea: Create quality, well-designed products
                                    that
                                    I
                                    wanted myself.</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="colorlib-product">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <div class="featured">
                                    <a href="/product" class="featured-img"
                                        style="background-image: url(/client/img/banner/banner4.jpg);"></a>
                                    <div class="desc">
                                        <h2><a href="/product">Brand Adidas</a></h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 text-center">
                                <div class="featured">
                                    <a href="/product" class="featured-img"
                                        style="background-image: url(/client/img/banner/banner5.jpg);"></a>
                                    <div class="desc">
                                        <h2><a href="/product">Brand Nike</a></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="colorlib-product">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
                                <h2>Best Sellers</h2>
                            </div>
                        </div>
                        <div class="row row-pb-md">
                            <c:forEach items="${productList}" var="product">
                                <div class="col-lg-3 col-md-4 col-sm-6 mb-4 text-center">
                                    <div class="product-entry border">
                                        <a href="/product/${product.id}" class="prod-img">
                                            <img src="/admin/img/product/${product.image}" class="img-fluid"
                                                style="width: 253.4px; height: 250px; object-fit: cover;" />
                                        </a>
                                        <div class="desc">
                                            <h2><a href="/product/${product.id}">${product.name}</a></h2>
                                            <span class="price">
                                                <fmt:formatNumber type="number" value="${product.price}" /> vnd
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="row">
                            <div class="col-md-12 text-center">
                                <p><a href="/product" class="btn btn-primary btn-lg">Shop All Products</a></p>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/brand.jsp" />

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