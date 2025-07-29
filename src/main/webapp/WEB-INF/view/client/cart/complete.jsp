<!DOCTYPE HTML>
<html>

<head>
    <title>Shoeshop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
                        <p class="bread"><span><a href="/">Home</a></span> / <span>Purchase Complete</span></p>
                    </div>
                </div>
            </div>
        </div>


        <div class="colorlib-product">
            <div class="container">
                <div class="row row-pb-lg">
                    <div class="col-sm-10 offset-md-1">
                        <div class="process-wrap">
                            <a href="/cart">
                                <div class="process text-center active">
                                    <p><span>01</span></p>
                                    <h3>Shopping Cart</h3>
                                </div>
                            </a>
                            <a href="/checkout">
                                <div class="process text-center active">
                                    <p><span>02</span></p>
                                    <h3>Checkout</h3>
                                </div>
                            </a>
                            <a href="/checkout">
                                <div class="process text-center active">
                                    <p><span>03</span></p>
                                    <h3>Order Complete</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10 offset-sm-1 text-center">
                        <p class="icon-addcart"><span><i class="icon-check"></i></span></p>
                        <h2 class="mb-4">Thank you for purchasing, Your order is complete</h2>
                        <p>
                            <a href="/" class="btn btn-primary btn-outline-primary">Home</a>
                            <a href="/product" class="btn btn-primary btn-outline-primary"><i
                                    class="icon-shopping-cart"></i> Continue Shopping</a>
                        </p>
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