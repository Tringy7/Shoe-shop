<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        .logout-btn  {
            width: 113px;
        }
    </style>
    <nav class="colorlib-nav" role="navigation">
        <div class="top-menu">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 d-flex justify-content-between align-items-center">
                        <div id="colorlib-logo">
                            <a href="/">Shoeshop</a>
                        </div>
                        <div class="search-wrap">
                            <div class="form-group mb-0">
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <form action="/logout" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <ul>
                                            <li class="has-dropdown"><a href="/">${sessionScope.fullName}</a>
                                                <ul class="dropdown">
                                                    <li><a href="/information">Information user</a></li>
                                                    <li><a href="order-complete.html">Purchase history</a></li>
                                                    <li> <button type="submit" class="logout-btn btn btn-primary">Logout</button>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </form>
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <a href="/login" class="btn btn-primary">Login</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="col-sm-12 text-left menu-1">
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><a href="/product">Products</a></li>
                            <li><a href="/about">About</a></li>
                            <li><a href="/contact">Contact</a></li>
                            <li class="cart"><a href="/cart"><i class="icon-shopping-cart"></i> Cart
                                    ${sessionScope.sum}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="sale">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 offset-sm-2 text-center">
                        <div class="row">
                            <div class="owl-carousel2">
                                <div class="item">
                                    <div class="col">
                                        <h3><a href="#">25% off (Almost) Everything! Use Code: Summer Sale</a></h3>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col">
                                        <h3><a href="#">Our biggest sale yet 50% off all summer shoes</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const currentPath = window.location.pathname;
            const menuLinks = document.querySelectorAll('.menu-1 ul li a');

            menuLinks.forEach(link => {
                if (link.getAttribute('href') === currentPath) {
                    link.parentElement.classList.add('active');
                }
            });
        });
    </script>