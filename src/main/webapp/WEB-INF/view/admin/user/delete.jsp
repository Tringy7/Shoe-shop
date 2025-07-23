<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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
                            <div class="col-sm-12 col-xl-6 mx-auto"> <!-- Thêm mx-auto vào đây -->
                                <div class="bg-secondary rounded h-100 p-4 text-center">
                                    <form action="/admin/user/delete/${user.id}" method="POST">
                                        <div class="alert alert-primary alert-dismissible fade show d-inline-block"
                                            role="alert">
                                            <i class="fa fa-exclamation-circle me-2"></i>Do you delete user
                                            ${user.fullName}
                                            <input type="hidden" id="id" value="${user.id}">
                                            <button type="submit" class="btn btn-danger m-2">Delete</button>
                                            <a href="/admin/user" class="btn btn-secondary m-2"
                                                id="closeModal">Cancel</a>
                                        </div>
                                    </form>
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