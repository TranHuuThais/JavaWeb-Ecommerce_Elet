<%-- 
    Document   : topBar
    Created on : Sep 17, 2024, 4:25:38 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="wrapper">
    <!-- Top bar -->
    <div class="tf-top-bar bg_dark line">
        <div class="px_15 lg-px_40">
            <div class="tf-top-bar_wrap grid-3 gap-30 align-items-center">
                <div class="tf-top-bar_left">
                    <div class="d-flex gap-30 text_white fw-5 ">
                        <span>(+333) 123-1688</span>
                        <span>sayhello@Elet.com</span>
                    </div>
                </div>
                <div class="text-center overflow-hidden">
                    <div class="swiper tf-sw-top_bar" data-preview="1" data-space="0" data-loop="true" data-speed="1000" data-delay="2000">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5 text_white">Season Sale: Time to refresh your wardrobe. <a href="ShopServlet" title="all collection" class="tf-btn btn-line">Shop now<i class="icon icon-arrow1-top-left"></i></a></p>
                            </div>
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5 text_white">Discount off 50%. <a href="shop-default.html" title="all collection" class="tf-btn btn-line">Shop now<i class="icon icon-arrow1-top-left"></i></a></p>
                            </div>
                            <div class="swiper-slide">
                                <p class="top-bar-text fw-5 text_white">Welcome to store. Fantastic theme! Beautifully designed</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="top-bar-language tf-cur justify-content-end">
                    <div class="tf-currencies">
                        <select class="image-select center style-default type-currencies color-white">
                            <option data-thumbnail="./assets/images/country/fr.svg">EUR <span>â¬ | France</span></option>
                            <option data-thumbnail="./assets/images/country/de.svg">EUR <span>â¬ | Germany</span></option>
                            <option selected data-thumbnail="./assets/images/country/us.svg">USD <span>$ | United States</span></option>
                            <option data-thumbnail="./assets/images/country/vn.svg">VND <span>â« | Vietnam</span></option>
                        </select>
                    </div>
                    <div class="tf-languages">
                        <select class="image-select center style-default type-languages color-white">
                            <option>English</option>
                            <option>Ø§ÙØ¹Ø±Ø¨ÙØ©</option>
                            <option>ç®ä½ä¸­æ</option>
                            <option>Ø§Ø±Ø¯Ù</option>
                        </select>
                    </div>    
                </div>
            </div>
        </div>
    </div>
    <!-- /Top bar -->
