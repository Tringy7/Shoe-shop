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
                                                <h6 class="mb-0">Order Table</h6>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Name customer</th>
                                                            <th scope="col">Date time</th>
                                                            <th scope="col">Total</th>
                                                            <th scope="col">Image</th>
                                                            <th scope="col">Name Product</th>
                                                            <th scope="col">Size</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Sub Total</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${orderList}" var="order" varStatus="status">
                                                            <c:set var="rowspan"
                                                                value="${fn:length(order.orderDetails)}" />

                                                            <c:forEach items="${order.orderDetails}" var="detail"
                                                                varStatus="i">
                                                                <tr>
                                                                    <c:if test="${i.index == 0}">
                                                                        <th scope="row" rowspan="${rowspan}">
                                                                            ${status.index
                                                                            + 1}</th>
                                                                        <td rowspan="${rowspan}">${order.user.email}
                                                                        </td>
                                                                        <td rowspan="${rowspan}">${order.updatedAt}</td>
                                                                        <td rowspan="${rowspan}">
                                                                            <fmt:formatNumber type="number"
                                                                                value="${order.totalPrice}" />
                                                                        </td>
                                                                    </c:if>

                                                                    <!-- Các cột chi tiết sản phẩm hiển thị mỗi dòng -->
                                                                    <td>
                                                                        <img src="/admin/img/product/${detail.product.image}"
                                                                            class="img-fluid me-5 rounded-circle"
                                                                            style="width: 80px; height: 80px;" alt="">
                                                                    </td>
                                                                    <td>${detail.product.name}</td>
                                                                    <td>${detail.sizeProduct}</td>
                                                                    <td>
                                                                        <fmt:formatNumber type="number"
                                                                            value="${detail.product.price}" />
                                                                    </td>
                                                                    <td>${detail.quantity}</td>
                                                                    <td>
                                                                        <fmt:formatNumber type="number"
                                                                            value="${detail.product.price * detail.quantity}" />
                                                                    </td>

                                                                    <c:if test="${i.index == 0}">
                                                                        <td rowspan="${rowspan}">
                                                                            <a href="/admin/order/delete/${order.id}"
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
                                                                        href="/admin/order?page=${status.index}${queryString}">${status.index
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