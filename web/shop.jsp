
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
                <div class="heading text-center">#${keyword}</div>
                <p class="text-center text-2 text_black-2 mt_5">Shop through our latest selection of Fashion</p> 
                <form action="SearchServlet"style="margin-left: 35%" class="search" method="get">
                <div class="form-search">
                    <input name="keyword" class="search w-50 p-2 rounded-top" type="search" placeholder="Search" aria-label="Search">
                </div>
            </form>
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
              
                </div>
                <div class="grid-layout wrapper-shop" data-grid="grid-4">
                    <!-- card product 1 -->
                        <c:forEach items="${ProductList}" var="product">
                    <div class="card-product">
                        <div class="card-product-wrapper">
                            <a href="product-detail.html" class="product-img">
                                <img style="height: 400px; object-fit: cover; width: 90%;"class="lazyload img-product" data-src="${pageContext.request.contextPath}/uploads/${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
                                <img style="height: 400px; object-fit: cover; width: 90%;"class="lazyload img-hover" data-src="${pageContext.request.contextPath}/uploads/${product.thumbnail}" src="${product.thumbnail}" alt="image-product">
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
        <header class="canvas-header d-flex justify-content-between align-items-center p-3 border-bottom">
            <div class="filter-icon d-flex align-items-center">
                <span class="icon icon-filter me-2"></span>
                <span>Filter</span>
            </div>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </header>
        <div class="canvas-body p-3">
            <div class="widget-facet wd-categories">
                <form action="ShopServlet" class="filter" method="get">
                    <input type="hidden" name="categoryId" value="${category.id}" />

                    <!-- Sort By Dropdown -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <select name="sort" class="form-select" aria-label="Sort By">
                                <option value="name" <c:if test="${param.sort == 'name'}">selected</c:if>>Sort By Name</option>
                                <option value="price" <c:if test="${param.sort == 'price'}">selected</c:if>>Sort By Price</option>
                                <option value="createdAt" <c:if test="${param.sort == 'createdAt'}">selected</c:if>>Sort By Time</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <select name="order" class="form-select" aria-label="Order By">
                                <option value="ASC" <c:if test="${param.order == 'ASC'}">selected</c:if>>A -> Z</option>
                                <option value="DESC" <c:if test="${param.order == 'DESC'}">selected</c:if>>Z -> A</option>
                            </select>
                        </div>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Filter</button>
                    </div>
                </form>
            </div>
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