<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>

    <style type="text/css">
        .test-1 {
            background-color: rgba(255, 255, 255, 0.932);
            box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.308);
            transition: 0.3s;
            color: #2a2b3d;
            border-radius: 5px;
        }

        .text_field3 {
            border: none;
            outline: none;
            border-bottom: solid 1px #2a2b3d;
            background: transparent;
            width: 100%;
            padding: 10px;
            font-size: 15px;
            text-align: center;
            padding-left: 30px;
            cursor: default;
            transition: 0.3s;
        }

        .fa_text_fonts12 {
            font-size: 20px;
            position: absolute;
            margin-top: 10px;
            margin-left: 5px;
            color: #6f6486;
            transition: 0.3s;
        }

        .text_field3:focus {
            border-bottom: solid 1px rgb(9, 156, 156);
        }

        .user_edit_button2 {
            width: 300px;
            padding: 10px;
            border: none;
            outline: none;
            background: transparent;
            text-transform: uppercase;
            color: white;
            font-size: 17px;
            background: #6f6486;
            transition: 0.5s;
            border-top-left-radius: 30px;
            border-bottom-right-radius: 30px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

            .user_edit_button2:hover, .user_cancel_button3:hover, .user_save_button3:hover {
                background: #2a2b3d;
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.596);
            }

            .user_edit_button2:active, .user_cancel_button3:active, .user_save_button3:active {
                transition: 0.2s;
                transform: scale(0.98);
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.178);
            }

        .user_buttons {
            transition: 0.5s;
        }

        .insert_error_alert {
            font-size: 0px;
            color: red;
            text-transform: uppercase;
            font-weight: bold;
            transition: 0.3s;
        }

        @media(max-width:975px) {
            .user_edit_button2 {
                width: 100%;
            }

            .fa_text_fonts1 {
                margin-top: 4px;
                font-size: 20px;
            }

            .text_field3 {
                text-align: left;
                padding: 5px;
                font-size: 15px;
                width: 100%;
                padding-left: 35px;
            }
        }
    </style>
    
    <script>

        $(function () {
            $(".text_field3").focus(function () {
                $(".fa_text_fonts12").css({ "color": "#6f6486" });
                $(this).prev(".fa_text_fonts1").css({ "color": "rgb(9, 156, 156)" });
            })

            $(".user_save_button3").click(function () {
                var a = 5;
                $(".text_field3").each(function () {
                    if ($(this).val() == "")
                        a = a - 1;
                })
                if (a != 5)
                    $(".insert_error_alert").css({ "font-size": "15px" });
                else {
                    $(".insert_error_alert").css({ "font-size": "0px" });
                }
            }); //user_save_button3 click close

        })

    </script>
    
    
    
    
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        * {
            padding: 0;
            margin: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            font-family: 'Droid Sans', sans-serif;
            outline: none;
        }

        ::-webkit-scrollbar {
            background: transparent;
            width: 5px;
            height: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #888;
        }

            ::-webkit-scrollbar-thumb:hover {
                background-color: rgb(78, 75, 75);
            }

        body {
            background-color: #a7a1a180
        }

        #contents {
            position: relative;
            transition: .3s;
            margin-left: 290px;
        }

        .margin {
            margin-left: 0 !important;
        }
        /* Start side navigation bar  */

        .side-nav {
            z-index: 999;
            float: left;
            height: 100%;
            width: 290px;
            background-color: #696971;
            color: #CCC;
            -webkit-transform: translateX(0);
            -moz-transform: translateX(0);
            transform: translateX(0);
            -webkit-transition: all .3s ease-in-out;
            -moz-transition: all .3s ease-in-out;
            transition: .3s;
            position: fixed;
            top: 0;
            left: 0;
            overflow: auto;
        }

            .side-nav .close-aside {
                position: absolute;
                top: 7px;
                right: 7px;
                cursor: pointer;
                color: #EEE;
            }

            .side-nav .heading {
                background-color: #696971;
                padding: 15px 15px 15px 30px;
                overflow: hidden;
                border-bottom: 1px solid #2a2b3c61
            }

                .side-nav .heading > img {
                    border-radius: 50%;
                    float: left;
                    width: 28%;
                }

            .side-nav .info {
                float: left;
                /*width: 69%;*/
                margin-left: 3%;
            }

            .side-nav .heading .info > h3 {
                margin: 0 0 5px
            }

                .side-nav .heading .info > h3 > a {
                    color: #EEE;
                    font-weight: 100;
                    margin-top: 4px;
                    display: block;
                    text-decoration: none;
                    font-size: 18px;
                }

                    .side-nav .heading .info > h3 > a:hover {
                        color: #FFF;
                    }

            .side-nav .heading .info > p {
                color: #BBB;
                font-size: 13px;
            }
            /* End heading */
            /* Start search */
            .side-nav .search {
                text-align: center;
                padding: 15px 30px;
                margin: 15px 0;
                position: relative;
            }

                .side-nav .search > input {
                    width: 100%;
                    background-color: transparent;
                    border: none;
                    border-bottom: 1px solid #23262d;
                    padding: 7px 0 7px;
                    color: #DDD
                }

                    .side-nav .search > input ~ i {
                        position: absolute;
                        top: 22px;
                        right: 40px;
                        display: block;
                        color: #2b2f3a;
                        font-size: 19px;
                    }
            /* End search */

            .side-nav .categories > li {
                padding: 17px 40px 17px 30px;
                overflow: hidden;
                border-bottom: 1px solid #ffffff30;
                cursor: pointer;
            }

                .side-nav .categories > li > a {
                    color: #AAA;
                    text-decoration: none;
                }
                    /* Start num: there are three options primary, danger and success like Bootstrap */
                    .side-nav .categories > li > a > .num {
                        line-height: 0;
                        border-radius: 3px;
                        font-size: 14px;
                        color: #FFF;
                        padding: 0px 5px
                    }

        .dang {
            background-color: #f35959
        }

        .prim {
            background-color: #0275d8
        }

        .succ {
            background-color: #5cb85c
        }
        /* End num */
        .side-nav .categories > li > a:hover {
            color: #FFF
        }

        .side-nav .categories > li > i {
            font-size: 18px;
            margin-right: 5px
        }

        .side-nav .categories > li > a:after {
            content: "\f053";
            font-family: fontAwesome;
            font-size: 11px;
            line-height: 1.8;
            float: right;
            color: #AAA;
            -webkit-transition: all .3s ease-in-out;
            -moz-transition: all .3s ease-in-out;
            transition: all .3s ease-in-out;
        }

        .side-nav .categories .opend > a:after {
            -webkit-transform: rotate(-90deg);
            -moz-transform: rotate(-90deg);
            transform: rotate(-90deg);
        }
        /* End categories */
        /* Start dropdown menu */
        .side-nav .categories .side-nav-dropdown {
            padding-top: 10px;
            padding-left: 30px;
            list-style: none;
            display: none;
        }

            .side-nav .categories .side-nav-dropdown > li > a {
                color: #AAA;
                text-decoration: none;
                padding: 7px 0;
                display: block;
            }

                .side-nav .categories .side-nav-dropdown > li > a:hover {
                    color: white;
                }

        .side-nav .categories p {
            margin-left: 30px;
            color: #535465;
            margin-top: 10px;
        }

        /* End dropdown menu */

        .show-side-nav {
            transform: translateX(-290px);
        }


        /* Start media query */
        @media (max-width: 767px) {


            .side-nav .categories > li {
                padding-top: 12px;
                padding-bottom: 12px;
            }

            .side-nav .search {
                padding: 10px 0 10px 30px
            }
        }

        /* End side navigation bar  */
        /* Start welcome */

        .welcome {
            color: #CCC;
        }

            .welcome .content {
                background-color: #696971;
                padding: 15px;
                margin-top: 25px;
            }

            .welcome h2 {
                font-family: Calibri;
                font-weight: 100;
                margin-top: 0
            }


        /* Start statistics */
        .statistics {
            margin-top: 25px;
            color: #CCC;
        }

            .statistics .box {
                background-color: #696971;
                padding: 15px;
                overflow: hidden;
            }

                .statistics .box > i {
                    float: left;
                    color: #FFF;
                    border-radius: 50%;
                    width: 60px;
                    height: 60px;
                    line-height: 60px;
                    font-size: 22px;
                }

                .statistics .box .info {
                    float: left;
                    width: auto;
                    margin-left: 10px;
                }

                    .statistics .box .info h3 {
                        margin: 5px 0 5px;
                        display: inline-block;
                    }

                    .statistics .box .info p {
                        color: #BBB
                    }

        /* End statistics */
        /* Start charts */
        .charts {
            margin-top: 25px;
            color: #BBB
        }

            .charts .chart-container {
                background-color: #313348;
                padding: 15px;
            }

                .charts .chart-container h3 {
                    margin: 0 0 10px;
                    font-size: 17px;
                }

        /* Start admins */

        .admins {
            margin-top: 25px;
        }

            .admins .box {
            }

                .admins .box > h3 {
                    color: #ccc;
                    font-family: Calibri;
                    font-weight: 300;
                    margin-top: 0;
                }

                .admins .box .admin {
                    margin-bottom: 20px;
                    overflow: hidden;
                    background-color: #313348;
                    padding: 10px;
                }

                    .admins .box .admin .img {
                        width: 20%;
                        margin-right: 5%;
                        float: left;
                    }

                        .admins .box .admin .img img {
                            border-radius: 50%;
                        }

                .admins .box .info {
                    width: 75%;
                    color: #EEE;
                    float: left;
                }

                    .admins .box .info h3 {
                        font-size: 19px
                    }

                    .admins .box .info p {
                        color: #BBB
                    }

        /* End admins */
        /* Start statis */

        .statis {
            color: #EEE;
            margin-top: 15px;
        }

            .statis .box {
                position: relative;
                padding: 15px;
                overflow: hidden;
                border-radius: 3px;
                margin-bottom: 25px;
            }

                .statis .box h3:after {
                    content: "";
                    height: 2px;
                    width: 70%;
                    margin: auto;
                    background-color: rgba(255, 255, 255, 0.12);
                    display: block;
                    margin-top: 10px;
                }

                .statis .box i {
                    position: absolute;
                    height: 70px;
                    width: 70px;
                    font-size: 22px;
                    padding: 15px;
                    top: -25px;
                    left: -25px;
                    background-color: rgba(255, 255, 255, 0.15);
                    line-height: 60px;
                    text-align: right;
                    border-radius: 50%;
                }

        /*chart*/
        .chrt3 {
            padding-bottom: 50px;
        }

            .chrt3 .chart-container {
                height: 350px;
                padding: 15px;
                margin-top: 25px;
            }

            .chrt3 .box {
                padding: 15px;
            }


        .main-color {
            color: #ffc107
        }

        .warning {
            background-color: #f0ad4e
        }

        .danger {
            background-color: #d9534f
        }

        .success {
            background-color: #5cb85c
        }

        .inf {
            background-color: #5bc0de
        }



        /* Start bootstrap */
        .navbar-right .dropdown-menu {
            right: auto !important;
            left: 0 !important;
        }

        .navbar-default {
            background-color: #a1a1a2 !important;
            border: none !important;
            border-radius: 0 !important;
            margin: 0 !important
        }

            .navbar-default .navbar-nav > li > a {
                color: #EEE !important;
                line-height: 55px !important;
                padding: 0 10px !important;
            }

            .navbar-default .navbar-brand {
                color: #FFF !important
            }

            .navbar-default .navbar-nav > li > a:focus,
            .navbar-default .navbar-nav > li > a:hover {
                color: #EEE !important
            }

            .navbar-default .navbar-nav > .open > a,
            .navbar-default .navbar-nav > .open > a:focus,
            .navbar-default .navbar-nav > .open > a:hover {
                background-color: transparent !important;
                color: #FFF !important
            }

            .navbar-default .navbar-brand {
                line-height: 55px !important;
                padding: 0 !important
            }

                .navbar-default .navbar-brand:focus,
                .navbar-default .navbar-brand:hover {
                    color: #FFF !important
                }

        .navbar > .container .navbar-brand, .navbar > .container-fluid .navbar-brand {
            margin: 0 !important
        }

        @media (max-width: 767px) {
            .navbar > .container-fluid .navbar-brand {
                margin-left: 15px !important;
            }

            .navbar-default .navbar-nav > li > a {
                padding-left: 0 !important;
            }

            .navbar-nav {
                margin: 0 !important;
            }

            .navbar-default .navbar-collapse,
            .navbar-default .navbar-form {
                border: none !important;
            }
        }

        .navbar-default .navbar-nav > li > a {
            float: left !important;
        }

            .navbar-default .navbar-nav > li > a > span:not(.caret) {
                background-color: #e74c3c !important;
                border-radius: 50% !important;
                height: 25px !important;
                width: 25px !important;
                padding: 2px !important;
                font-size: 11px !important;
                position: relative !important;
                top: -10px !important;
                right: 5px !important
            }

        .dropdown-menu > li > a {
            padding-top: 5px !important;
            padding-right: 5px !important;
        }

        .navbar-default .navbar-nav > li > a > i {
            font-size: 18px !important;
        }




        /* Start media query */

        @media (max-width: 767px) {
            #contents {
                margin: 0 !important
            }

            .statistics .box {
                margin-bottom: 25px !important;
            }

            .navbar-default .navbar-nav .open .dropdown-menu > li > a {
                color: #CCC !important
            }

                .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover {
                    color: #FFF !important
                }

            .navbar-default .navbar-toggle {
                border: none !important;
                color: #EEE !important;
                font-size: 18px !important;
            }

                .navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover {
                    background-color: transparent !important
                }
        }
    </style>

    <script>
        /*global $, console*/
        /*
          By Mostafa Omar
          https://www.facebook.com/MostafaOmarIbrahiem
        */
        $(function () {

            'use strict';

            (function () {

                var aside = $('.side-nav'),

                    showAsideBtn = $('.show-side-btn'),

                    contents = $('#contents');

                showAsideBtn.on("click", function () {

                    $("#" + $(this).data('show')).toggleClass('show-side-nav');
                    contents.toggleClass('margin');
                });

                if ($(window).width() <= 767) {

                    aside.addClass('show-side-nav');

                    $(".hide_sidebar_button").click(function () {
                        $(".close-aside").click();
                    })

                }
                $(window).on('resize', function () {

                    if ($(window).width() > 767) {

                        aside.removeClass('show-side-nav');

                    }

                });

                // dropdown menu in the side nav
                var slideNavDropdown = $('.side-nav-dropdown');

                $('.side-nav .categories li').on('click', function () {

                    $(this).toggleClass('opend').siblings().removeClass('opend');

                    if ($(this).hasClass('opend')) {

                        $(this).find('.side-nav-dropdown').slideToggle('fast');

                        $(this).siblings().find('.side-nav-dropdown').slideUp('fast');

                    } else {

                        $(this).find('.side-nav-dropdown').slideUp('fast');

                    }

                });

                $('.side-nav .close-aside').on('click', function () {

                    $('#' + $(this).data('close')).addClass('show-side-nav');

                    contents.removeClass('margin');

                });

            }());

        });

    </script>

    
</head>

 	<jsp:include page="Dashboard.jsp"/> 


    <section id="contents">

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <i class="fa fa-align-right"></i>
                </button>
                <a class="navbar-brand" href="#">My <span class="main-color pagename">Bill Creation Page</span></a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <i data-show="show-side-navigation1" style="color: white; font-size: 18px; margin-top: 15px; padding: 5px; cursor: pointer; float: right;" class="fa fa-bars show-side-btn"></i>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Dashboard <span class="caret"></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="logout.aspx"><i class="fa fa-sign-out"></i>Log out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div>
        <br>
	    <br>
	    <br>
	    <div class="col-md-12">
        <div class="test-1">
            <br>
            <br>
            <div class="col-md-4" style="text-align: center;">

                <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>
                <input type="text" class="text_field3" placeholder="User Meter Number*">
                <br>
                <br> 
            </div>
            <div class="col-md-4" style="text-align: center;">
                <i class="fa fa-pencil fa_text_fonts1 fa_text_fonts12"></i>
                <input type="text" class="text_field3" placeholder="User Bill Reading*">
                <br>
                <br>
            </div>

            <div class="col-md-4" style="text-align: center;">
                <i class="fa fa-pencil fa_text_fonts1 fa_text_fonts12"></i>
                <input type="date" class="text_field3" placeholder="Date*">
                <br>
                <br>
            </div>

            <div class="col-md-12" style="text-align: center;">
                <br>
                <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>
                <br>
                <div class="user_buttons">
                <button class="user_edit_button2 user_save_button3">Create Bill</button>
                </div>
            </div>
            <div class="container-fluid"></div>
            <br>
            <br>
        </div>
    </div>
    </div>
    
    </section> 
    
    </body>
    
    </html>
