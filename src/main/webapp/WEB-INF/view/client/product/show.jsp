<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <p class="bread"><span><a href="/">Home</a></span> / <span>Products</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="breadcrumbs-two">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="breadcrumbs-img"
                                        style="background-image: url(/client/img/product/product.jpg);">
                                        <h2>Shoe</h2>
                                    </div>
                                    <div class="menu text-center">
                                        <p><a href="#">New Arrivals</a> <a href="#">Best Sellers</a> <a
                                                href="#">Extended
                                                Widths</a>
                                            <a href="#">Sale</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="colorlib-product">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-xl-3">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="side border mb-1">
                                                <h3>Sort</h3>
                                                <ul id="CheckSort">
                                                    <div class="d-flex flex-wrap gap-3 align-items-center"
                                                        id="CheckSort">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" value="none" id="sortNone" checked>
                                                            <label class="form-check-label" for="sortNone">None</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" value="giam-dan" id="sortDesc">
                                                            <label class="form-check-label" for="sortDesc">Des</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio"
                                                                name="radio-sort" value="tang-dan" id="sortAsc">
                                                            <label class="form-check-label" for="sortAsc">Asc</label>
                                                        </div>
                                                    </div>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="side border mb-1">
                                                <h3>Brand</h3>
                                                <ul id="CheckBrand">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="Nike"
                                                                id="brandNike">
                                                            <label class="form-check-label" for="brandNike">Nike</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Adidas" id="brandAdidas">
                                                            <label class="form-check-label"
                                                                for="brandAdidas">Adidas</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Merrel" id="brandMerrel">
                                                            <label class="form-check-label"
                                                                for="brandMerrel">Merrel</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Gucci" id="brandGucci">
                                                            <label class="form-check-label"
                                                                for="brandGucci">Gucci</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Skechers" id="brandSkechers">
                                                            <label class="form-check-label"
                                                                for="brandSkechers">Puma</label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="side border mb-1">
                                                <h3>Size</h3>
                                                <div class="d-flex gap-3 flex-wrap" id="CheckSize">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="S"
                                                            id="size-s">
                                                        <label class="form-check-label" for="size-s">S</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="M"
                                                            id="size-m">
                                                        <label class="form-check-label" for="size-m">M</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="checkbox" value="L"
                                                            id="size-l">
                                                        <label class="form-check-label" for="size-l">L</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="side border mb-1">
                                                <h3>Colors</h3>
                                                <ul id="CheckColor">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Black" id="colorBlack">
                                                            <label class="form-check-label"
                                                                for="colorBlack">Black</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="White" id="colorWhite">
                                                            <label class="form-check-label"
                                                                for="colorWhite">White</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="Blue"
                                                                id="colorBlue">
                                                            <label class="form-check-label" for="colorBlue">Blue</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="Red"
                                                                id="colorRed">
                                                            <label class="form-check-label" for="colorRed">Red</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Green" id="colorGreen">
                                                            <label class="form-check-label"
                                                                for="colorGreen">Green</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="Grey"
                                                                id="colorGrey">
                                                            <label class="form-check-label" for="colorGrey">Grey</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Orange" id="colorOrange">
                                                            <label class="form-check-label"
                                                                for="colorOrange">Orange</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Cream" id="colorCream">
                                                            <label class="form-check-label"
                                                                for="colorCream">Cream</label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox"
                                                                value="Brown" id="colorBrown">
                                                            <label class="form-check-label"
                                                                for="colorBrown">Brown</label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group mb-0">
                                                <div class="d-flex gap-2 w-100">
                                                    <a href="/product" class="btn btn-secondary w-50">Reset</a>
                                                    <button id="filter-btn" type="submit"
                                                        class="btn btn-primary w-50">Check</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-xl-9">
                                    <div class="row row-pb-md">
                                        <c:forEach items="${productList}" var="product">
                                            <div class="col-lg-4 mb-4 text-center">
                                                <div class="product-entry border">
                                                    <a href="/product/${product.id}" class="prod-img">
                                                        <img src="/admin/img/product/${product.image}" class="img-fluid"
                                                            style="width: 253.4px; height: 250px; object-fit: cover;" />
                                                    </a>
                                                    <div class="desc">
                                                        <h2><a href="/product/${product.id}">${product.name}</a></h2>
                                                        <span class="price">
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            vnd
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <div class="block-27">
                                                <ul>
                                                    <c:if test="${totalPages > 0}">
                                                        <li>
                                                            <a class="${currentPage eq 0? 'disabled':''}"
                                                                href="/product?page=${currentPage-1}${queryString}"><i
                                                                    class="ion-ios-arrow-back"></i></a>
                                                        </li>

                                                        <c:forEach begin="0" end="${totalPages}" varStatus="status">
                                                            <li class="${currentPage eq status.index? 'active':''}">
                                                                <a href="/product?page=${status.index}${queryString}">${status.index
                                                                    + 1}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <li>
                                                            <a class="${currentPage eq totalPages? 'disabled':''}"
                                                                href="/product?page=${currentPage+1}${queryString}"><i
                                                                    class="ion-ios-arrow-forward"></i></a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${totalPages < 0}">
                                                        <div>Không có sản phẩm</div>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
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