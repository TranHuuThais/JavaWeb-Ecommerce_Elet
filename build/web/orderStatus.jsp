<%-- 
    Document   : orderStatus.jsp
    Created on : Oct 15, 2024, 11:01:36 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Elet</title>

        <meta name="author" content="themesflat.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- Font -->
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
    <body>
        <div id="wrapper">
            <%@include file="inc/topBar.jsp" %>
            <%@include file="inc/header.jsp" %>

            <!-- Page Title -->
            <div class="tf-page-title">
                <div class="container-fluid">
                    <h1 class="heading text-center">Order Cart</h1>
                </div>
            </div>
            <!-- /Page Title -->

            <main>
                <div class="container order-status my-4">
                    <c:if test="${not empty orderList}">
                        <div class="row">
                            <c:forEach items="${orderList}" var="order">
                                <div class="col-md-4 mb-3">
                                    <div class="card border-primary">
                                        <div class="card-header">
                                            <h5>Order Code: ${order.code}</h5>
                                        </div>
                                        <div class="card-body">
                                            <p><strong>Status:</strong> ${order.status}</p>
                                            <p><strong>Created At:</strong> ${order.createdAt}</p>
                                            <h6>Products:</h6>
                                            <ul>
                                                <c:forEach items="${order.products}" var="product">
                                                    <li>${product.name} - ${product.quantity} x ${product.price}</li>
                                                    </c:forEach>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </c:if>
                    <c:if test="${empty orderList}">
                        <div class="alert alert-warning" role="alert">
                            No orders found.
                        </div>
                    </c:if>

                </div>
            </main>
        </div>

        <!-- Bootstrap JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
