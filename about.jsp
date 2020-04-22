<%-- 
    Document   : about
    Created on : Mar 23, 2020, 8:32:57 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SickkidoBakery</title>
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <link rel="icon" href="img/cake.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/all.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <!-- nice select CSS -->
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <style>
            .slide_image{
                height:400px
            }
        </style>
    </head>

    <body>
        <!--::header part start::-->
        <div style="background-color: black; color:white;height:50px; padding-top:10px" class=" container-fluid text-center">
            <p>98 Dien Bien Phu, Ba Dinh, Ha Noi | Daily 10Am-10PM</p>
        </div>
        <header class="main_menu home_menu">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html">
                                <span class="brandname" 
                                      style="font-family: 'Dancing Script', cursive;
                                      text-shadow: 4px 4px 4px #aaa;
                                      font-size: 30px;
                                      color:#ffad38">Sickiddo Bakery</span></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="menu_icon"><i class="fas fa-bars"></i></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/BakeryAndCafe/home.jsp">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/BakeryAndCafe/menu">Menu</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/BakeryAndCafe/home.jsp#reservation">Reservation</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="http://localhost:8080/BakeryAndCafe/about.jsp">About</a>
                                    </li>
                                    <c:if test = "${sessionScope.user.role == false}">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link" href="">Admin</a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                                <a class="dropdown-item" href="http://localhost:8080/BakeryAndCafe/addproduct"> Add Product</a>
                                                <a class="dropdown-item" href="http://localhost:8080/BakeryAndCafe/checkorder">Check Order</a>
                                                <a class="dropdown-item" href="http://localhost:8080/BakeryAndCafe/addcoupon">Add Coupon</a>
                                            </div>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="hearer_icon d-flex align-items-center" >
                                <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <a href="http://localhost:8080/BakeryAndCafe/shoppingcart.jsp">
                                    <i class="flaticon-shopping-cart-black-shape"></i>
                                </a>
                                <c:choose>
                                    <c:when test="${sessionScope.user != null}">
                                        <a href="http://localhost:8080/BakeryAndCafe/info" class="nav-item " style="color:#f5790b">
                                            <i class="ti-user"></i><span class="dead"> ${sessionScope.user.firstName}</span></a>
                                        <a href="http://localhost:8080/BakeryAndCafe/logout" class="nav-item" style="color:#f5790b">
                                            <i class="ti-arrow-circle-right"></i><span class="dead"> Logout</span></a>
                                            </c:when>
                                            <c:otherwise>
                                        <a href="http://localhost:8080/BakeryAndCafe/signup" class="nav-item " style="color:#f5790b">
                                            <i class="ti-user"></i><span class="dead"> Sign Up</span></a>
                                        <a href="http://localhost:8080/BakeryAndCafe/login" class="nav-item" style="color:#f5790b">
                                            <i class="ti-arrow-circle-left"></i><span class="dead"> Login</span></a>        
                                            </c:otherwise>
                                        </c:choose> 
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="search_input" id="search_input_box">
                <div class="container ">
                    <form class="d-flex justify-content-between search-inner" action="search" method="POST">
                        <input type="text" class="form-control" id="productName" name="productName" <c:choose>
                                               <c:when test="${sessionScope.productName eq null}">
                                                   placeholder="Search Here"
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.productName}"
                                               </c:otherwise>
                                           </c:choose>>
                        <button type="submit" class="btn"></button>
                        <span class="ti-close" id="close_search" title="Close Search"></span>
                    </form>
                </div>
            </div>
        </header>
        <!-- Header part end-->

        <!-- breadcrumb part start-->
        <section class="breadcrumb_part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                            <h2>About</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!-- product list part start-->
        <section class="about_us padding_top">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="about_us_content">
                            <h5>Our Mission</h5>
                            <h3>We are founders and the team that behind Sickiddo Bakery and Cafe,
                                which is the first dessert cafe in Hanoi.
                                As our passion is to make freshly-baked, high-quality sweet treats 
                                and drinks with a modern twist that bring joy and happiness to the customers,
                                we founded Sickiddo Bakery and Cafe in 2017 to serve customers' cravings
                                for good cakes, good coffee and good vibes.</h3>
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100 slide_image" src="img/home/cakeHome10.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100 slide_image" src="img/home/cakeHome14.jpg" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100 slide_image" src="img/home/cakeHome15.jpg" alt="Third slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list part end-->

        <!-- feature part here -->
        <section class="feature_part section_padding">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-6">
                        <div class="feature_part_tittle">
                            <h3>We bake goodness!</h3>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="feature_part_content">
                            <p>We seek the finest ingredients that we can find
                                locally to make outstanding desserts with seasonal
                                menus and flavours. For us, Sickiddo Bakery and Cafe
                                is filled with love and passion with every
                                ingredient, every product and every person that
                                have accompanied us this journey all along.
                                We can't wait to serve you in Sickiddo Bakery and Cafe!</p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_2.svg" alt="#">
                            <h4>Online Order</h4>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_3.svg" alt="#">
                            <h4>Free Delivery</h4>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="single_feature_part">
                            <img src="img/icon/feature_icon_4.svg" alt="#">
                            <h4>Product with Gift</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- feature part end -->

        <!--::footer_part start::-->
    <footer class="footer_part" style="background-color: #fff8ed">
            <div class="footer_iner">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="footer_menu">
                                <div class="footer_logo">
                                    <span class="brandname" 
                                      style="font-family: 'Dancing Script', cursive;
                                      text-shadow: 4px 4px 4px #aaa;
                                      font-size: 30px;
                                      color:#ffad38">Sickiddo Bakery</span>
                                </div>
                                <div class="footer_menu_item">
                                    <a href="http://localhost:8080/BakeryAndCafe/home.jsp">Home</a>
                                    <a href="http://localhost:8080/BakeryAndCafe/menu">Menu</a>
                                    <a href="http://localhost:8080/BakeryAndCafe/home.jsp#reservation">Reservation</a>
                                    <a href="http://localhost:8080/BakeryAndCafe/about.jsp">About</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="social_icon">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </footer>
        <!--::footer_part end::-->

        <!-- jquery plugins here-->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- swiper js -->
        <script src="js/swiper.min.js"></script>
        <!-- swiper js -->
        <script src="js/mixitup.min.js"></script>
        <!-- particles js -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <!-- slick js -->
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>

</html>
