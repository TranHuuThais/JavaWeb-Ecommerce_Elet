<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Ecomus - Ultimate HTML</title>
        <meta name="author" content="themesflat.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- Font -->
        <link rel="stylesheet" href="./assets/fonts/fonts.css">
        <link rel="stylesheet" href="./assets/fonts/font-icons.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/drift-basic.min.css">
        <link rel="stylesheet" href="./assets/css/photoswipe.css">
        <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="./assets/css/animate.css">
        <link rel="stylesheet" href="./assets/css/styles.css">

        <!-- Favicon and Touch Icons -->
        <link rel="shortcut icon" href="./assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="./assets/images/logo/favicon.png">
    </head>

    <body>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ include file="inc/header.jsp" %>

        <section id="prodetails" class="section-p1">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="single-pro-img">
                            <img src="${pageContext.request.contextPath}/uploads/${product.thumbnail}" alt="${product.name}" id="MainImg" width="100%">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <form action="CartServlet" method="post" class="single-pro-details">
                            <input type="hidden" name="action" value="create"/>
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="price" value="${product.price}"/>
                            <div class="tf-product-info-wrap sticky-top">
                                <div class="tf-zoom-main"></div>
                                <div class="tf-product-info-list other-image-zoom">
                                    <div class="tf-product-info-title mt-3">
                                        <h5>${product.name}</h5>
                                    </div>
                                    <div class="tf-product-info-price">
                                        <div class="price-on-sale">$${product.price}</div>
                                    </div>

                                    <div class="tf-product-info-quantity">
                                        <div class="quantity-title fw-6">Quantity</div>
                                        <div class="wg-quantity">
                                            <span class="btn-quantity minus-btn">-</span>
                                            <input type="text" name="quantity" value="1">
                                            <span class="btn-quantity plus-btn">+</span>
                                        </div>
                                    </div>
                                    <div class="tf-product-info-buy-button" style="display: flex">
                                        <button type="submit" class="tf-btn btn-fill justify-content-center fw-6 fs-16 flex-grow-1 animate-hover-btn">
                                            <span>Add to cart</span>
                                        </button>

                                        <a href="#compare" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="tf-product-btn-wishlist hover-tooltip box-icon bg_white compare btn-icon-action">
                                            <span class="icon icon-compare"></span>
                                            <span class="tooltip">Add to Compare</span>
                                            <span class="icon icon-check"></span>
                                        </a>
                                    </div>
                                </div>
                        </form>
                        <div class="b1">
                            <a href="#" class="btns-full">Buy with <img src="./assets/images/payments/paypal.png" alt="PayPal"></a>
                            <a href="#" class="payment-more-option">More payment options</a>
                        </div>
                        <div class="text-center">
                            <c:if test="${not empty qrCodeImage}">
                                <img src="data:image/png;base64,${qrCodeImage}" alt="QR Code" class="img-fluid rounded" style="max-width: 200px;" />
                            </c:if>
                        </div>
                        <div class="tf-pickup-availability">
                            <div>
                                <svg width="18" height="18" viewBox="0 0 18 18" class="mt_3">
                                <path d="M7.6 13.2L14.65 6.15L13.25 4.75L7.6 10.4L4.75 7.55L3.35 8.95L7.6 13.2ZM0 18V0H18V18H0ZM2 16H16V2H2V16Z" fill="#428445"></path>
                                </svg>
                            </div>
                            <div>
                                <p>Pickup available at <span class="fw-6">Toronto - Spadina Avenue</span>. Usually ready in 24 hours.</p>
                                <a href="#pickup_available" data-bs-toggle="modal">Check availability at other stores</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <!-- Product Section -->
        <section class="flat-spacing-1 pt_0">
            <div class="container">
                <div class="flat-title">
                    <span class="title">New Product</span>
                </div>
                <div class="hover-sw-nav hover-sw-2">
                    <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3" data-mobile="2"
                         data-space-lg="30" data-space-md="15" data-pagination="2" data-pagination-md="3"
                         data-pagination-lg="3">
                        <div class="swiper-wrapper">
                            <c:forEach items="${newsProductList}" var="product">
                                <div class="swiper-slide" lazy="true">
                                    <div class="card-product">
                                        <div class="card-product-wrapper">
                                            <img class="lazyload" src="${pageContext.request.contextPath}/uploads/${product.thumbnail}" alt="${product.name}">
                                            <span class="box-icon">
                                                <i class="icon-icon icon-arrow1-top-left"></i>
                                            </span>
                                            <div class="list-product-btn">

                                                <a href="#quick_view" data-bs-toggle="modal"
                                                   class="box-icon bg_white quickview tf-btn-loading">
                                                    <span class="icon icon-view"></span>
                                                    <span class="tooltip">Quick View</span>
                                                </a>
                                            </div>

                                        </div>
                                        <div class="card-product-info">
                                            <a href="product-detail.jsp" class="title link">${product.name}</a>
                                            <span class="price">$${product.price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>  
                        </div>
                    </div>
                    <div class="nav-sw nav-next-slider nav-next-product box-icon w_46 round">
                        <span class="icon icon-arrow-left"></span>
                    </div>
                    <div class="nav-sw nav-prev-slider nav-prev-product box-icon w_46 round">
                        <span class="icon icon-arrow-right"></span>
                    </div>
                    <div class="sw-dots style-2 sw-pagination-product justify-content-center"></div>
                </div>
            </div>
        </section>
        <!-- /Product Section -->

        <%@ include file="inc/footer.jsp" %>
        <!-- Javascript -->
        <script type="text/javascript" src="./assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="./assets/js/carousel.js"></script>
        <script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
        <script type="text/javascript" src="./assets/js/count-down.js"></script>
        <script type="text/javascript" src="./assets/js/wow.min.js"></script>
        <script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
        <script type="text/javascript" src="./assets/js/main.js"></script>
    </body>

</html>
