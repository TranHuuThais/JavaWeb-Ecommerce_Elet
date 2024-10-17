<%-- 
    Document   : Notification
    Created on : Oct 15, 2024, 5:19:35 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" type="text/css" href="./assets/css/styles.css"/>

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
                    <div class="heading text-center">Notifications</div>
                </div>
            </div>
            <!-- /page-title -->

            <!-- Notification Section -->
            <div class="container mt-4">
                <h2 class="mb-3">Your Notifications</h2>
                <div class="list-group">
                   
                </div>
            </div>
            <!-- /Notification Section -->

            <%@include file="inc/footer.jsp" %>
        </div>

        <!-- Scripts -->
        <script src="./assets/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/swiper-bundle.min.js"></script>
        <script src="./assets/js/custom.js"></script>

    </body>
</html>
