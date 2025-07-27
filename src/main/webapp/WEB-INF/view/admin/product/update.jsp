<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>DarkPan - Bootstrap 5 Admin Template</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Favicon -->
                <link href="/admin/img/favicon.ico" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/admin/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/admin/css/style.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const imgFile = "${product.image}";
                        if (imgFile) {
                            const urlImage = "/admin/img/product/" + imgFile;
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
                <div class="container-fluid position-relative d-flex p-0">
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    <!-- Spinner End -->


                    <!-- Sidebar Start -->
                    <jsp:include page="../layout/sidebar.jsp" />
                    <!-- Sidebar End -->


                    <!-- Content Start -->
                    <div class="content">
                        <!-- Navbar Start -->
                        <jsp:include page="../layout/header.jsp" />
                        <!-- Navbar End -->


                        <!-- Form Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-12 col-xl-6 mx-auto">
                                    <div class="bg-secondary rounded h-100 p-4">
                                        <form:form action="/admin/product/update/${product.id}" method="POST"
                                            modelAttribute="product" enctype="multipart/form-data">
                                            <h6 class="mb-4">Update product</h6>

                                            <div class="row mb-3">
                                                <c:set var="nameHasBindError">
                                                    <form:errors path="name" />
                                                </c:set>
                                                <label class="col-sm-2 col-form-label">Name</label>
                                                <div class="col-sm-10">
                                                    <form:input path="name" type="text"
                                                        class="form-control ${not empty nameHasBindError? 'is-invalid':''}" />
                                                </div>
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="row mb-3">
                                                <label class="col-sm-2 col-form-label">Price</label>
                                                <div class="col-sm-10">
                                                    <form:input path="price" type="number" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="form-floating mb-3">
                                                    <form:select path="brand" class="form-select" id="floatingSelect"
                                                        aria-label="Floating label select example">
                                                        <form:option value="Nike">Nike</form:option>
                                                        <form:option value="Adidas">Adidas</form:option>
                                                        <form:option value="Merrel">Merrel</form:option>
                                                        <form:option value="Gucci">Gucci</form:option>
                                                        <form:option value="Skechers">Skechers</form:option>
                                                    </form:select>
                                                    <label for="floatingSelect">Brand</label>
                                                </div>

                                                <div class="form-floating mb-3">
                                                    <form:select path="color" class="form-select" id="floatingSelect"
                                                        aria-label="Floating label select example">
                                                        <form:option value="Black">Black</form:option>
                                                        <form:option value="White">White</form:option>
                                                        <form:option value="Red">Red</form:option>
                                                        <form:option value="Blue">Blue</form:option>
                                                        <form:option value="Orange">Orange</form:option>
                                                        <form:option value="Grey">Grey</form:option>
                                                    </form:select>
                                                    <label for="floatingSelect">Colors</label>
                                                </div>
                                            </div>

                                            <div class="form-floating">
                                                <form:textarea path="detailDesc" class="form-control"
                                                    placeholder="Leave a comment here" id="floatingTextarea"
                                                    style="height: 150px;"></form:textarea>
                                                <label for="floatingTextarea">Details</label>
                                            </div>
                                            <div class="row mb-3">
                                            </div>

                                            <div class="form-floating mb-3">
                                                <div class="row align-items-center">
                                                    <!-- Size S -->
                                                    <div class="col-sm-4 d-flex align-items-center">
                                                        <label class="col-form-label me-2">S</label>
                                                        <form:input path="productDetails[0].quantity" type="number"
                                                            class="form-control" />
                                                    </div>

                                                    <!-- Size M -->
                                                    <div class="col-sm-4 d-flex align-items-center">
                                                        <label class="col-form-label me-2">M</label>
                                                        <form:input path="productDetails[1].quantity" type="number"
                                                            class="form-control" />
                                                    </div>

                                                    <!-- Size L -->
                                                    <div class="col-sm-4 d-flex align-items-center">
                                                        <label class="col-form-label me-2">L</label>
                                                        <form:input path="productDetails[2].quantity" type="number"
                                                            class="form-control" />
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="mb-3 row">
                                                <label for="formFile" class="form-label col-2">Image</label>
                                                <div class="col-10">
                                                    <input class="form-control bg-dark" type="file" id="avatarFile"
                                                        name="avatarFile">
                                                    <form:input path="image" type="hidden" />

                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <img src="" alt="" style="max-height: 250px; display: none;"
                                                    id="avatarPreview">
                                            </div>
                                            <button type="submit" class="btn btn-warning">Update</button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Back to Top -->
                        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                                class="bi bi-arrow-up"></i></a>
                    </div>

                    <!-- JavaScript Libraries -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/admin/lib/chart/chart.min.js"></script>
                    <script src="/admin/lib/easing/easing.min.js"></script>
                    <script src="/admin/lib/waypoints/waypoints.min.js"></script>
                    <script src="/admin/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="/admin/lib/tempusdominus/js/moment.min.js"></script>
                    <script src="/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
                    <script src="/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/admin/js/main.js"></script>
            </body>

            </html>