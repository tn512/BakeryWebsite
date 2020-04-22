<%-- 
    Document   : checkout
    Created on : Mar 23, 2020, 8:38:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zxx">

    <head>
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SickkidoBakery</title>
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
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/checkout.css">
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
                            <h2>checkout</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================Checkout Area =================-->
        <div class="body_checkout ">
            <div class="myrow">
                <div class="mycol-75">
                    <div class="mycontainer">
                        <c:set var="totalMoney" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="totalMoney" value="${totalMoney + item.product.price * item.quantity }"></c:set>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${sessionScope.coupon eq null}">
                                <c:set var="discount" value="0"></c:set>
                            </c:when>
                            <c:when test="${sessionScope.coupon.type eq true}">
                                <c:set var="discount" value="${sessionScope.coupon.discount*totalMoney/100}"></c:set>
                            </c:when>
                            <c:otherwise>
                                <c:set var="discount" value="${sessionScope.coupon.discount}"></c:set>
                            </c:otherwise>
                        </c:choose>
                            <form method="POST" action="checkout?action=order&total=${totalMoney-discount}">
                                <div class="row">
                                    <div class="col">
                                        <label for="firstName">First Name</label>
                                        <input type="text" class="form-control input-lg"
                                               id="firstName" name="firstName"
                                        <c:choose>
                                            <c:when test="${sessionScope.user eq null}">
                                                placeholder="Tuan Ngoc"
                                            </c:when>
                                            <c:otherwise>
                                                value="${sessionScope.user.firstName}"
                                            </c:otherwise>
                                        </c:choose> required>
                                </div>
                                <div class="col">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control input-lg"
                                           id="lastName" name="lastName"
                                           <c:choose>
                                               <c:when test="${sessionScope.user eq null}">
                                                   placeholder="Nguyen"
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.user.lastName}"
                                               </c:otherwise>
                                           </c:choose> required> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control input-lg" 
                                           id="email" name="email"
                                           <c:choose>
                                               <c:when test="${sessionScope.user eq null}">
                                                   placeholder="nthe141341@fpt.edu.vn"
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.user.email}"
                                               </c:otherwise>
                                           </c:choose> required>
                                </div>
                                <div class="col">
                                    <label for="phone">Telephone</label>
                                    <input class="form-control input-lg" type="tel"
                                           id="phone" name="phone"
                                           <c:choose>
                                               <c:when test="${sessionScope.user eq null}">
                                                   placeholder="0336081795"
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.user.phone}"
                                               </c:otherwise>
                                           </c:choose> required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="date">Required Date</label>
                                    <input type="date" class="form-control" 
                                           id="date" name="date" required>
                                </div>
                                <div class="col">
                                    <label for="payment">Payment</label>
                                    <div>
                                        <select id="payment" name="payment" class="form-control">
                                            <option value="1" selected >COD</option>
                                            <option value="2">Internet Banking</option>                        
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="address">Shipping Address</label>
                                    <input type="text" class="form-control input-lg"
                                           id="adress" name="address"
                                           <c:choose>
                                               <c:when test="${sessionScope.user eq null}">
                                                   placeholder="31 Khuong Thuong, Dong Da, Ha Noi"
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.user.address}"
                                               </c:otherwise>
                                           </c:choose> required>
                                </div>
                            </div>
                            <br/><button type="submit" class="btn btn-primary btn-lg">Checkout</button>
                        </form>
                    </div>
                </div>
                <div class="mycol-25">                   
                    <div class="mycontainer">
                        <div class="row">
                            <div class="col">
                                <form method="POST" action="checkout?action=coupon">
                                    <label for="coupon">Coupon</label>                                  
                                    <input type="input" class="form-control input-lg" id="coupon" name ="coupon"
                                           <c:choose>
                                               <c:when test="${sessionScope.coupon eq null}">
                                                   value=""
                                               </c:when>
                                               <c:otherwise>
                                                   value="${sessionScope.coupon.code}"
                                               </c:otherwise>
                                           </c:choose>>
                                    <button class="btn btn-primary">Enter</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="mycontainer">
                        <c:set var="number" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="number" value="${number + item.quantity }"></c:set>
                        </c:forEach>
                        <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${number}</b></span></h4>
                        <c:set var="total" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
                                <div class="product">
                                    <p style="color:black">${item.product.productName} x ${item.quantity}<span class="price">${item.product.price}</span></p>
                            </div>
                        </c:forEach>
                        <hr>
                        <p>Total <span class="price" style="color:black"><b>${total}</b></span></p>
                        <p>Discount <span class="price" style="color:black"><b>${discount}</b></span></p>
                        <p>Grand Total <span class="price" style="color:black"><b>${total-discount}</b></span></p>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Checkout Area =================-->

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
