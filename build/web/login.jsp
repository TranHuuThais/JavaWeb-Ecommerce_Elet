<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">
<head>
    <meta charset="utf-8" />
    <title>Ecomus - Ultimate HTML</title>
    <meta name="author" content="themesflat.com" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- Font -->
    <link rel="stylesheet" href="./assets/fonts/fonts.css" />
    <link rel="stylesheet" href="./assets/fonts/font-icons.css" />
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css" />
    <link rel="stylesheet" href="./assets/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/styles.css" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/logo/favicon.png" />
    <link rel="apple-touch-icon-precomposed" href="images/logo/favicon.png" />
</head>

<body class="preload-wrapper">
    <div id="wrapper">
        <!-- Header -->
        <%@include file="inc/header.jsp" %>
        <!-- /Header -->

        <section class="flat-spacing-10">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8">
                        <div class="form-register-wrap mx-auto" style="max-width: 500px">
                            <div class="flat-title mb-4">
                                <h5 class="text-center">Log in</h5>
                                <p class="text-muted text-center">Access your account to explore amazing features.</p>
                            </div>
                            <span class="error">${Error}</span>
                            <c:if test="${not empty sessionScope.success}">
                                <span class="success">${sessionScope.success}</span>
                                <c:remove var="success" scope="session" />
                            </c:if>
                            <c:remove var="error" scope="session"/>

                            <form id="login-form" action="LoginServlet" method="post" accept-charset="utf-8">
                                <div class="mb-3 position-relative">
                                    <input type="email" class="form-control" id="login-email" name="email" placeholder="Email" required />
                                    <i class="fa-solid fa-envelope position-absolute top-50 end-0 translate-middle-y me-3"></i>
                                </div>
                                <div class="mb-3 position-relative">
                                    <input type="password" class="form-control" id="login-password" name="password" placeholder="Password" required />
                                    <i class="fa-solid fa-lock position-absolute top-50 end-0 translate-middle-y me-3"></i>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <a href="#recover" class="link-primary">Forgot your password?</a>
                                    <a href="RegisterServlet" class="link-primary">Sign Up</a>
                                </div>
                                <button type="submit" class="btn btn-dark w-100">Log in</button>
                            </form>

                            <div class="text-center my-3">
                                <h6>Or log in with</h6>
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8081/Elet/LoginServlet&response_type=code&client_id=790490677068-i8edngt1l6t79h7euen9c0qdm0js7ecb.apps.googleusercontent.com&approval_prompt=force" class="btn btn-danger w-100 mb-2">
                                    <i class="fab fa-google"></i> Sign in with Google
                                </a>
                                <a href="#!" class="btn btn-primary w-100">
                                    <i class="fab fa-facebook-f"></i> Sign in with Facebook
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <%@include file="inc/footer.jsp" %>
        <!-- /Footer -->
    </div>

    <!-- JavaScript -->
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/swiper-bundle.min.js"></script>
    <script src="./assets/js/carousel.js"></script>
    <script src="./assets/js/bootstrap-select.min.js"></script>
    <script src="./assets/js/lazysize.min.js"></script>
    <script src="./assets/js/count-down.js"></script>
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/multiple-modal.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>
