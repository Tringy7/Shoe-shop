<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <style>
                    .col-lg-8 {
                        background-color: whitesmoke;
                        height: 462px;
                    }

                    img {
                        margin-top: 21px;
                    }
                </style>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const imgFile = "${user.avatar}";
                        if (imgFile) {
                            const urlImage = "/admin/img/user/" + imgFile;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
                        avatarFile.change(function (e) {
                            imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body>

                <div class="colorlib-loader"></div>

                <div id="page">
                    <jsp:include page="../layout/header.jsp" />

                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <p class="bread"><span><a href="/">Home</a></span> / <span>Information</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="colorlib-product">
                        <div class="container">
                            <form:form method="post" action="/information" modelAttribute="user"
                                enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-8">

                                        <h2>Information user</h2>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="fname">Email</label>
                                                    <form:input path="email" type="email" id="fname" readonly="true"
                                                        class="form-control" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <c:set var="nameHasBindError">
                                                        <form:errors path="fullName" />
                                                    </c:set>
                                                    <label for="fname">Full Name</label>
                                                    <form:input path="fullName" type="text" id="fname"
                                                        placeholder="Your Name"
                                                        class="form-control ${not empty nameHasBindError? 'is-invalid':''}" />
                                                    <form:errors path="fullName" cssClass="invalid-feedback" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="fname">Address</label>
                                                    <form:input path="address" type="text" id="address"
                                                        class="form-control" placeholder="Enter Your Address" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="Phone">Phone Number</label>
                                                    <form:input path="phone" type="text" id="zippostalcode"
                                                        class="form-control" placeholder="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="cart-detail">
                                                    <h2>Avatar</h2>
                                                    <input class="form-control bg-dark" type="file" id="avatarFile"
                                                        name="avatarFile">
                                                    <form:input path="avatar" type="hidden" />
                                                    <div class="mb-3">
                                                        <img src="" alt="" style="max-height: 189px; display: none;"
                                                            id="avatarPreview" class="d-block mx-auto">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="w-100"></div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <p><button type="submit" class="btn btn-primary">Save</button></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
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