<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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


                            <!-- Table Start -->
                            <div class="container-fluid pt-4 px-4">
                                <div class="row g-4">
                                    <div class="col-12">
                                        <div class="bg-secondary rounded h-100 p-4">
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <h6 class="mb-0">Responsive Table</h6>
                                                <a href="/admin/product/create" class="btn btn-success">Create new
                                                    product</a>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <h5 class="mb-0">Filter</h5>
                                            </div>
                                            <div>
                                                <table class="table table-bordered">
                                                    <thead class="table-light">
                                                        <tr>
                                                            <th>Filter</th>
                                                            <th>Options</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><strong>Brand</strong></td>
                                                            <td>
                                                                <div class="d-flex flex-wrap gap-3" id="CheckBrand">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Nike" id="brandNike">
                                                                        <label class="form-check-label"
                                                                            for="brandNike">Nike</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Adidas" id="brandAdidas">
                                                                        <label class="form-check-label"
                                                                            for="brandAdidas">Adidas</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Merrel" id="brandMerrel">
                                                                        <label class="form-check-label"
                                                                            for="brandMerrel">Merrel</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Gucci" id="brandGucci">
                                                                        <label class="form-check-label"
                                                                            for="brandGucci">Gucci</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Skechers" id="brandSkechers">
                                                                        <label class="form-check-label"
                                                                            for="brandSkechers">Puma</label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td><strong>Size</strong></td>
                                                            <td>
                                                                <div class="d-flex flex-wrap gap-3" id="CheckSize">
                                                                    <!-- Sizes -->
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="S" id="size7">
                                                                        <label class="form-check-label"
                                                                            for="size7">S</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="M" id="size7">
                                                                        <label class="form-check-label"
                                                                            for="size7">M</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="L" id="size7">
                                                                        <label class="form-check-label"
                                                                            for="size7">L</label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td><strong>Colors</strong></td>
                                                            <td>
                                                                <div class="d-flex flex-wrap gap-3" id="CheckColor">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Black" id="colorBlack">
                                                                        <label class="form-check-label"
                                                                            for="colorBlack">Black</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="White" id="colorWhite">
                                                                        <label class="form-check-label"
                                                                            for="colorWhite">White</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Blue" id="colorBlue">
                                                                        <label class="form-check-label"
                                                                            for="colorBlue">Blue</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Red" id="colorRed">
                                                                        <label class="form-check-label"
                                                                            for="colorRed">Red</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Green" id="colorGreen">
                                                                        <label class="form-check-label"
                                                                            for="colorGreen">Green</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Grey" id="colorGrey">
                                                                        <label class="form-check-label"
                                                                            for="colorGrey">Grey</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Orange" id="colorOrange">
                                                                        <label class="form-check-label"
                                                                            for="colorOrange">Orange</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Cream" id="colorCream">
                                                                        <label class="form-check-label"
                                                                            for="colorCream">Cream</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="checkbox"
                                                                            value="Brown" id="colorBrown">
                                                                        <label class="form-check-label"
                                                                            for="colorBrown">Brown</label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td><strong>Sort</strong></td>
                                                            <td>
                                                                <div class="d-flex flex-wrap gap-3" id="CheckSort">
                                                                    <!-- Sort -->
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="radio-sort" value="ko-tang"
                                                                            id="sortNone" checked>
                                                                        <label class="form-check-label"
                                                                            for="sortNone">None</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="radio-sort" value="giam-dan"
                                                                            id="sortDesc">
                                                                        <label class="form-check-label"
                                                                            for="sortDesc">Des</label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" type="radio"
                                                                            name="radio-sort" value="tang-dan"
                                                                            id="sortAsc">
                                                                        <label class="form-check-label"
                                                                            for="sortAsc">Asc</label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <button type="submit" id="filter-btn"
                                                    class="btn btn-warning">Filter</button>
                                            </div>
                                            <hr>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Picture</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Color</th>
                                                            <th scope="col">Brand</th>

                                                            <th scope="col">Size</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Sold</th>
                                                            <th scope="col">Action</th>
                                                            <!-- <th scope="col">Action All</th> -->

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${productList}" var="product"
                                                            varStatus="status">
                                                            <c:set var="rowspan"
                                                                value="${fn:length(product.productDetails)}" />

                                                            <c:forEach items="${product.productDetails}" var="detail"
                                                                varStatus="i">
                                                                <tr>
                                                                    <c:if test="${i.index == 0}">
                                                                        <th scope="row" rowspan="${rowspan}">
                                                                            ${status.index
                                                                            + 1}
                                                                        </th>
                                                                        <td rowspan="${rowspan}">
                                                                            <img src="/admin/img/product/${product.image}"
                                                                                class="img-fluid me-5 rounded-circle"
                                                                                style="width: 80px; height: 80px;"
                                                                                alt="">
                                                                        </td>
                                                                        <td rowspan="${rowspan}">${product.name}</td>
                                                                        <td rowspan="${rowspan}">
                                                                            <fmt:formatNumber type="number"
                                                                                value="${product.price}" />
                                                                        </td>
                                                                        <td rowspan="${rowspan}">${product.color}</td>
                                                                        <td rowspan="${rowspan}">${product.brand}</td>
                                                                    </c:if>
                                                                    <td>${detail.size}</td>
                                                                    <td>${detail.quantity}</td>
                                                                    <td>${detail.sold}</td>
                                                                    <!-- <td>
                                                                    <a href="/admin/product/update/detail/${detail.id}"
                                                                        class="btn btn-warning">Update</a>
                                                                    <a href="/admin/user/delete/detail/${detail.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td> -->
                                                                    <c:if test="${i.index == 0}">
                                                                        <td rowspan="${rowspan}">
                                                                            <a href="/admin/product/update/${product.id}"
                                                                                class="btn btn-warning">Update</a>
                                                                            <a href="/admin/product/delete/${product.id}"
                                                                                class="btn btn-danger">Delete</a>
                                                                        </td>
                                                                    </c:if>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </tbody>

                                                </table>

                                                <div class="btn-toolbar justify-content-center" role="toolbar">
                                                    <div class="btn-group me-2" role="group" aria-label="First group">

                                                        <c:if test="${totalPages > 0}">
                                                            <c:forEach begin="0" end="${totalPages}" varStatus="status">
                                                                <div
                                                                    class="${currentPage eq status.index? 'page-item active':'page-item'}">
                                                                    <a class="page-link"
                                                                        href="/admin/product?page=${status.index}${queryString}">${status.index
                                                                        + 1}</a>
                                                                </div>
                                                            </c:forEach>
                                                        </c:if>

                                                        <c:if test="${totalPages < 0}">
                                                            <div>No product</div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Table End -->
                            </div>
                            <!-- Content End -->

                            <!-- Back to Top -->
                            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                                    class="bi bi-arrow-up"></i></a>
                        </div>

                        <!-- JavaScript Libraries -->
                        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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