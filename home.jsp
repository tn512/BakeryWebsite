<%-- 
    Document   : home
    Created on : Mar 23, 2020, 6:26:06 PM
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



        <!-- banner part start-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">
                        <div class="banner_text">
                            <div class="banner_text_iner">
                                <h1>HANDMADE BAKERY</h1>
                                <p>For us, Sickiddo Bakery and Cafe is filled with love and passion with every ingredient, every product and every person that have accompanied us this journey all along. </p>
                                <a href="http://localhost:8080/BakeryAndCafe/menu" class="btn_1">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner_img">
                <img src="img/home/cakeHome10.jpg" alt="#" class="img-fluid">
                <img src="img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
            </div>
        </section>
        <!-- banner part start-->



        <!-- product list start-->
        <section class="single_product_list">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/home/cakeHome18.jpg" class="img-fluid" alt="#">
                                        <img src="img/ffb347.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Click in and have our sweet treats now!</h5>
                                        <h2> <a href="http://localhost:8080/BakeryAndCafe/menu">Sickiddo Bakery and Cafe at your door with our Delivery Service.</a> </h2>
                                        <a href="http://localhost:8080/BakeryAndCafe/menu" class="btn_3">Order online</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/home/cakeHome15.jpg" class="img-fluid" alt="#">
                                        <img src="img/ffb347.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Click in and have our sweet treats now!</h5>
                                        <h2> <a href="http://localhost:8080/BakeryAndCafe/menu">We use the finest and freshest ingredients.</a> </h2>
                                        <a href="http://localhost:8080/BakeryAndCafe/menu" class="btn_3">Menu</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/home/cakeHome11.jpg" class="img-fluid" alt="#">
                                        <img src="img/ffb347.png" alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>At Sickiddo Bakery, we're baked as a cake!</h5>
                                        <h2> <a href="http://localhost:8080/BakeryAndCafe/about.jsp">WE BAKE GOODNESS</a> </h2>
                                        <a href="http://localhost:8080/BakeryAndCafe/about.jsp" class="btn_3">About us</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list end-->


        <!-- reservation start-->
        <section class="book_table_area p_120" style="background-color: #ffad38" id="reservation">
            <div class="container">
                <div class="book_table_inner row">
                    <div class="col-lg-5">
                        <div class="table_img">
                            <img src="img/book-table.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="table_form">
                            <h3 style="color: #823f00">Reservation</h3>
                            <p>Book a table.</p>
                            <div>
                                <form class="book_table_form row" action="reservation" method="POST">
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" 
                                               id="name" name="firstName"<c:choose>
                                                   <c:when test="${sessionScope.user eq null}">
                                                       placeholder="Enter your first name"
                                                   </c:when>
                                                   <c:otherwise>
                                                       value="${sessionScope.user.firstName}"
                                                   </c:otherwise>
                                               </c:choose> required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <input type="text" class="form-control" 
                                               id="name" name="lastName" <c:choose>
                                                   <c:when test="${sessionScope.user eq null}">
                                                       placeholder="Enter your last name"
                                                   </c:when>
                                                   <c:otherwise>
                                                       value="${sessionScope.user.lastName}"
                                                   </c:otherwise>
                                               </c:choose> required>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <input type="email" class="form-control" 
                                               id="email" name="email"<c:choose>
                                                   <c:when test="${sessionScope.user eq null}">
                                                       placeholder="Enter email address"
                                                   </c:when>
                                                   <c:otherwise>
                                                       value="${sessionScope.user.email}"
                                                   </c:otherwise>
                                               </c:choose> required>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <input type="text" class="form-control" 
                                               id="phone" name="phone"<c:choose>
                                                   <c:when test="${sessionScope.user eq null}">
                                                       placeholder="Phone Number"
                                                   </c:when>
                                                   <c:otherwise>
                                                       value="${sessionScope.user.phone}"
                                                   </c:otherwise>
                                               </c:choose> required>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <input type="date" class="form-control" 
                                               id="date" name="date" placeholder="Select date">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-select">
                                            <select name="hour">
                                                <option slected>Hour</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-select">
                                            <select name="min">
                                                <option slected>Minute</option>
                                                <option value="00">00</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                                <option value="45">45</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <div class="form-select">
                                            <select name="attendance">
                                                <option slected>Select attendances</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="5">6</option>
                                                <option value="5">7</option>
                                                <option value="5">8</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <textarea class="form-control" rows="5" id="note" name="note" placeholder="Note"></textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="submit" value="submit" class="btn btn-primary form-control">Make Reservation</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- reservation item end-->

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
        <!-- magnific popup js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- carousel js -->
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
