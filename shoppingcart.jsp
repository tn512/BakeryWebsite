<%-- 
    Document   : shoppingcart
    Created on : Mar 23, 2020, 8:36:53 PM
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
        <!-- icon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- magnific popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/shoppingcart.css">
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
                            <h2>cart list</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!--================Cart Area =================-->
        <div class="section2">
            <form action="checkout" method="GET">
                <h1 style="padding-bottom: 70px">Shopping Cart</h1>

                <div class="shopping-cart">

                    <div class="column-labels">
                        <label class="product-image">Image</label>
                        <label class="product-details">Product</label>
                        <label class="product-price">Price</label>
                        <label class="product-quantity">Quantity</label>
                        <label class="product-removal">Remove</label>
                        <label class="product-line-price">Total</label>
                    </div>

                    <c:set var="total" value="0"></c:set>
                    <c:set var="number" value="0"></c:set>
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
                        <c:set var="number" value="${number + item.quantity }"></c:set>
                            <div class="product">

                                <div class="product-image">
                                    <img src="${item.product.image_alt}">
                            </div>
                            <div class="product-details" >
                                <div class="product-title">${item.product.productName}</div>
                                <p class="product-description">${item.product.description}</p>
                            </div>
                            <div class="product-price">${item.product.price}</div>
                            <div class="product-quantity">
                                ${item.quantity}
                            </div>
                            <div class="product-removal">
                                <a href="${pageContext.request.contextPath }/cart?action=remove&id=${item.product.product_id }"
                                   onclick="return confirm('Are you sure?')">Remove</a>
                            </div>
                            <div class="product-line-price">${item.product.price*item.quantity}</div>
                        </div>
                    </c:forEach>

                    <div class="totals">
                        <div class="totals-item">
                            <label>Subtotal</label>
                            <div class="totals-value" id="cart-subtotal">${total}</div>
                        </div>
                        <div class="totals-item totals-item-total">
                            <label>Grand Total</label>
                            <div class="totals-value" id="cart-total">${total}</div>
                        </div>
                    </div>
                    <c:if test = "${requestScope.invalid != null}">
                        <p style="color: red; text-align: right">${requestScope.invalid}</p>
                    </c:if>
                    <input type="submit" class="checkout"  value="Continue to checkout">
                </div>
            </form>
        </div>
        <!--================End Cart Area =================-->


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

        <script>

                                       //
                                       /* Set rates + misc */
                                       var taxRate = 0.05;
                                       var fadeTime = 300;


//                                       /* Assign actions */
//                                       $('.product-quantity input').change(function () {
//                                           updateQuantity(this);
//                                       });

//                                       $('.product-removal a').click(function () {
//                                           removeItem(this);
//                                       });


                                       /* Recalculate cart */
                                       function recalculateCart()
                                       {
                                           var subtotal = 0;

                                           /* Sum up row totals */
                                           $('.product').each(function () {
                                               subtotal += parseFloat($(this).children('.product-line-price').text());
                                           });

                                           /* Calculate totals */
                                           var tax = subtotal * taxRate;
                                           var total = subtotal + tax;

                                           /* Update totals display */
                                           $('.totals-value').fadeOut(fadeTime, function () {
                                               $('#cart-subtotal').html(subtotal.toFixed(2));
                                               $('#cart-tax').html(tax.toFixed(2));
                                               $('#cart-total').html(total.toFixed(2));
                                               if (total == 0) {
                                                   $('.checkout').fadeOut(fadeTime);
                                               } else {
                                                   $('.checkout').fadeIn(fadeTime);
                                               }
                                               $('.totals-value').fadeIn(fadeTime);
                                           });
                                       }


                                       /* Update quantity */
                                       function updateQuantity(quantityInput)
                                       {
                                           /* Calculate line price */
                                           var productRow = $(quantityInput).parent().parent();
                                           var price = parseFloat(productRow.children('.product-price').text());
                                           var quantity = $(quantityInput).val();
                                           var linePrice = price * quantity;

                                           /* Update line price display and recalc cart totals */
                                           productRow.children('.product-line-price').each(function () {
                                               $(this).fadeOut(fadeTime, function () {
                                                   $(this).text(linePrice.toFixed(2));
                                                   recalculateCart();
                                                   $(this).fadeIn(fadeTime);
                                               });
                                           });
                                       }


                                       /* Remove item from cart */
                                       function removeItem(removeButton)
                                       {
                                           /* Remove row from DOM and recalc cart total */
                                           var productRow = $(removeButton).parent().parent();
                                           productRow.slideUp(fadeTime, function () {
                                               productRow.remove();
                                               recalculateCart();
                                           });
                                       }
        </script>
    </body>

</html>