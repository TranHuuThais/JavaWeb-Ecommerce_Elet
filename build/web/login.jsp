<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
    <!-- Mirrored from themesflat.co/html/ecomus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:28:04 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>Ecomus - Ultimate HTML</title>

        <meta name="author" content="themesflat.com" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
            />

        <!-- font -->
        <link rel="stylesheet" href="./assets/fonts/fonts.css" />
        <!-- Icons -->
        <link rel="stylesheet" href="./assets/fonts/font-icons.css" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./assets/css/animate.css" />
        <link rel="stylesheet" href="./assets/css/animate.css" />
        <link rel="stylesheet" type="text/css" href="./assets/css/styles.css" />

        <!-- Favicon and Touch Icons  -->
        <link rel="shortcut icon" href="images/logo/favicon.png" />
        <link rel="apple-touch-icon-precomposed" href="images/logo/favicon.png" />
    </head>

    <body class="preload-wrapper">
        <div id="wrapper">
            <!-- header -->
            <%@include file="inc/header.jsp" %>
            <!-- /header -->

            <!-- page-title -->
            <div class="tf-page-title style-2">
                <div class="container-full">
                    <div class="heading text-center">Log in</div>
                </div>
            </div>
            <!-- /page-title -->

            <section class="flat-spacing-10">
                <div class="container">
                    <div class="tf-grid-layout lg-col-2 tf-login-wrap">
                        <div class="tf-login-form">
                            <div id="recover">
                                <h5 class="mb_24">Reset your password</h5>
                                <p class="mb_30">
                                    We will send you an email to reset your password
                                </p>
                                <div>
                                    <form
                                        class=""
                                        id="login-form"
                                        action="#"
                                        method="post"
                                        accept-charset="utf-8"
                                        data-mailchimp="true"
                                        >
                                        <div class="tf-field style-1 mb_15">
                                            <input
                                                class="tf-field-input tf-input"
                                                placeholder=""
                                                type="email"
                                                id="property3"
                                                name="email"
                                                />
                                            <label
                                                class="tf-field-label fw-4 text_black-2"
                                                for="property3"
                                                >Email *</label
                                            >
                                        </div>
                                        <div class="mb_20">
                                            <a href="#login" class="tf-btn btn-line">Cancel</a>
                                        </div>
                                        <div class="">
                                            <button
                                                type="submit"
                                                class="tf-btn w-100 radius-3 btn-fill animate-hover-btn justify-content-center"
                                                >
                                                Reset password
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="login">
                                <h5 class="mb_36">Log in</h5>
                                <span class="error">${Error}</span>
                                <c:if test="${not empty sessionScope.success}">
                                    <span class="success">${sessionScope.success}</span>
                                    <c:remove var="success" scope="session" />
                                </c:if>
                                <c:remove var="error" scope="session"/>
                                <div>
                                    <form 
                                        class=""
                                        id="login-form"
                                        action="LoginServlet"
                                        accept-charset="utf-8"
                                        method="post"
                                        >
                                        <div class="tf-field style-1 mb_15">
                                            <input
                                                class="tf-field-input tf-input"
                                                placeholder=""
                                                type="email"
                                                id="property3"
                                                name="email"
                                                />
                                            <label
                                                class="tf-field-label fw-4 text_black-2"
                                                for="property3"
                                                >Email *</label
                                            >
                                        </div>
                                        <div class="tf-field style-1 mb_30">
                                            <input
                                                class="tf-field-input tf-input"
                                                placeholder=""
                                                type="password"
                                                id="property4"
                                                name="password"
                                                />
                                            <label
                                                class="tf-field-label fw-4 text_black-2"
                                                for="property4"
                                                >Password *</label
                                            >
                                        </div>
                                        <div class="mb_20">
                                            <a href="#recover" class="tf-btn btn-line"
                                               >Forgot your password?</a
                                            >
                                        </div>
                                        <div class="">
                                            <button
                                                type="submit"
                                                class="tf-btn w-100 radius-3 btn-fill animate-hover-btn justify-content-center"
                                                >
                                                Log in
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tf-login-content">
                            <h5 class="mb_36">I'm new here</h5>
                            <p class="mb_20">
                                Sign up for early Sale access plus tailored new arrivals, trends
                                and promotions. To opt out, click unsubscribe in our emails.
                            </p>
                            <a href="RegisterServlet" class="tf-btn btn-line"
                               >Register<i class="icon icon-arrow1-top-left"></i
                                ></a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <%@include file="inc/footer.jsp" %>
            <!-- /Footer -->
        </div>

        <!-- Javascript -->
        <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="./assets/js/carousel.js"></script>
        <script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
        <script type="text/javascript" src="./assets/js/count-down.js"></script>
        <script type="text/javascript" src="./assets/js/wow.min.js"></script>
        <script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
        <script type="text/javascript" src="./assets/js/main.js"></script>
    </body>

    <!-- Mirrored from themesflat.co/html/ecomus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:28:04 GMT -->
</html>
