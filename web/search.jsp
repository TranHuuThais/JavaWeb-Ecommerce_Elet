<%-- 
    Document   : search
    Created on : Sep 21, 2024, 10:59:29 AM
    Author     : ACER
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Ecomus - Ultimate HTML</title>

    <meta name="author" content="themesflat.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

   <!-- font -->
   <link rel="stylesheet" href="./assets/fonts/fonts.css">
   <!-- Icons -->
   <link rel="stylesheet" href="./assets/fonts/font-icons.css">
   <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css">
   <link rel="stylesheet" href="./assets/css/animate.css">
   <link rel="stylesheet" href="./assets/css/animate.css">
       <link rel="stylesheet"type="text/css" href="./assets/css/styles.css"/>

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="./assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="./assets/images/logo/favicon.png">

</head>

<body class="preload-wrapper">

    <div id="wrapper">
        <%@include file="inc/topBar.jsp" %>
        <%@include file="inc/header.jsp" %>

        <!-- page-title -->
        <div class="tf-page-title">
            <div class="container-full">
                <div class="heading text-center">${keyword}</div>
                <p class="text-center text-2 text_black-2 mt_5">Shop through our latest selection of Fashion</p> 
<!--                <form action="SearchServlet" style="margin-left: 35%" class="search" method="get">
                <div class="form-search" onsubmit="return searchFunction(event)">
                    <input  name="keyword"class="search w-50 p-2 rounded-top" type="search" placeholder="Search" aria-label="Search" oninput="searchFunction(event)">

                </div>
            </form>-->
            </div>
        </div>
        
        <!-- /page-title -->
                <!-- Section Product -->
        <section class="flat-spacing-2">
            <div class="container">
                <div class="tf-shop-control grid-3 align-items-center">
                    <div class="tf-control-filter">
                        <a href="#filterShop" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="tf-btn-filter"><span class="icon icon-filter"></span><span class="text">Filter</span></a>
                    </div>
                    <ul class="tf-control-layout d-flex justify-content-center">
                        <li class="tf-view-layout-switch sw-layout-2" data-value-grid="grid-2">
                            <div class="item"><span class="icon icon-grid-2"></span></div>
                        </li>
                        <li class="tf-view-layout-switch sw-layout-3" data-value-grid="grid-3">
                            <div class="item"><span class="icon icon-grid-3"></span></div>
                        </li>
                        <li class="tf-view-layout-switch sw-layout-4 active" data-value-grid="grid-4">
                            <div class="item"><span class="icon icon-grid-4"></span></div>
                        </li>
                        <li class="tf-view-layout-switch sw-layout-5" data-value-grid="grid-5">
                            <div class="item"><span class="icon icon-grid-5"></span></div>
                        </li>
                        <li class="tf-view-layout-switch sw-layout-6" data-value-grid="grid-6">
                            <div class="item"><span class="icon icon-grid-6"></span></div>
                        </li>
                    </ul>
                    <div class="tf-control-sorting d-flex justify-content-end">
                        <div class="tf-dropdown-sort" data-bs-toggle="dropdown">
                            <div class="btn-select">
                                <span class="text-sort-value">Featured</span>
                                <span class="icon icon-arrow-down"></span>
                            </div>
                            <div class="dropdown-menu">
                                <div class="select-item active">
                                    <span class="text-value-item">Featured</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Best selling</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Alphabetically, A-Z</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Alphabetically, Z-A</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Price, low to high</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Price, high to low</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Date, old to new</span>
                                </div>
                                <div class="select-item">
                                    <span class="text-value-item">Date, new to old</span>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="grid-layout wrapper-shop" data-grid="grid-4">
                    <!-- card product 1 -->
                        <c:forEach items="${productList}" var="product">
                    <div class="card-product">
                        <div class="card-product-wrapper">
                            <a href="product-detail.html" class="product-img">
                                <img style="height: 400px; object-fit: cover; width: 90%;"class="lazyload img-product" data-src="${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
                                <img style="height: 400px; object-fit: cover; width: 90%;"class="lazyload img-hover" data-src="${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
                            </a>
                            
                        </div>
                        <div class="card-product-info">
                            <a href="product-detail.html" class="title link">${product.name}</a>
                            <span class="price">$${product.price}</span>
                            <ul class="list-color-product">
                                <li class="list-color-item color-swatch active">
                                    <span class="tooltip">Orange</span>
                                    <span class="swatch-value bg_orange-3"></span>
                                    <img class="lazyload" data-src="images/products/orange-1.jpg" src="images/products/orange-1.jpg" alt="image-product">
                                </li>
                                <li class="list-color-item color-swatch">
                                    <span class="tooltip">Black</span>
                                    <span class="swatch-value bg_dark"></span>
                                    <img class="lazyload" data-src="images/products/black-1.jpg" src="images/products/black-1.jpg" alt="image-product">
                                </li>
                                <li class="list-color-item color-swatch">
                                    <span class="tooltip">White</span>
                                    <span class="swatch-value bg_white"></span>
                                    <img class="lazyload" data-src="images/products/white-1.jpg" src="images/products/white-1.jpg" alt="image-product">
                                </li>
                            </ul>
                        </div>
                    </div>
                        </c:forEach>
                  
                </div>
                <!<!-- pagination -->
              <section id="pagination" class="section-p1">
                                <c:if test="${numberPage > 1}">
                                    <ul class="wg-pagination justify-content-center">
                                        <c:if test="${page > 1}">
                                            <li>
                                                <a href="ShopServlet?page=${page - 1}"
                                                    class="pagination-item animate-hover-btn">
                                                    <i class="fa-solid fa-arrow-left"></i>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach var="i" begin="1" end="${numberPage}">
                                            <li class="${page == i ? 'active' : ''}">
                                                <a href="ShopServlet?page=${i}"
                                                    class="pagination-item animate-hover-btn">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${page < numberPage}">
                                            <li>
                                                <a href="ShopServlet?page=${page + 1}"
                                                    class="pagination-item animate-hover-btn">
                                                    <i class="fa-solid fa-arrow-right"></i>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </c:if>
                            </section>

            </div>
        </section>
        <!-- /Section Product -->
        <!<!-- footer -->
        <%@include file="inc/footer.jsp" %>
        <!<!-- footer-end -->

    </div>
    <!-- Filter -->
    <div class="offcanvas offcanvas-start canvas-filter" id="filterShop">
        <div class="canvas-wrapper">
            <header class="canvas-header">
                <div class="filter-icon">
                    <span class="icon icon-filter"></span>
                    <span>Filter</span>
                </div>
                <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
            </header>
            <div class="canvas-body">
                <div class="widget-facet wd-categories">
                    <div class="facet-title" data-bs-target="#categories" data-bs-toggle="collapse" aria-expanded="true" aria-controls="categories">
                        <span>Product categories</span>
                        <span class="icon icon-arrow-up"></span>
                    </div>
                    <div id="categories" class="collapse show">
                        <ul class="list-categoris current-scrollbar mb_36">
                            <li class="cate-item current"><a href="shop-default.html"><span>Fashion</span></a></li>
                            <li class="cate-item"><a href="shop-default.html"><span>Men</span></a></li>
                            <li class="cate-item"><a href="shop-default.html"><span>Women</span></a></li>
                            <li class="cate-item"><a href="shop-default.html"><span>Denim</span></a></li>
                            <li class="cate-item"><a href="shop-default.html"><span>Dress</span></a></li>
                        </ul>
                    </div>
                </div>
                <form action="#" id="facet-filter-form" class="facet-filter-form">
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#availability" data-bs-toggle="collapse" aria-expanded="true" aria-controls="availability">
                            <span>Availability</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="availability" class="collapse show">
                            <ul class="tf-filter-group current-scrollbar mb_36">
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="availability" class="tf-check" id="availability-1">
                                    <label for="availability-1" class="label"><span>In stock</span>&nbsp;<span>(14)</span></label>
                                </li>
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="availability" class="tf-check" id="availability-2">
                                    <label for="availability-2" class="label"><span>Out of stock</span>&nbsp;<span>(2)</span></label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#price" data-bs-toggle="collapse" aria-expanded="true" aria-controls="price">
                            <span>Price</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="price" class="collapse show">
                            <div class="widget-price">
                                <div id="slider-range"></div>
                                <div class="box-title-price">
                                    <span class="title-price">Price :</span>
                                    <div class="caption-price">
                                        <div>
                                            <span>$</span>
                                            <span id="slider-range-value1" class=""></span>
                                        </div>
                                        <span>-</span>
                                        <div>
                                            <span>$</span>
                                            <span id="slider-range-value2" class=""></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#brand" data-bs-toggle="collapse" aria-expanded="true" aria-controls="brand">
                            <span>Brand</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="brand" class="collapse show">
                            <ul class="tf-filter-group current-scrollbar mb_36">
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="brand" class="tf-check" id="brand-1">
                                    <label for="brand-1" class="label"><span>Ecomus</span>&nbsp;<span>(8)</span></label>
                                </li>
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="brand" class="tf-check" id="brand-2">
                                    <label for="brand-2" class="label"><span>M&H</span>&nbsp;<span>(8)</span></label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#color" data-bs-toggle="collapse" aria-expanded="true" aria-controls="color">
                            <span>Color</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        
                    </div>
                    <div class="widget-facet">
                        <div class="facet-title" data-bs-target="#size" data-bs-toggle="collapse" aria-expanded="true" aria-controls="size">
                            <span>Size</span>
                            <span class="icon icon-arrow-up"></span>
                        </div>
                        <div id="size" class="collapse show">
                            <ul class="tf-filter-group current-scrollbar">
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="size" class="tf-check" id="s">
                                    <label for="s" class="label"><span>S</span>&nbsp;<span>(7)</span></label>
                                </li>
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="size" class="tf-check" id="m">
                                    <label for="m" class="label"><span>M</span>&nbsp;<span>(8)</span></label>
                                </li>
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="size" class="tf-check" id="l">
                                    <label for="l" class="label"><span>L</span>&nbsp;<span>(8)</span></label>
                                </li>
                                <li class="list-item d-flex gap-12 align-items-center">
                                    <input type="radio" name="size" class="tf-check" id="xl">
                                    <label for="xl" class="label"><span>XL</span>&nbsp;<span>(6)</span></label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>    
            </div>
            
        </div>       
    </div>
    <!-- End Filter -->
    <!-- Javascript -->
    <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="./assets/js/carousel.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="./assets/js/count-down.js"></script>
    <script type="text/javascript" src="./assets/js/wow.min.js"></script>
    <script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
    <script type="text/javascript" src="./assets/js/main.js"></script>
</body>


</html>
