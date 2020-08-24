<html lang="en">
<head>
    <title>View Users</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--For Webpage Logo-->
    <link rel="shortcut icon" href="images/logo3-plane.png" />

    <!--For Multiple Select-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

    <!-- For Search Table -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
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
    <script>
        $(function ImportPage() {
            $(".ImportPage").load("admin_home.html");
            $(document).on("click", ".import_admin", function () {
                var pn = $(this).attr("pagename");
                var tn = $(this).attr("textname");
                $(".pagename").html(tn);
                $(".ImportPage").load("admin_" + pn + ".html");
            });
        })
    </script>
</head>
<body>

    <aside class="side-nav" id="show-side-navigation1">
        <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1" style="margin-top: 10px;"></i>
        <div class="heading">
            <img src="https://uniim1.shutterfly.com/ng/services/mediarender/THISLIFE/021036514417/media/23148907008/medium/1501685726/enhance" alt="">
            <div class="info" style="margin-left: 20px; margin-top: 10px;">
                <h3><a href="#">Electric Service</a></h3>
                <p>Electric Service Pvt.Ltd.</p>
            </div>
        </div>

        <ul class="categories">
            <li><i class="fa fa-home fa-fw" aria-hidden="true"></i><a>Dashboard</a>
                <ul class="side-nav-dropdown">
                    <li class="import_admin hide_sidebar_button import_admin_dashboard" pagename="home" textname="Dashboard"><a href="AdminDashboard.aspx">Home</a></li>

                </ul>
            </li>

            <li><i class="fa fa-support fa-fw"></i><a>Group</a>
                <ul class="side-nav-dropdown">
                    <li class="import_admin hide_sidebar_button" pagename="create_user_group" textname="New User"><a href="AdminCreateUserGroup.aspx">Insert User</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="user_group" textname="User List"><a href="AdminUserGroup.aspx">View Users</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="print_user_group" textname="Report"><a href="DownloadReport.aspx">Download Report</a></li>
                </ul>
            </li>

            <li><i class="fa fa-tasks fa-fw"></i><a>services</a>
                <ul class="side-nav-dropdown">
                    <li class="import_admin hide_sidebar_button" pagename="create_bill" textname="Bill Creation Page"><a href="AdminCreateBill.aspx">Create Bill</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="create_meter" textname="Meter Creation Page"><a href="AdminCreateMeter.aspx">Create Meter</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="meter_list" textname="Meter List"><a href="AdminMeterList.aspx">View Meter</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="print_user_group" textname="Report"><a href="DownloadMeterReport.aspx">Download Meter Report</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="company_readings" textname="CompanyReadings"><a href="CompanyReadings.aspx">Create Company Readings</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="download_company_readings" textname="DownloadCompanyReadingsReport"><a href="CompanyReading_Report.aspx">Download Company Readings Report</a></li>
                                        <li class="import_admin hide_sidebar_button" pagename="create_shop_details" textname="CreateShopDetails"><a href="CreateShopDetails.aspx">Create Shop Details</a></li>
                    <li class="import_admin hide_sidebar_button" pagename="view_shop_details" textname="ViewShopDetails"><a href="ViewShopDetails.aspx">View Shop Details</a></li>
                </ul>
            </li>

        </ul>
    </aside>

    <section id="contents">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <i class="fa fa-align-right"></i>
                    </button>
                    <a class="navbar-brand" href="#">My <span class="main-color pagename">User List</span></a>
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

		<script>

           



            $(function () {

                $(document).on("click", ".user_edit_button1", function () {
                    $(".insert_error_alert").css({ "font-size": "0px" });
                    var id = $(this).attr("u_id");
                    var name = $(this).attr("u_name");
                    var contact = $(this).attr("u_contact");
                    var email = $(this).attr("u_email");
                    var address = $(this).attr("u_address");
                    var meter = $(this).attr("u_meter");

                    $(".update_user_button1").attr("uid", id);
                    $(".update_u_name").val(name);
                    $(".update_u_contact").val(contact);
                    $(".update_u_email").val(email);
                    $(".update_u_address").val(address);
                    $(".update_u_meter").val(meter);

                }) // edit details close


                $(document).on("click", ".user_print_button1", function () {
                    $(".insert_error_alert").css({ "font-size": "0px" });
                    var id = $(this).attr("u_id");
                    var name = $(this).attr("u_name");
                    var contact = $(this).attr("u_contact");
                    var email = $(this).attr("u_email");
                    var address = $(this).attr("u_address");
                    var meter = $(this).attr("u_meter");

                    var pr_reading = $(this).attr("pr_reading");
                    var cu_reading = $(this).attr("cu_reading");
                    var pr_arrears = $(this).attr("pr_arrears");
                    var cu_bill = $(this).attr("cu_bill");

                    var total = parseInt(pr_arrears) + parseInt(cu_bill);

                    $(".update_user_button1").attr("uid", id);
                    $(".print_u_name").html(name);
                    $(".print_u_contact").html(contact);
                    $(".print_u_email").html(email);
                    $(".print_u_address").html(address);
                    $(".print_u_meter").html(meter);

                    $(".print_u_pr_rerading").html(pr_reading);
                    $(".print_u_cu_reading").html(cu_reading);
                    $(".print_u_pr_arrears").html(pr_arrears);
                    $(".print_u_cu_bill").html(cu_bill);
                    $(".print_u_total_bill").html(total);


                })
            })
        </script>
        <style>
            body {
                background: #f7f7f7;
            }

            .table {
                border-spacing: 0 0.85rem !important;
            }

                .table .dropdown {
                    display: inline-block;
                }

                .table td,
                .table th {
                    vertical-align: middle;
                    margin-bottom: 10px;
                    border: none;
                }

                .table thead tr,
                .table thead th {
                    border: none;
                    font-size: 12px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    background: transparent;
                }

            .avatar {
                width: 2.75rem;
                height: 2.75rem;
                line-height: 3rem;
                border-radius: 50%;
                display: inline-block;
                background: transparent;
                position: relative;
                text-align: center;
                color: #868e96;
                font-weight: 700;
                vertical-align: bottom;
                font-size: 1rem;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .avatar-sm {
                width: 2.5rem;
                height: 2.5rem;
                font-size: 0.83333rem;
                line-height: 1.5;
            }

            .avatar-img {
                width: 100%;
                height: 100%;
                -o-object-fit: cover;
                object-fit: cover;
            }

            .avatar-blue {
                background-color: #c8d9f1;
                color: #467fcf;
            }

            table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > td:first-child:before,
            table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > th:first-child:before {
                top: 28px;
                left: 14px;
                border: none;
                box-shadow: none;
            }

            table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > td:first-child,
            table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > th:first-child {
                padding-left: 48px;
            }

            table.dataTable > tbody > tr.child ul.dtr-details {
                width: 100%;
            }

            table.dataTable > tbody > tr.child span.dtr-title {
                min-width: 50%;
            }

            table.dataTable.dtr-inline.collapsed > tbody > tr > td.child,
            table.dataTable.dtr-inline.collapsed > tbody > tr > th.child,
            table.dataTable.dtr-inline.collapsed > tbody > tr > td.dataTables_empty {
                padding: 0.75rem 1rem 0.125rem;
            }

            div.dataTables_wrapper div.dataTables_length label,
            div.dataTables_wrapper div.dataTables_filter label {
                margin-bottom: 0;
            }


            .btn-icon {
                background: #fff;
            }

                .btn-icon .bx {
                    font-size: 20px;
                }

            .btn .bx {
                vertical-align: middle;
                font-size: 20px;
            }

            .dropdown-menu {
                padding: 0.25rem 0;
            }

            .dropdown-item {
                padding: 0.5rem 1rem;
            }

            .badge {
                padding: 0.5em 0.75em;
                width: 100px;
            }

            .badge-success-alt {
                background-color: #d7f2c2;
                color: #497922;
            }

            .badge-unsuccess-alt {
                background-color: #e99a82;
                color: #7e2f1b;
            }

            .table a {
                color: #212529;
            }

                .table a:hover,
                .table a:focus {
                    text-decoration: none;
                }

            table.dataTable {
                margin-top: 12px !important;
            }

            .icon > .bx {
                display: block;
                min-width: 1.5em;
                min-height: 1.5em;
                text-align: center;
                font-size: 1.0625rem;
            }

            .btn {
                font-size: 0.9375rem;
                font-weight: 500;
                padding: 0.5rem 0.75rem;
            }

            .avatar-blue {
                background-color: #c8d9f1;
                color: #467fcf;
            }

            .avatar-pink {
                background-color: #fcd3e1;
                color: #f66d9b;
            }

            .table {
                border-spacing: 0 1em;
                border-collapse: collapse;
            }

                .table > tbody > tr > td {
                    padding: 15px;
                    min-width: 100px;
                }

            .row {
                margin-right: 0px;
                margin-left: 0px;
            }


            .dataTables_length {
                text-align: left;
            }

            .dataTables_filter {
                text-align: right;
            }

            label {
                font-size: 0px;
            }

            .dataTables_info {
                color: white;
            }

            .dataTables_info {
                margin-top: 10px;
            }

            tr:nth-child(odd) {
                background: #eeedfc;
            }

            tr:nth-child(even) {
                background: #e4efff;
            }

            .table > thead:first-child > tr:first-child > th {
                min-width: 150px;
            }

            .user_edit_button1, .user_print_button1 {
                width: 100px;
                border-radius: 100px;
                border: none;
                outline: none;
                background: #69697193;
                color: white;
                padding: 2px;
            }

                .user_edit_button1:hover, .user_print_button1:hover {
                    background: #696971;
                }

                .user_edit_button1:active, .user_print_button1:hover {
                    transform: scale(0.95);
                }

            .min_width_250 {
                min-width: 350px;
            }

            @media (max-width: 767px) {
                div.dataTables_wrapper div.dataTables_paginate ul.pagination {
                    -ms-flex-pack: center !important;
                    justify-content: center !important;
                    margin-top: 1rem;
                }

                .table > tbody > tr > td {
                    min-width: 200px;
                }

                .dataTables_length, .dataTables_filter, .dataTables_paginate, .dataTables_info {
                    text-align: center;
                }

                .dataTables_filter {
                    margin-top: 10px;
                }
            }

            @media print {
                body * {
                    visibility: hidden;
                }

                #section-to-print {
                    margin-top: 50px;
                }

                    #section-to-print * {
                        visibility: visible;
                    }

                #section-to-print {
                    position: absolute;
                    left: 0;
                    top: 0;
                }
            }
        </style>

        <div style="width: 100%;">
            <br />
            <br />
            <div style="width: 100%;" id="divUserDetails">
            </div>
        </div>

        <div id="UserEditModel" class="modal fade" role="dialog">
            <style>
                .fa_text_fonts12 {
                    font-size: 20px;
                    position: absolute;
                    margin-top: 10px;
                    margin-left: 5px;
                    color: #6f6486;
                    transition: 0.3s;
                }

                .text_field4 {
                    border: none;
                    outline: none;
                    background: transparent;
                    padding: 10px;
                    font-size: 15px;
                    padding-left: 30px;
                    cursor: default;
                }

                .text_field3 {
                    border: none;
                    outline: none;
                    border-bottom: solid 1px #2a2b3d;
                    background: transparent;
                    width: 80%;
                    padding: 10px;
                    font-size: 15px;
                    text-align: center;
                    padding-left: 30px;
                    cursor: default;
                    transition: 0.3s;
                }

                    .text_field3:focus {
                        border-bottom: solid 1px rgb(9, 156, 156);
                    }

                .insert_error_alert {
                    font-size: 0px;
                    color: red;
                    text-transform: uppercase;
                    font-weight: bold;
                    transition: 0.3s;
                }

                @media(max-width:975px) {
                    .fa_text_fonts1 {
                        margin-top: 4px;
                        font-size: 20px;
                    }
                }
            </style>
            <script>
                $(function () {
                    $(".update_user_button1").click(function () {
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
                    }); //update_user_button1 click close
                })
            </script>
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background-image: linear-gradient(#adccdc, rgba(150, 150, 150, 0.22), rgba(119, 220, 243, 0.17));">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align: center;">Edit User Details</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;">

                        <i class="fa fa-user fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3 update_u_name" placeholder="User Name*" id="lblUserName">
                        <br />
                        <br />

                        <i class="fa fa-phone fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="number" onkeypress="if(this.value.length>=10) return false" class="text_field3  update_u_contact" placeholder="User Contact*" id="lblContact">
                        <br />
                        <br />

                        <i class="fa fa-envelope fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3  update_u_email" placeholder="User E-Mail*" id="lblEmail">
                        <br />
                        <br />

                        <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3  update_u_meter" placeholder="User Meter Number*" id="lblMeter" readonly="readonly">
                        <br />
                        <br />

                        <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3  update_u_address" placeholder="User Address*" id="lblAddress">
                        <br />
                        <br />
                        <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-success update_user_button1" onclick="UpdateRecord()">Update</button>
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-danger update_user_button1" onclick="DeleteRecord()">Delete</button>
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <div id="PritnUserModel" class="modal fade" role="dialog">

            <style>
                #PritnUserModel .modal-dialog {
                    width: 98%;
                }

                .table > thead:first-child > tr:first-child > th {
                    min-width: 20px;
                }

                .pp_view {
                    font-weight: bold;
                }

                @media(max-width:975px) {
                    #PritnUserModel .modal-dialog {
                        width: auto;
                    }
                }
            </style>

            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background-image: linear-gradient(#adccdc, rgba(150, 150, 150, 0.22), rgba(119, 220, 243, 0.17));">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align: center;">Print User Details</h4>
                    </div>
                    <div class="modal-body" id="section-to-print" style="text-align: center;">

                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Name : <span class="print_u_name pp_view"></span>
                            <br />
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Contact : <span class="print_u_contact pp_view"></span>
                            <br />
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Email :<span class="print_u_email pp_view"></span>
                            <br />
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Meter No. : <span class="print_u_meter pp_view" id="lblMeterNum"></span>
                            <br />
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Address : <span class="print_u_address pp_view"></span>
                            <br />
                            <br />
                        </div>


                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Previous Reading Date : <span class="print_u_bill_pr_date pp_view" id="lblPRD"></span>
                            <br />
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-6" style="text-align: left;">
                            Current Reading Date : <span class="print_u_bill_cr_date pp_view" id="lblCRD"></span>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>


                        <div class="container-fluid" style="text-align: left;"></div>

                        <div class="table_data" style="width: 100%; overflow: scroll;" id="dvDetailHistory">
                        </div>
                        <div align="left" style="font-weight:bolder">History</div>
                        <div class="table_data" style="width: 100%; overflow: scroll;" id="dvPDetailHistory">
                        </div>
                        <div class="container-fluid"></div>
                    </div>

                    <div style="text-align: center;">
                        <b>AMOUNT :
                            <input id="txtAmount" style="background: transparent; border: none; color: black; border-bottom: solid 1px gray; text-align: center;" type="number" class="update_bill_amount" placeholder="Amount"></b><br />
                        <br />
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <div class="col-md-4">
                            <button type="button" style="width: 100%; font-size: 14px;" class="btn btn-info" onclick="MakePayment()">Make Payment</button><br />
                            <br />
                        </div>
                        <div class="col-md-4">
                            <button type="button" style="width: 100%; font-size: 14px;" onclick="window.print();" class="btn btn-success Print_user_button1">Print</button><br />
                            <br />
                        </div>
                        <div class="col-md-4">
                            <button type="button" style="width: 100%; font-size: 14px;" class="btn btn-default" data-dismiss="modal">Close</button><br />
                            <br />
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="container-fluid"></div>
    </section>
    <script type="text/javascript">
        $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "AdminDashboard.aspx/GetDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var json = response.d;

                    var data = '<table id="example" class="table table-hover responsive nowrap" style="width:100%;" cellspacing="10">';
                    data = data + '<thead>';
                    data = data + '<tr style="color: white; background-color: #6f6486;">';
                    data = data + '<th>User Name</th>';
                    data = data + '<th>Contact</th>';
                    data = data + '<th>Email</th>';
                    data = data + '<th class="min_width_250" style="min-width: 250px;">Address</th>';
                    data = data + '<th>Meter No.</th>';
                    data = data + '<th>Created</th>';
                    data = data + '<th>Updated</th>';
                    data = data + '<th>Action</th>';
                    data = data + '<th>Print</th>';
                    data = data + '</tr>';
                    data = data + '</thead>';
                    data = data + '<tbody style="font-size: 14px; border-collapse:separate; border-spacing:0 15px;">';
                    if (response.d != "") {
                        $.each(JSON.parse(json), function (idx, obj) {
                            data = data + '<tr>';
                            data = data + '<td class="edit_user_name">' + obj.UserName + '</td>';
                            data = data + '<td class="edit_user_contact">' + obj.Contact + '</td>';
                            data = data + '<td class="edit_user_email">' + obj.EmailAddress + '</td>';
                            data = data + '<td class="edit_user_address">' + obj.Address + '</td>';
                            data = data + '<td class="edit-user_meter">' + obj.MeterNum + '</td>';
                            data = data + '<td class="edit_created_date">' + obj.CreateDate + '</td>';
                            data = data + '<td class="edit_updated_date">' + obj.UpdateDate + '</td>';
                            data = data + '<td><button u_id="ABC1" u_name="' + obj.UserName + '" u_contact="' + obj.Contact + '" u_email="' + obj.EmailAddress + '" u_address="' + obj.Address + '" u_meter="' + obj.MeterNum + '" data-toggle="modal" data-target="#UserEditModel" class="user_edit_button1">EDIT</button></td>';
                            data = data + '<td><button u_id="ABC1" u_name="' + obj.UserName + '" u_contact="' + obj.Contact + '" u_email="' + obj.EmailAddress + '" u_address="' + obj.Address + '" u_meter="' + obj.MeterNum + '" pr_reading="256" cu_reading="200" pr_arrears="2560" cu_bill="3566" data-toggle="modal" data-target="#PritnUserModel" class="user_print_button1"  onclick="GetMeterShortInfo(' + "'" + obj.MeterNum + "'" + ')" >Preview</button></td>';
                            data = data + '</tr>';
                        });
                    }
                    data = data + '</tbody>'
                    data = data + '</table>'

                    $("#divUserDetails").html(data);

					

                	$("#example").DataTable({
                    aaSorting: [],
                    responsive: true,

                    columnDefs: [
                        {
                            responsivePriority: 1,
                            targets: 0
                        },
                        {
                            responsivePriority: 2,
                            targets: -1
                        }
                    ]
                });

                $(".dataTables_filter input")
                    .attr("placeholder", "Search here...")
                    .css({
                        width: "300px",
                        display: "inline-block"
                    });
				
				$('[data-toggle="tooltip"]').tooltip();
				$("#example").wrap("<div style='width:100%; overflow:scroll'></div>");
            
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

        function UpdateRecord() {
            var lblUserName = $("#lblUserName").val();
            var lblContact = $("#lblContact").val();
            var lblEmail = $("#lblEmail").val();
            var lblMeter = $("#lblMeter").val();
            var lblAddress = $("#lblAddress").val();

            if (lblUserName != "" && lblContact != "" && lblEmail != "" && lblMeter != "" && lblAddress != "") {
                var obj = {};
                obj.UserName = lblUserName;
                obj.Contact = lblContact;
                obj.Email = lblEmail;
                obj.Meter = lblMeter;
                obj.Address = lblAddress;

                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/UpdateDetails",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        if (r.d == "Updated Successfully.") {
                            location.reload();
                        }
                    }
                });

            }
            else {

            }
        }

        function DeleteRecord() {
            var lblMeter = $("#lblMeter").val();

            var r = confirm("Are you sure want to delete!");
            if (r == true) {
                if (lblMeter != "") {
                    var obj = {};
                    obj.MeterNum = lblMeter;

                    $.ajax({
                        type: "POST",
                        url: "AdminDashboard.aspx/DeleteMeterInfo",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            alert(r.d);
                            location.reload();

                        }
                    });
                }
            }            
        }

        function GetMeterShortInfo(MeterNum) {
            var lblMeterNum = MeterNum;

            if (lblMeterNum != "") {
                var obj = {};
                obj.MeterNum = lblMeterNum;

                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/GetMeterShortInfo",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var json = r.d;

                        $.each(JSON.parse(json), function (idx, obj) {
                            if (obj.PrevReadingDate == '01-Jan-00 12:00:00 AM' || obj.PrevReadingDate == '1/1/1900 12:00:00 AM') {
                                $("#lblPRD").val('');
                            }
                            else {
                                $("#lblPRD").html(obj.PrevReadingDate.replace("12:00:00 AM", ""));
                            }

                            if (obj.CurrentReadingDate == '01-Jan-00 12:00:00 AM' || obj.CurrentReadingDate == '1/1/1900 12:00:00 AM') {
                                $("#lblCRD").val('');
                            }
                            else {
                                $("#lblCRD").html(obj.CurrentReadingDate.replace("12:00:00 AM", ""));
                            }
                        });
                    }
                });

                GetMeterDetailInfo(obj.MeterNum);
                GetMeterHistoryDetailInfo(obj.MeterNum);

                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/GetTotalBillAmount",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var json = r.d;
                        $("#dvTotalBillAmount").html(r.d);
                    }
                });
            }
            else {

            }
        }
        function GetMeterDetailInfo(MeterNum) {
            
            var lblMeterNum = MeterNum;

            if (lblMeterNum != "") {
                var obj = {};
                obj.MeterNum = lblMeterNum;

                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/GetMeterDetailInfo",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var json = r.d;
                        var data = '<table class="table table-bordered" style="width: 100%;">';
                        data = data + '<thead>';
                        data = data + '<tr style="background: #b3cfdd;">';
                        data = data + '<th scope="col">S.No.</th>';
                        data = data + '<th scope="col">Month</th>';
                        data = data + '<th scope="col">Reading</th>';
                        data = data + '<th scope="col">Bill</th>';
                        data = data + '<th scope="col">Paid Bill</th>';
                        data = data + '<th scope="col">Payment Date</th>';
                        data = data + '</tr>';
                        data = data + '</thead>';
                        data = data + '<tbody>';
                        if (r.d != "") {
                            $.each(JSON.parse(json), function (idx, obj) {
                                data = data + '<tr>';
                                data = data + '<th scope="row">' + obj.Sno + '</th>';
                                data = data + '<td>' + obj.List + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.Reading + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.MonthlyAmount + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.PaidBill + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.PaymentDate + '</td>';
                                data = data + '</tr>';
                            });
                        }
                        
                        data = data + '</tbody>';
                        data = data + '</table>';


                        $("#dvDetailHistory").html(data);
                    }
                });

            }
            else {

            }
        }
        function GetMeterHistoryDetailInfo(MeterNum) {

            var lblMeterNum = MeterNum;

            if (lblMeterNum != "") {
                var obj = {};
                obj.MeterNum = lblMeterNum;

                $.ajax({
                    type: "POST",
                    url: "AdminDashboard.aspx/GetMeterPreviousDetailInfo",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var json = r.d;
                        var data = '<table class="table table-bordered" style="width: 100%;">';
                        data = data + '<thead>';
                        data = data + '<tr style="background: #b3cfdd;">';
                        data = data + '<th scope="col">S.No.</th>';
                        data = data + '<th scope="col">Month</th>';
                        data = data + '<th scope="col">Reading</th>';
                        data = data + '<th scope="col">Bill</th>';
                        data = data + '<th scope="col">Paid Bill</th>';
                        data = data + '<th scope="col">Payment Date</th>';
                        data = data + '</tr>';
                        data = data + '</thead>';
                        data = data + '<tbody>';
                        if (r.d != "") {
                            $.each(JSON.parse(json), function (idx, obj) {
                                data = data + '<tr>';
                                data = data + '<th scope="row">' + obj.Sno + '</th>';
                                data = data + '<td>' + obj.List + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.Reading + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.MonthlyAmount + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.PaidBill + '</td>';
                                data = data + '<td class="print_u_pr_rerading">' + obj.PaymentDate + '</td>';
                                data = data + '</tr>';
                            });
                        }
                        data = data + '<tr>';
                        data = data + '<td colspan="5"></td>';
                        data = data + '<td style="font-weight: bold;">Total Outstanding (Total Bill - Total Paid Bill) &#8377;';
                        data = data + '<div style="margin-left: 10%;" class="print_u_total_bill" id="dvTotalBillAmount"></div>';
                        data = data + '</td>';
                        data = data + '</tr>';
                        data = data + '</tbody>';
                        data = data + '</table>';


                        $("#dvPDetailHistory").html(data);
                    }
                });

            }
            else {

            }
        }
        function MakePayment() {
            if ($("#txtAmount").val() == "") {
                alert("Please enter amount to process further !!!");
            }
            else {
                var MeterNum = $("#lblMeterNum").html();
                if (MeterNum != "") {
                    var obj = {};
                    obj.MeterNum = MeterNum;
                    obj.Amount = $("#txtAmount").val();

                    $.ajax({
                        type: "POST",
                        url: "AdminDashboard.aspx/UpdatePaymentDetails",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var json = r.d;
                            alert(json);

                            GetMeterDetailInfo(obj.MeterNum);
                            GetMeterHistoryDetailInfo(obj.MeterNum);

                            $.ajax({
                                type: "POST",
                                url: "AdminDashboard.aspx/GetTotalBillAmount",
                                data: "{'MeterNum': '" + obj.MeterNum + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (r) {
                                    var json = r.d;
                                    $("#dvTotalBillAmount").html(r.d);
                                }
                            });
                        }
                    });
                }
                else {
                    alert("Invalid Meter Number !!!");
                }
            }

        }
    </script>
</body>
</html>
