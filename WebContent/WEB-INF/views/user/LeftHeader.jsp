    
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


   


    <aside class="side-nav" id="show-side-navigation1">
        <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1" style="margin-top: 10px;"></i>
        <div class="heading">
            <img style="border: solid 1px white; background: #dad8d5;" src="https://www.serviceonway.com/serviceonway/files/images/admin.png" alt="">
            <div class="info" style="margin-left: 20px; margin-top: 10px;">
                <h3><a href="#">Electric Service</a></h3>
                <p>Electric Service Pvt.Ltd.</p>
            </div>
        </div>

        <ul class="categories">
            <li><i class="fa fa-home fa-fw" aria-hidden="true"></i><a>Dashboard</a>
                <ul class="side-nav-dropdown">
                    <li class="import_admin hide_sidebar_button import_admin_dashboard" pagename="home" textname="Dashboard"><a href="admindashboard">Home</a></li>                    
                </ul>
            </li>

            <li><i class="fa fa-support fa-fw"></i><a>Bills</a>
                <ul class="side-nav-dropdown">
                    <li class="import_admin hide_sidebar_button" pagename="UserCreateBill"><a href="UserCreateBill">Create</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="UserViewBill"><a href="UserViewBill">View</a></li>
                </ul>
            </li>

        </ul>
        
        
        
    </aside>

<jsp:include page="Loader.jsp"/> 
   