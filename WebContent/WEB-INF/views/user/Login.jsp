<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
    <title>User Login</title>
    <!-- Bootstrap -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link rel="shortcut icon" href="/raoudmarket/files/images/login.png">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .test-1 {
            background-color: rgba(255, 255, 255, 0);
            transition: 0.3s;
            color: #2a2b3d;
            border-radius: 5px;
        }

        .admin_image {
            height: 150px;
            width: 150px;
            border-radius: 100%;
            padding: 2px;
        }

        .text_field1 {
            border: none;
            outline: none;
            border-bottom: solid 1px rgba(134, 129, 128, 0.699);
            background: transparent;
            width: 100%;
            padding: 10px;
            font-size: 15px;
            text-align: center;
            padding-left: 35px;
            padding-right: 35px;
            cursor: default;
            color: black;
            transition: 0.3s;
        }

            .text_field1:focus {
                border-bottom: solid 2px rgba(27, 4, 4, 0.993);
            }

        .fa_text_fonts {
            font-size: 20px;
            position: absolute;
            margin-top: 10px;
            margin-left: 5px;
            color: #2e0e0e94;
            transition: 0.3s;
        }

        .admin_login_button1 {
            width: 200px;
            padding: 10px;
            border: none;
            outline: none;
            background: transparent;
            text-transform: uppercase;
            color: rgb(255, 255, 255);
            font-size: 17px;
            background: #09101e86;
            transition: 0.5s;
            border-top-left-radius: 30px;
            border-bottom-right-radius: 30px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

            .admin_login_button1:hover {
                color: rgb(255, 255, 255);
                background: #09101e;
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.596);
            }

            .admin_login_button1:active {
                transition: 0.2s;
                transform: scale(0.98);
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.178);
            }

        .admin_forgot_password {
            color: rgba(34, 5, 5, 0.719);
            text-align: right;
            cursor: pointer;
        }

            .admin_forgot_password:hover {
                color: #ffffff;
            }

        .field-icon {
            cursor: pointer;
            float: right;
            margin-left: -25px;
            margin-top: -32px;
            position: relative;
            font-size: 20px;
            z-index: 2;
            color: #a7a7a7e0;
        }


        @media(max-width:975px) {
            .admin_login_button1 {
                width: 100%;
            }

            .text_field1 {
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

            /************************************************** Password show and hide ***************************************************/

            $(".toggle-password").click(function () {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var input = $($(this).attr("toggle"));
                if ($(".admin_pwd").attr("type") == "password") {
                    $(".admin_pwd").attr("type", "text");
                } else {
                    $(".admin_pwd").attr("type", "password");
                }
            });


            /************************************************** Press Enter ***************************************************/


            $(function () {
                $(".pressenter").keypress(function (e) {
                    if (e.which == 13) {
                        $(".admin_login_button1").click();
                    }
                });
            })


            /************************************************** Admin Login ***************************************************/

            $('.admin_id, .admin_pwd').keyup(function () {
                $(this).val($(this).val().replace(/ +?/g, ''));
            });


            $(".admin_login_button1").click(function () {
                var id = $(".admin_id").val();
                var pwd = $(".admin_pwd").val();
                if (id == "") {
                    $(".admin_id").css({ "border-bottom": "solid 1px red" });
                }
                else if (pwd == "") {
                    $(".admin_id").css({ "border-bottom": "solid 1px rgba(134, 129, 128, 0.699)" });
                    $(".admin_pwd").css({ "border-bottom": "solid 1px red" });
                }
                else {
                    $(".admin_id").css({ "border-bottom": "solid 1px rgba(134, 129, 128, 0.699)" });
                    $(".admin_pwd").css({ "border-bottom": "solid 1px rgba(134, 129, 128, 0.699)" });
                    
                    $(function(){
                    	StartLoader();
                		id = $(".admin_id").val();
                		pwd = $(".admin_pwd").val();
                		
                		$.ajax({
                			url:"UserLoginCheck",
                			data:{"id":id, "pwd":pwd}, 
                			type:"post",
                			dataType:"text",
                			success:function(res){
                				CloseLoader();
                				//console.log("Response : ", res);
                				if(res == "success")
                					window.location.href="userdashboard";
                				else
                					alert("INCORRECT ID/PASSWORD");
                			},
                			error:function(){ CloseLoader(); console.log("Admin Login Server Error");}
                			
                		}) // ajax close
                	})// function close
                	
                	
                }
            })
        })

    </script>
</head>


<jsp:include page="Loader.jsp"/> 
   

<body style="background-image: linear-gradient(#d9edf7, rgb(234, 215, 215), rgb(162, 234, 197)); background-size: 100% 130%;">
   
        <div class="user_profile">
            <br />
            <br />
            <br />
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="test-1">
                    <br />
                    <br />

                    <div align="center"><img src="/raoudmarket/files/images/login.png" class="admin_image"></div>
                    <br />
                    <div class="col-md-1"></div>
                    <div class="col-md-10" style="text-align: center;">

                        <i class="fa fa-user fa_text_fonts fa_text_fonts1"></i>
                        <input type="text" class="pressenter text_field1 admin_id" placeholder="ID" >
                        <br />
                        <br />
                        <br />
                        <i class="fa fa-lock fa_text_fonts fa_text_fonts1"></i>
                        <input type="password" class="pressenter text_field1 admin_pwd" placeholder="Password" >
                        <span  class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        <br />
                        <br />
                        <br />
						<!-- <div style="text-align: right;"><span class="admin_forgot_password">Forgot Password..?</span></div> -->
                        <br />
                        <br />           
                        <button ID="btnLogin" Class="admin_login_button1">USER LOGIN</button>
                                     
                    </div>
                    <div class="container-fluid"></div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <br />
        
   
</body>
</html>
