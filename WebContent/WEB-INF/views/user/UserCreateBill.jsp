

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>

    <title>Dashboard</title>
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

            
     <style>
						/* The service-container */
						.service-container {
							display: block;
							position: relative;
							/*padding-left: 35px;*/
							margin-bottom: 12px;
							cursor: pointer;
							font-size: 14px;
							user-select: none;
							font-weight: 100;
							padding: 2px;
							margin-left: 20px;
							margin-right: 20px;
							text-transform: uppercase;
						}
			
						/* Hide the browser's default checkbox */
						.service-container input {
							position: absolute;
							opacity: 0;
							cursor: pointer;
							height: 0;
							width: 0;
						}
			
						/* Create a custom checkbox */
						.checkmark {
							position: absolute;
							top: 0;
							left: 0;
							height: 25px;
							width: 25px;
							background-color: #eee;
						}
						
						.checkmark1
						{
						background-color: #d6cdcd;
						}
			
						/* On mouse-over, add a grey background color */
						.service-container:hover input~.checkmark {
							background-color: #6f6486;
						}
			
						/* When the checkbox is checked, add a blue background */
						.service-container input:checked~.checkmark {
							background-color: #2a2b3d;
						}
			
						/* Create the checkmark/indicator (hidden when not checked) */
						.checkmark:after {
							content: "";
							position: absolute;
							display: none;
						}
			
						/* Show the checkmark when checked */
						.service-container input:checked~.checkmark:after {
							display: block;
						}
			
						/* Style the checkmark/indicator */
						.service-container .checkmark:after {
							left: 9px;
							top: 5px;
							width: 5px;
							height: 10px;
							border: solid white;
							border-width: 0 3px 3px 0;
							transform: rotate(45deg);
						}

						
						.car_service_list, .segment_details_list, .leather_details_list, .items_details_list, .segment_model_list,  .leather_series_list, .series_details_list, .car_makers_list, .ShowProductDetails_list, .segment_series_list
						{
							height: 0px;
							overflow: hidden;
							opacity: 0;
							transition: 0.3s;
							background-color: #c5bec580;
							margin-top:20px;
						}

						.segment_data1:focus+.car_service_list, .segment_data1:focus+.segment_details_list, .leather_data1:focus+.leather_details_list, .leather_data1:focus+.items_details_list, .segment_data1:focus+.segment_model_list,  .segment_data1:focus+.leather_series_list, .segment_data1:focus+.series_details_list, .segment_data1:focus+.car_makers_list, .segment_data1:focus+.ShowProductDetails_list, .segment_data1:focus+.segment_series_list 
						{
							height: 300px;
							overflow: scroll;
							opacity: 1;
						}

						.segment_model_list:hover, .segment_details_list:hover, .leather_details_list:hover, .items_details_list:hover, .leather_series_list:hover, .series_details_list:hover,.car_makers_list:hover, .ShowProductDetails_list:hover, .segment_series_list:hover
						{
							height: 300px;
							overflow: scroll;
							opacity: 1;
						}
						.segment_data1, .leather_data1
						{	
						text-transform:uppercase;
						width:100%;
						background-color: transparent;
						padding:10px;
						outline:none;
						border:none;
						border-bottom:solid 1px #2a2b3d;
						}
						.segment_data1:focus, .segment_data1:focus, .leather_data1:focus
						{
							border-bottom:solid 1px rgb(9, 156, 156);
						}
						.service_text1
						{
							text-align:center;
							font-weight:bold;
							font-size:16px;
						}
						
						.provider_timing_to, .provider_timing_from
				        {
				        	width:40%;
				        }
				        
				        .fa_text_fonts12
				        {
				          font-size: 20px;
				          position: absolute;
				          margin-top: 10px;
				          margin-left:5px;
				          color: #6f6486;
				          transition: 0.3s;
				        }
				        
				        .text_field3
				        {
				          border: none;
				          outline: none;
				          border-bottom: solid 1px #2a2b3d;
				          background: transparent;
				          width: 100%;
				          padding: 10px;
				          font-size: 15px;
				          text-align: center;
				          cursor: default;
				          transition: 0.3s;
				          padding-left: 35px;
				          padding-right: 10%;
				        }
				        
				        .text_field3:focus
				        {
				        	border-bottom:solid 1px rgb(9, 156, 156);
				        }
				        
				        .text_field3_1
				        {
				          border: none;
				          outline: none;
				          width:74%;
				          border-bottom: solid 1px #2a2b3d;
				          background: transparent;
				          padding: 10px;
				          font-size: 15px;
				          text-align: center;
				          cursor: default;
				          transition: 0.3s;
				        }
				        
				        .text_field3_12
				        {
				        	width:24%;
				        }
				        
				        @media(max-width:975px)
				        {
				        .text_field3_1
				        {
				        	width:100%;
				        }
				        .text_field3, .text_field3_1
				        {
				        	font-size:12px;
				        }
				        
				        
				        .provider_timing_to, .provider_timing_from
				        {
				        	width:35%;
				        }
				        
				        
				        }
										
	
.fix_checkbox {
	transform: scale(1.7);
	position: absolute;
    right: 5%;
} 
</style>



     <script>
        $(function ImportPage() {
        	$(".pagename").html("Create Bill");
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
            $(".user_save_button3").click(function () {
        				var product_name = $('#product_name').val();
        				var amount = $('#amount').val();
                    	StartLoader();
        				$.ajax({
    						url: "storeDataInUserSpent",
    						type: "post",
    						data:{"product_name":product_name, "amount":amount},
    						success : function(data){
    							CloseLoader();
    						},
    						error:function(e){
    							console.log("Error : ",e);
    						}
    					}); // ajax close

            }); //user_save_button3 click close

        })

    </script>
		<script>  
			$(document).ready(function() {
			
            	$.ajax({
            		url: "fetchdataOfuserspent",
            		type: "post",
            		dataType: "json",
            		success:function(data){
            			//console.log(data);

            			
            			var text = "";
            			for(var j=0; j<1; j++)
    					{
    					text+='<div style="text-align: center;">';
    					text+='<div class="service-fix-height">'; 
    					text+='<input type="text" class="list_car_model_id hide" readonly>';
    					//text+='<input class="fix_checkbox select_all_chk" chkfield="model" type="checkbox" data-toggle1="tooltip" data-placement="top" title="Selct All Model">';
    					text+='<i class="fa fa-crosshairs fa_text_fonts1 fa_text_fonts12"></i>';
    					text+='<input type="text" readonly class="text_field3 list_car_model_data1 car_service segment_data1 segment_data12" id="product_name" placeholder="Select Product">';
    					text+='<div class="ShowProductDetails_list">';
    					text+='<br>';
    				 		for(var i=0; i<data.length; i++){
    				 			text+='<label class="service-container hide_all_spec_maker">'+data[i].name.toUpperCase()+'';
    				 			text+='<input class="car_model_check_box" Image="'+data[i].image+'" sid="'+data[i].id+'" value="'+data[i].name.toUpperCase()+'" type="checkbox">';
    				 			text+='<span class="checkmark"></span>';
    				 			text+='<div style="float: right;"><img style="width:25px; height:25px" src="http://pcsetupvsss.xyz/UploadedFiles/ProductImages/'+data[i].image+'"></div>';

    				 			text+='</label>';
    				 		}
    				 		text+='</div>';
    				 		text+='</div>';
    				 		text+='</div>';
    				 	}  
    				
    					$(".ShowProductDetails").html(text); 
    					
    					$(".car_model_check_box").click(function(){
							var img = $(this).attr("image")
    						$(".PrintImage").attr("src","http://pcsetupvsss.xyz/UploadedFiles/ProductImages/"+img);
							$(".PrintImage").show(200);
							
							$(".car_model_check_box").change(function(){
    							$(".car_model_check_box").prop("checked", false);
    							$(this).prop("checked", true);
    							
        						$(".list_car_model_data1").val($(this).val());
    							$(".list_car_model_id").val($(this).attr("sid"));
        					})
							
						});
    					
    					    			
    					CloseLoader();
            			
            		},
            		error:function(){CloseLoader(); console.log("Admin View Meter List Server Error");}
            	}) // ajax close
		});
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
                <div class="col-md-4" style="text-align: center;">
                    <i class=""></i>
                    <!-- <input type="text" class="text_field3 validation_check user_name" placeholder="User Name*"> -->
                     <!-- <select name="product_name" id="product_name" class="text_field3 validation_check user_name">
                     	<option></option>
                     </select> -->
                     
                     <div class="ShowProductDetails"></div>
                    <br>
                    <br>
                </div>
                
                <div class="col-md-4" style="text-align: center;">
                    <i class=""></i>
                    <input type="number" class="text_field3 validation_check user_password" id="amount" placeholder="Amount">
                    <br>
                    <br>
                </div>
                
                <div class="col-md-4" style="text-align: center;">
                    <img src="" class="PrintImage" style="width:100px; height:100px; display:none; border-radius: 100px; border: solid 1px black;">
                    <br>
                    <br>
                </div>
                 
               <div class="product_name"></div>
                <div class="col-md-12" style="text-align: center;">
                    <br>
                    <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>
                    <br>
                    <div class="user_buttons">
                    <button class="user_edit_button2 user_save_button3" id="submit">Create Bill</button>
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