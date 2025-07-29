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

                <style>
                    .size-option.active {
                        background-color: #616161;
                        color: white;
                        border-radius: 4px;
                        padding: 2px 6px;
                    }
                </style>

            </head>

            <body>

                <div class="colorlib-loader"></div>

                <div id="page">
                    <jsp:include page="../layout/header.jsp" />

                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <p class="bread">
                                        <span><a href="/">Home</a></span> /
                                        <span><a href="/product">Products</a></span> /
                                        <span>Product Details</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="colorlib-product">
                        <div class="container">
                            <form action="/product/${product.id}" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="row row-pb-lg product-detail-wrap">
                                    <div class="col-sm-8">
                                        <div class="product-entry border">
                                            <a href="#" class="prod-img">
                                                <img src="/admin/img/product/${product.image}" class="img-fluid">
                                            </a>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="product-desc">
                                            <h3>${product.name}</h3>
                                            <p class="price">
                                                <span>
                                                    <fmt:formatNumber type="number" value="${product.price}" /> vnd
                                                </span>
                                            </p>
                                            <p>Brand ${product.brand}, ${product.color}</p>
                                            <div class="size-wrap">
                                                <div class="block-26 mb-2">
                                                    <h4>Size</h4>
                                                    <ul>
                                                        <c:forEach items="${product.productDetails}" var="detail">
                                                            <li>
                                                                <a href="#" class="size-option"
                                                                    data-size="${detail.size}">${detail.size}</a>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                            <input type="hidden" id="selectedSize" name="size" value="">
                                            <div class="input-group mb-4">
                                                <span class="input-group-btn">
                                                    <button type="button" class="quantity-left-minus btn"
                                                        data-type="minus" data-field="">
                                                        <i class="icon-minus2"></i>
                                                    </button>
                                                </span>
                                                <input type="text" id="quantity" name="quantity"
                                                    class="form-control input-number" value="1" min="1" max="100">
                                                <span class="input-group-btn ml-1">
                                                    <button type="button" class="quantity-right-plus btn"
                                                        data-type="plus" data-field="">
                                                        <i class="icon-plus2"></i>
                                                    </button>
                                                </span>
                                            </div>
                                            <button type="submit"
                                                class="btn btn-primary btn-addtocart d-inline-flex align-items-center gap-2">
                                                <i class="icon-shopping-cart"></i>
                                                Add to Cart
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-12 pills">
                                                <div class="bd-example bd-example-tabs">
                                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                                                        <li class="nav-item">
                                                            <a class="nav-link active" id="pills-description-tab"
                                                                data-toggle="pill" href="#pills-description" role="tab"
                                                                aria-controls="pills-description"
                                                                aria-expanded="true">Description</a>
                                                        </li>
                                                    </ul>

                                                    <div class="tab-content" id="pills-tabContent">
                                                        <div class="tab-pane border fade show active"
                                                            id="pills-description" role="tabpanel"
                                                            aria-labelledby="pills-description-tab">
                                                            <p>${product.detailDesc}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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

                <script>
                    $(document).ready(function () {
                        // Xử lý nút tăng số lượng
                        $('.quantity-right-plus').click(function (e) {
                            e.preventDefault();
                            var quantity = parseInt($('#quantity').val());
                            $('#quantity').val(quantity + 1);
                        });

                        // Xử lý nút giảm số lượng
                        $('.quantity-left-minus').click(function (e) {
                            e.preventDefault();
                            var quantity = parseInt($('#quantity').val());
                            if (quantity > 1) {
                                $('#quantity').val(quantity - 1);
                            }
                        });

                        // Xử lý chọn size
                        const sizeOptions = document.querySelectorAll(".size-option");
                        const hiddenSizeInput = document.getElementById("selectedSize");

                        sizeOptions.forEach(option => {
                            option.addEventListener("click", function (e) {
                                e.preventDefault();

                                // Gán giá trị size vào input hidden
                                const selectedSize = this.getAttribute("data-size");
                                hiddenSizeInput.value = selectedSize;

                                // Đổi trạng thái active
                                sizeOptions.forEach(opt => opt.classList.remove("active"));
                                this.classList.add("active");
                            });
                        });
                    });
                </script>



            </body>

            </html>