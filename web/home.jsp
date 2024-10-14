<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <meta charset="utf-8">
            <title>Elet</title>

            <meta name="author" content="themesflat.com">
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

                    <!-- font -->
                    <link rel="stylesheet" href="assets/fonts/fonts.css">
                        <!-- Icons -->
                        <link rel="stylesheet" href="assets/fonts/font-icons.css">
                            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
                                <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
                                    <link rel="stylesheet" href="assets/css/animate.css">
                                        <link rel="stylesheet" type="text/css" href="assets/css/styles.css" />


                                        <!-- Favicon and Touch Icons  -->
                                        <link rel="shortcut icon" href="./assets/images/logo/favicon.png">
                                            <link rel="apple-touch-icon-precomposed" href="./assets/images/logo/favicon.png">

                                                </head>

                                                <body class="preload-wrapper color-primary-3">
                                                    <div id="wrapper">
                                                        <%@include file="inc/topBar.jsp" %>
                                                        <%@include file="inc/header.jsp" %>

                                                        <!-- Slider -->
                                                        <div class="tf-slideshow slider-home-2 slider-effect-fade position-relative">
                                                            <div class="swiper tf-sw-slideshow" data-preview="1" data-tablet="1" data-mobile="1"
                                                                 data-centered="false" data-space="0" data-loop="true" data-auto-play="true" data-delay="2000"
                                                                 data-speed="1000">
                                                                <div class="swiper-wrapper">
                                                                    <div class="swiper-slide" lazy="true">
                                                                        <div class="wrap-slider">
                                                                            <img class="lazyload" data-src="./assets/images/slider/Slideshow_Electronics1.jpg"
                                                                                 src="./assets/images/slider/Slideshow_Electronics1.jpg"
                                                                                 alt="fashion-slideshow-01">
                                                                                <div class="box-content">
                                                                                    <div class="container">
                                                                                        <p class="fade-item fade-item-1">UP TO 40% OFF CHARGERS AND MORE.</p>
                                                                                        <h1 class="fade-item fade-item-2">Savings for<br> dads and grads.</h1>
                                                                                        <a href="shop-default.html"
                                                                                           class="fade-item fade-item-3 rounded-full tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop
                                                                                                collection</span><i class="icon icon-arrow-right"></i></a>
                                                                                    </div>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="swiper-slide" lazy="true">
                                                                        <div class="wrap-slider">
                                                                            <img class="lazyload" data-src="./assets/images/slider/Slideshow_Electronics2.jpg"
                                                                                 src="./assets/images/slider/Slideshow_Electronics2.jpg"
                                                                                 alt="fashion-slideshow-01">
                                                                                <div class="box-content">
                                                                                    <div class="container">
                                                                                        <p class="fade-item fade-item-1">UP TO 40% OFF CHARGERS AND MORE.</p>
                                                                                        <h1 class="fade-item fade-item-2">Modern design</h1>
                                                                                        <a href="shop-default.html"
                                                                                           class="fade-item fade-item-3 rounded-full tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop
                                                                                                collection</span><i class="icon icon-arrow-right"></i></a>
                                                                                    </div>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="swiper-slide" lazy="true">
                                                                        <div class="wrap-slider">
                                                                            <img class="lazyload" data-src="./assets/images/slider/Slideshow_Electronics3.jpg"
                                                                                 src="./assets/images/slider/Slideshow_Electronics3.jpg"
                                                                                 alt="fashion-slideshow-01">
                                                                                <div class="box-content">
                                                                                    <div class="container">
                                                                                        <p class="fade-item fade-item-1">UP TO 40% OFF CHARGERS AND MORE.</p>
                                                                                        <h1 class="fade-item fade-item-2">Fast charging</h1>
                                                                                        <a href="shop-default.html"
                                                                                           class="fade-item fade-item-3 rounded-full tf-btn btn-fill animate-hover-btn btn-xl radius-3"><span>Shop
                                                                                                collection</span><i class="icon icon-arrow-right"></i></a>
                                                                                    </div>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wrap-pagination sw-absolute-2">
                                                                <div class="container">
                                                                    <div class="sw-dots sw-pagination-slider justify-content-center"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /Slider -->
                                                        <!-- HOt Products -->
                                                        <section class="flat-spacing-19">
                                                            <div class="container">
                                                                <div class="flat-title flex-row justify-content-between px-0">
                                                                    <span class="title wow fadeInUp" style="margin-left: 38%" data-wow-delay="0s">Trending Products</span>
                                                                    <div class="box-sw-navigation">
                                                                        <div class="nav-sw square nav-next-slider nav-next-sell-1"><span
                                                                                class="icon icon-arrow1-left"></span></div>
                                                                        <div class="nav-sw square nav-prev-slider nav-prev-sell-1"><span
                                                                                class="icon icon-arrow1-right"></span></div>
                                                                    </div>
                                                                </div>
                                                                <div class="hover-sw-nav hover-sw-2">
                                                                    <div class="swiper tf-sw-product-sell-1 wrap-sw-over" data-preview="4" data-tablet="3"
                                                                         data-mobile="2" data-space-lg="30" data-space-md="15" data-pagination="2"
                                                                         data-pagination-md="3" data-pagination-lg="3">
                                                                        <div class="swiper-wrapper">
                                                                            <c:forEach items="${hotProductList}" var="product">
                                                                                <div class="swiper-slide height-auto">
                                                                                    <div class="card-product overflow-hidden bg_white radius-20 border-line h-100">
                                                                                        <div class="card-product-wrapper">
                                                                                            <a href="ProductServelt?productId=${product.id}" class="product-img">
                                                                                                <img class="lazyload" data-src="${product.thumbnail}" src="Category" alt="collection-img" style="height: 400px; object-fit: cover; width: 100%;"> <!-- Inline style for fixed height -->
                                                                                            </a>
                                                                                            <div class="list-product-btn absolute-2">

                                                                                                <a href="ProductServelt?productId=${product.id}" 
                                                                                                   class="box-icon bg_white quickview tf-btn-loading">
                                                                                                    <span class="icon icon-view"></span>
                                                                                                    <span class="tooltip">Quick View</span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="card-product-info has-padding">
                                                                                            <a href="product-detail.html" class="title link">${product.name}</a>
                                                                                            <span class="price">${product.price}</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>



                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- /Products -->
                                                        <!-- Marquee -->
                                                        <div class="tf-marquee marquee-sm bg_primary not-hover">
                                                            <div class="wrap-marquee">
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">LIMITED TIME OFFER: FASHION SALE YOU CAN'T RESIST</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">FREE SHIPPING AND RETURN</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">NEW SEASON, NEW STYLES: FASHION SALE YOU CAN'T MISS</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">LIMITED TIME OFFER: FASHION SALE YOU CAN'T RESIST</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">FREE SHIPPING AND RETURN</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">NEW SEASON, NEW STYLES: FASHION SALE YOU CAN'T MISS</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">LIMITED TIME OFFER: FASHION SALE YOU CAN'T RESIST</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">FREE SHIPPING AND RETURN</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">NEW SEASON, NEW STYLES: FASHION SALE YOU CAN'T MISS</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">LIMITED TIME OFFER: FASHION SALE YOU CAN'T RESIST</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">FREE SHIPPING AND RETURN</p>
                                                                </div>
                                                                <div class="marquee-item">
                                                                    <div class="icon">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="7" height="6" viewBox="0 0 7 6"
                                                                             fill="none">
                                                                            <path d="M3.5 0L6.53109 5.25H0.468911L3.5 0Z" fill="black"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="text text-uppercase fw-6">NEW SEASON, NEW STYLES: FASHION SALE YOU CAN'T MISS</p>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <!-- /Marquee -->

                                                        <!-- Banner Collection -->
                                                        <section class="flat-spacing-8 pb_0">
                                                            <div class="container">
                                                                <div class="tf-banner-collection">
                                                                    <img class="lazyload" data-src="./assets/images/collections/banner-collection-3.jpg"
                                                                         src="./assets/images/collections/banner-collection-3.jpg" alt="img-banner"
                                                                         loading="lazy">
                                                                        <div class="box-content">
                                                                            <div class="container wow fadeInUp" data-wow-delay="0s">
                                                                                <div class="sub fw-7 text_white">SALE UP TO 30% OFF TODAY</div>
                                                                                <h2 class="heading fw-6 text_white">Best Deals Discounts</h2>
                                                                                <p class="text_white">Fast wireless charging on-the-go.</p>
                                                                                <a href="shop-default.html"
                                                                                   class="rounded-full tf-btn btn-primary-main style-3 fw-6 btn-light-icon animate-hover-btn"><span>Shop
                                                                                        Collection</span></a>
                                                                            </div>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- /Banner Collection -->
                                                        <!-- Collection -->
                                                        <section class="flat-spacing-8 pb_0">
                                                            <div class="container">
                                                                <div class="swiper tf-sw-recent" data-preview="2" data-tablet="2" data-mobile="1.3"
                                                                     data-space-lg="30" data-space-md="15" data-space="15" data-pagination="1"
                                                                     data-pagination-md="1" data-pagination-lg="1">

                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- /Collection -->
                                                        <!-- Shop Collection -->
                                                        <section class="flat-spacing-8 pb_0">
                                                            <div class="container">
                                                                <div class="tf-grid-layout gap-0 md-col-2 bg_primary tf-img-with-text style-5">
                                                                    <div class="tf-image-wrap wow fadeInUp" data-wow-delay="0s">
                                                                        <img class="lazyload" data-src="./assets/images/collections/collection-72.jpg"
                                                                             src="./assets/images/collections/collection-72.jpg" alt="collection-img">
                                                                    </div>
                                                                    <div class="tf-content-wrap wow fadeInUp" data-wow-delay="0s">
                                                                        <div class="sub-heading fw-7">ULTIMATE APPLE ACCESSORY.</div>
                                                                        <div class="heading">60% Discount</div>
                                                                        <p class="description text_black-2">Find the latest and greatest gadgets to enhance your
                                                                            electronic devices.

                                                                        </p>
                                                                        <div class="count-down">
                                                                            <div class="description"><strong>Hungry up ! </strong>Deals end in :</div>
                                                                            <div class="tf-countdown-v2">
                                                                                <div class="js-countdown" data-timer="8007500"
                                                                                     data-labels="Days,Hours,Mins,Secs"></div>
                                                                            </div>
                                                                        </div>
                                                                        <a href="shop-collection-list.html"
                                                                           class="tf-btn style-2 btn-fill rounded-full animate-hover-btn">Shop Now</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- /Shop Collection -->

                                                        <!-- Look book -->
                                                        <section class="flat-spacing-16">
                                                            <div class="container">
                                                                <div class="flat-lookbook-v2">
                                                                    <div class="col-left">
                                                                        <div class="wrap-lookbook lookbook-sw radius-10 o-hidden">
                                                                            <div class="image">
                                                                                <img
                                                                                    class="lazyload"
                                                                                    data-src="assets/images//products/headphone-1.png"
                                                                                    src="assets/images//products/headphone-1.png"
                                                                                    alt="collection-img"
                                                                                    />
                                                                            </div>
                                                                            <div class="navigation-sw-dot nav-next-lookbook"><span></span></div>
                                                                            <div class="navigation-sw-dot nav-prev-lookbook"><span></span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-right">
                                                                        <div class="slider-wrap-lookbook">
                                                                            <div class="nav-sw nav-next-slider nav-next-lookbook">
                                                                                <span class="icon icon-arrow-left"></span>
                                                                            </div>
                                                                            <div class="inner-sw-lookbook">
                                                                                <div class="flat-title-lookbook">
                                                                                    <p class="label">SPRING SALE 30% OFF</p>
                                                                                    <h3 class="heading">Shop this look</h3>
                                                                                </div>
                                                                                <div
                                                                                    class="swiper tf-sw-lookbook wrap-sw-over"
                                                                                    data-preview="1"
                                                                                    data-tablet="1"
                                                                                    data-mobile="1"
                                                                                    data-space-lg="30"
                                                                                    data-space-md="15"
                                                                                    >

                                                                                    <div class="swiper-wrapper">
                                                                                        <c:forEach items="${newsProductList}" var="product">

                                                                                            <div class="swiper-slide" lazy="true">
                                                                                                <div class="card-product">
                                                                                                    <div class="card-product-wrapper">
                                                                                                        <a href="ProductServelt?productId=${product.id}" class="product-img">
                                                                                                            <img
                                                                                                                class="lazyload img-product"
                                                                                                                data-src="${product.thumbnail}"
                                                                                                                src="${product.thumbnail}"
                                                                                                                alt="image-product"
                                                                                                                />

                                                                                                        </a>
                                                                                                        <div class="list-product-btn absolute-2">
                                                                                                            <a href="ProductServelt?productId=${product.id}" 
                                                                                                               class="box-icon bg_white quickview tf-btn-loading">
                                                                                                                <span class="icon icon-view"></span>
                                                                                                                <span class="tooltip">Quick View</span>
                                                                                                            </a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="card-product-info">
                                                                                                        <a href="product-detail.html" class="title link"
                                                                                                           >${product.name}</a
                                                                                                        >
                                                                                                        <span class="price">From $${product.price}</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                        </c:forEach>
                                                                                    </div>
                                                                                    <div
                                                                                        class="sw-dots style-2 sw-pagination-lookbook d-md-none"
                                                                                        ></div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="nav-sw nav-prev-slider nav-prev-lookbook">
                                                                                <span class="icon icon-arrow-right"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </section>
                                                        <!-- /Look book -->


                                                        <%@include file="inc/footer.jsp" %>
                                                    </div>



                                                    <!-- toolbar-bottom -->
                                                    <div class="tf-toolbar-bottom type-1150">
                                                        <div class="toolbar-item active">
                                                            <a href="#toolbarShopmb" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft">
                                                                <div class="toolbar-icon">
                                                                    <i class="icon-shop"></i>
                                                                </div>
                                                                <div class="toolbar-label">Shop</div>
                                                            </a>
                                                        </div>

                                                        <div class="toolbar-item">
                                                            <a href="#canvasSearch" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft">
                                                                <div class="toolbar-icon">
                                                                    <i class="icon-search"></i>
                                                                </div>
                                                                <div class="toolbar-label">Search</div>
                                                            </a>
                                                        </div>
                                                        <div class="toolbar-item">
                                                            <a href="#login" data-bs-toggle="modal">
                                                                <div class="toolbar-icon">
                                                                    <i class="icon-account"></i>
                                                                </div>
                                                                <div class="toolbar-label">Account</div>
                                                            </a>
                                                        </div>
                                                        <div class="toolbar-item">
                                                            <a href="wishlist.html">
                                                                <div class="toolbar-icon">
                                                                    <i class="icon-heart"></i>
                                                                    <div class="toolbar-count">0</div>
                                                                </div>
                                                                <div class="toolbar-label">Wishlist</div>
                                                            </a>
                                                        </div>
                                                        <div class="toolbar-item">
                                                            <a href="#shoppingCart" data-bs-toggle="modal">
                                                                <div class="toolbar-icon">
                                                                    <i class="icon-bag"></i>
                                                                    <div class="toolbar-count">1</div>
                                                                </div>
                                                                <div class="toolbar-label">Cart</div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <!-- /toolbar-bottom -->


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
