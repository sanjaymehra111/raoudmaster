<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>

    <title>Create User</title>
	<!--For Webpage Logo-->
    <link rel="shortcut icon" href="/raoudmarket/files/images/login.png">

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <!-- Font Awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--For Multiple Select-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

    <!-- For Search Table -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>



     <script>
        $(function ImportPage() {
        	$(".pagename").html("Create User");
		});
    </script>

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
                $(".validation_check").each(function () {
                    if ($(this).val() == ""){
                    	$(this).css({"border-bottom":"solid 1px red"});
                    	a = a - 1;
                    }
                    else{
                    	$(this).css({"border-bottom":""});
                    }
                })
                if (a != 5)
                    $(".insert_error_alert").css({ "font-size": "15px" });
                else {
                    $(".insert_error_alert").css({ "font-size": "0px" });

                	$(function(){
                		name = $(".user_name").val();
                		contact = $(".user_contact").val();
                		email  = $(".user_email").val();
                		address = $(".user_address").val();
                		meter = $(".user_meter_number").val();
                		charge = $(".user_meter_charge").val();
                		shop = $(".user_shop_name").val();
                		reading = $(".user_bill_reading").val();
                		
                		if(contact.length != 10)
                			$(".user_contact").css({"border-bottom":"solid 1px red"});
                		else if(charge < 0){
                			$(".user_contact").css({"border-bottom":""});
                			$(".user_meter_charge").css({"border-bottom":"solid 1px red"});
                		}
                		else if(reading < 0){
                			$(".user_meter_charge, .user_contact").css({"border-bottom":""});
                			$(".user_bill_reading").css({"border-bottom":"solid 1px red"});
                		}
                		else{
                		StartLoader();
                		$.ajax({
                			url:"CreateUserGroup",
                			data:{"name":name, "contact":contact, "email":email, "meter":meter, "charge":charge, "shop":shop, "reading":reading, "address":address}, 
                			type:"post",
                			dataType:"text",
                			success:function(e){
                				CloseLoader();
                				//console.log("Success", e);
                    			if(e == "meter_exist")
                    				alert("Meter Already Exist");
                    			else
                					$(".validation_check").val(""); 
                			},
                			error:function(){
                				CloseLoader();
                				console.log("User Creation Server Error");
                			}
                		}) // ajax close
                		}// else close
                	})// function close
                	
                }
            }); //user_save_button3 click close

        })

    </script>


</head>

	<jsp:include page="LeftHeader.jsp"/> 
    <section id="contents">
	<jsp:include page="TopHeader.jsp"/>
	  
	
	 
    
    <br><br><br>
    <div class="admin_create_user">
        <div class="col-md-12">
            <div class="test-1">
                <br>
                <br>
                <div class="col-md-2"></div>  
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-user fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="text" class="text_field3 validation_check user_name" placeholder="User Name*">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-phone fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="number" onkeypress="if(this.value.length>=10) return false" class="text_field3 validation_check user_contact" placeholder="User Contact*">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>
                
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-envelope fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="text" class="text_field3 validation_check user_email" placeholder="User E-Mail*">
                    <br>
                    <br>
                </div>
                
                  <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="text" class="text_field3 validation_check user_address" placeholder="User Address*">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>
                
                <div class="col-md-4" style="text-align: center;">
				    <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="text" class="text_field3 validation_check user_meter_number" placeholder="User Meter Number*">
                    <br>
                    <br>
                </div>
                
                  <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-inr  fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="number" class="text_field3 validation_check user_meter_charge" placeholder="Meter Charge*">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>                
                
                
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-home fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="text" class="text_field3 validation_check user_shop_name" placeholder="Shop Name*">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-pencil fa_text_fonts1 fa_text_fonts12"></i>
                    <input type="number" class="text_field3 validation_check user_bill_reading" placeholder="Previous Bill Reading*">
                    <br>
                    <br>
                </div>
                
              
              
                <div class="col-md-12" style="text-align: center;">
                    <br>
                    <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>
                    <br>
                    <div class="user_buttons">
                    <button class="user_edit_button2 user_save_button3">Create New User</button>
                    </div>
                </div>
                <div class="container-fluid"></div>
                <br>
                <br>
            </div>
        </div>
    </div>
</section>

</html>