<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
	
    table.dataTable.dtr-inline.collapsed
      > tbody
      > tr[role="row"]
      > td:first-child:before,
    table.dataTable.dtr-inline.collapsed
      > tbody
      > tr[role="row"]
      > th:first-child:before {
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
    	font-size:12px;
      padding: 0.5em 0.75em;
      width: 48%;
    } 
    
    .badge-unsuccess-alt:hover {
      background-color: #e99a82;
      color: #7e2f1b;
    }
    
        .badge-unsuccess-alt {
        cursor:pointer;
      background-color: #d7f2c2;
      color: #497922;
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
      font-size: 12px;
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
    
    .table_padding>tbody>tr>td
    {
          padding: 10px;
          max-width: 200px; 
        }
        
    .table>tbody>tr>td
        {
          padding: 15px;
          min-width: 125px;
        }
    .row
    {
          margin-right: 0px;
         margin-left: 0px;
    }
    
    
    .dataTables_length
    {
      text-align: left;
    }
    .dataTables_filter
    {
      text-align: center;
    }
    
    label
    {
      font-size: 0px;
    }
    .dataTables_info
    {
      color: white;
    }
    .dataTables_info
    {
      margin-top:10px;
    }
  
    /* 	tr:nth-child(odd){ 
          background: #eeedfc;
      }
  
      tr:nth-child(even){
          background: #e4efff;
      }
   */
      .table>thead:first-child>tr:first-child>th
      {
          min-width: 150px;
      }
      
	  #example_filter {
		  margin-left: -105%;
	  }

	  .text_center {
		  text-align: center;
	  }


	
	  @media(max-width:975px){
		#example_filter {
		  margin-left: 0%;
	  }
	  }
      
</style>

<style>
.click_button {
	padding: 5px;
    width: 100px;
    background: transparent;
    border-radius: 100px;
    outline: none;
    border: solid 2px white;
    transition:0.3s;
}

.click_button:hover {
	background: white;
	color:black;
    border: solid 2px white;
}  

.click_button:active{
	transform:scale(0.95);
}  

</style>

    
    <script>
    
        $(function ImportPage() {
        	$(".pagename").html("User's");
		});
        
        $(function(){
        	StartLoader();
        	$.ajax({
        		url:"ViewUserGroup",
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			//console.log("Response : ", data);
        			var html="";
        			for(var i=0; i<data.length; i++) {
						html+='<tr>';
						html+='<td>'+data[i].name+'</td>';
						html+='<td>'+data[i].contact+'</td>';
						html+='<td>'+data[i].email+'</td>';
						html+='<td>'+data[i].address+'</td>';
						html+='<td>'+data[i].meter_number+'</td>';
						var date = data[i].date.split(" ");
						html+='<td style="text-align:center">'+date[0]+'</td>';
						if(data[i].updated_date == null || data[i].updated_date == "")
							html+='<td style="text-align:center"> - </td>';
						else
							html+='<td style="text-align:center">'+data[i].updated_date+'</td>';
						html+='<td><button uid="'+data[i].id+'" class="click_button edit_user">Edit</td>';
						html+='<td><button uid="'+data[i].id+'" class="click_button print_user">Preview</td>';
						html+='</tr>';
        			}
        			$(".userlist").html(html);
        			
        			$("#example").DataTable({
						columnDefs: [ { type: 'date', 'targets': [5] } ],
				    	order: [[5, 'desc' ]],
						aaSorting: [],
						responsive: true,
						pageLength : 5,
						"bLengthChange" : false, //thought this line could hide the LengthMenu
			    		//"bInfo":false, 
						
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
        			
        			$("#example").wrap( "<div style='width:100%; overflow:scroll'></div>" );
					$(".dataTables_filter input")
					.attr("placeholder", "Search here...")
					.css({
					'text-align': "center",
					background : 'transparent',
					color:'white',
					width:'250px'
					});
					
					CloseLoader();
        			
        		},
        		error:function(){CloseLoader(); console.log("Admin View Meter List Server Error");}
        		
        	}) // ajax close
        })// function close
        
        $(document).on("click",".edit_user", function(){
        	StartLoader();
        	var uid = $(this).attr("uid");
        	$.ajax({
        		url:"ViewSpecificUser",
        		data:{"id":uid},
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			//console.log(data);
        			$(".update_user_button1").attr("uid",uid);
        			$(".delete_user_button1").attr("uid",uid);
        			$(".update_u_name").val(data[0].name);
        			$(".update_u_contact").val(data[0].contact);
        			$(".update_u_email").val(data[0].email);
        			$(".update_u_address").val(data[0].address);
        			$("#UserEditModel").modal("show");
        			CloseLoader();
        			
        		},
				error:function(){CloseLoader(); console.log("Specific User Details Server Error");}
        	}) // ajax close
        })// close click function
        
        
        $(document).on("click",".print_user", function(){
        	$("#example1").dataTable().fnDestroy();
        	
        	StartLoader();
        	var uid = $(this).attr("uid");
        	$.ajax({
        		url:"ViewSpecificUserMeterBill",
        		data:{"id":uid},
        		type:"post",
        		dataType:"json",
        		success:function(res){
        			console.log(res);
        			/* User Details */
        			$(".payment_button").attr("uid",uid);
        			$(".print_u_name").html(res[0][0].name);
        			$(".print_u_contact").html(res[0][0].contact);
        			$(".print_u_meter").html(res[0][0].meter_number);
					$("#PritnUserModel").modal("show");
					
					/* Bill History */
					
					var data =""; 
					if(res[1] != null){
						for(var i=0; i<res[1].length; i++){
						 		data += '<tr>';
	                            //data += '<th scope="row">' +(i+1)+ '</th>';
	                            var dt = res[1][i].date.split("T")
	                            data += '<td style="text-align:center">' + dt[0] + '</td>';
	                            
	                            if(res[1][i].new_reading == null)
	                            	data += '<td class="print_u_pr_rerading">' + res[1][i].previous_reading + '</td>';
	                            else
	                            	data += '<td class="print_u_pr_rerading">' + res[1][i].new_reading + '</td>';
	                            
		                       	if(res[1][i].amount == null)
		                        	data += '<td class="print_u_pr_rerading" style="text-align:center"> - </td>';
		                        else
		                        	data += '<td class="print_u_pr_rerading">' + res[1][i].amount + '</td>';
	
								if(res[1][i].pay == null)
									data += '<td class="print_u_pr_rerading" style="text-align:center"> - </td>';
			                    else
			                    	data += '<td class="print_u_pr_rerading">' + res[1][i].pay + '</td>';

				                if(res[1][i].remaining == null)
				                	data += '<td class="print_u_pr_rerading" style="text-align:center"> - </td>';
				                else
				                	data += '<td class="print_u_pr_rerading">' + res[1][i].remaining + '</td>';
			                  
	                            data += '</tr>';
	                    }
					}
					
                    $(".dvDetailHistory").html(data);
					
                    $("#example1").DataTable({
						columnDefs: [ { type: 'date', 'targets': [0] } ],
				    	order: [[0, 'desc' ]],
						aaSorting: [],
						responsive: true,
						pageLength : 5,
						"bLengthChange" : false, //thought this line could hide the LengthMenu
			    		//"bInfo":false, 
						
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
        			
        			$("#example").wrap( "<div style='width:100%; overflow:scroll'></div>" );
					$(".dataTables_filter input")
					.attr("placeholder", "Search here...")
					.css({
					'text-align': "center",
					background : 'transparent',
					color:'white',
					width:'250px'
					});
					
        			CloseLoader();
        			
        		}, // success close
				error:function(){CloseLoader(); console.log("Specific User Details");}
        	}) // ajax close
        })// close click function
        
    </script>


</head>

	<jsp:include page="LeftHeader.jsp"/> 
    <section id="contents">
	<jsp:include page="TopHeader.jsp"/>
	  
	
<div style="background-color: #d2d2d2; height: 100%;">
<br>
	<div style="background-color: #464646; border-radius: 5px;">
	<br><br>
	<div class="test-1" align="center">
        <table id="example" class="table-bordered table_padding" style="width: 100%; color: white;">
			<thead>
				<tr>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Name</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Contact</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Email</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Address</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Meter No.</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width: 100px;">Created</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width: 100px;">Updated</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Action</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Print</td>
				</tr>
			</thead>
			<tbody style="font-size:12px" class="userlist"></tbody>
		</table>
            
    </div>
    </div> 
    <div class="container-fluid"></div> 
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
                        $(".validation_chechk").each(function () {
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
                        		StartLoader();
                    			var uid = $(".update_user_button1").attr("uid");
                        		var name = $(".update_u_name").val();
                        		var contact = $(".update_u_contact").val();
                        		var email = $(".update_u_email").val();
                        		var address = $(".update_u_address").val();
                        		
                        		$.ajax({
                        			url:"UpdateUserGroup",
                        			data:{"uid":uid, "name":name, "contact":contact, "email":email, "address":address}, 
                        			type:"post",
                        			dataType:"text",
                        			success:function(e){
                        				CloseLoader();
                        				//console.log("Res", e);
                        			},
                        			error:function(){ CloseLoader(); console.log("Update User Server Error"); }
                        		}) // ajax close
                        		
                        	})// function close
                        	
                        }
                    }); //update_user_button1 click close
                
                	
                    $(".delete_user_button1").click(function(){
                    	
                    	var dlt = confirm("Want To Delete This User!");
                    	console.log(dlt); 
                    	if(dlt == true){
                    		StartLoader();
	                    	var uid = $(this).attr("uid");
	                    	$.ajax({
	                			url:"DeleteUserGroup",
	                			data:{"uid":uid}, 
	                			type:"post",
	                			dataType:"text",
	                			success:function(e){
	                				CloseLoader();
	                				//console.log("Res", e);
	                				location.reload(true);
	                			},
	                			error:function(){ CloseLoader(); console.log("Update User Server Error"); }
	                		}) // ajax close
                    	}
                    })// delete function close
                
                })// main funciton close
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
                        <input type="text" class="text_field3 validation_chechk update_u_name" placeholder="User Name*" id="lblUserName">
                        <br />
                        <br />

                        <i class="fa fa-phone fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="number" onkeypress="if(this.value.length>=10) return false" class="text_field3 validation_chechk update_u_contact" placeholder="User Contact*" id="lblContact">
                        <br />
                        <br />

                        <i class="fa fa-envelope fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3 validation_chechk update_u_email" placeholder="User E-Mail*" id="lblEmail">
                        <br />
                        <br />

                        <!-- <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3  update_u_meter" placeholder="User Meter Number*" id="lblMeter" readonly="readonly">
                        <br />
                        <br />
 -->
                        <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3 validation_chechk update_u_address" placeholder="User Address*" id="lblAddress">
                        <br />
                        <br />
                        <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-success update_user_button1">Update</button>
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-danger delete_user_button1">Delete</button>
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

				.dataTables_info {
					color: #ad9999;
				}
                @media(max-width:975px) {
                    #PritnUserModel .modal-dialog {
                        width: auto;
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
            
            
            <script>
            
            $(function(){
            	$(".payment_button").click(function(){
            		var amount = $(".update_bill_amount").val();
            		var uid = $(this).attr("uid");
            		
            		if(amount == ""){
            			$(".update_bill_amount").css({"border-bottom":"solid 2px red"});
            			$(".update_bill_amount").focus();
            		}
            		else {
            			$(".update_bill_amount").css({"border-bottom":""});
            			StartLoader();
	        			
	            		$.ajax({
	            			url:"MakePayment",
	            			data:{"uid":uid, "amount":amount}, 
	            			type:"post",
	            			dataType:"text",
	            			success:function(e){
	            				CloseLoader();
	            				//$(".validation_check").val(""); 
	            				console.log("Res", e);
	            			},
	            			error:function(){ CloseLoader(); console.log("Payment Server Error"); }
	            		}) // ajax close
            		}// else close
            	})// payment button close
            })// main function close

            </script>

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
                            Meter No. : <span class="print_u_meter pp_view" id="lblMeterNum"></span>
                            <br />
                            <br />
                        </div>

                        <div align="left" style="font-weight:bolder">History</div>
                        
                        <div class="container-fluid" style="text-align: left;"></div>

                        <div class="table_data" style="width: 100%; overflow: scroll; color: black">
	                        <table id="example1" class="table-bordered table_padding" style="width: 100%; color: black;">
								<thead>
									<tr>
										<!-- <td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">S.No.</td> -->
										<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width: 100px;">Date</td>
										<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Reading</td>
										<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Amount</td>
										<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Pay</td>
										<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Remaining</td>
									</tr>
								</thead>
								<tbody style="font-size:12px" class="dvDetailHistory"></tbody>
							</table>
                        </div>
                        
                        <!-- <div class="table_data" style="width: 100%; overflow: scroll;" id="dvPDetailHistory">
                        </div> -->
                        <div class="container-fluid"></div>
                    </div>

                    <div style="text-align: center;">
                        <b>AMOUNT :
                            <input id="txtAmount" style="background: transparent; border: none; color: black; border-bottom: solid 1px gray; text-align: center;" type="number" class="update_bill_amount" placeholder="Amount"></b><br />
                        <br />
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <div class="col-md-4">
                            <button type="button" style="width: 100%; font-size: 14px;" class="btn btn-info payment_button">Make Payment</button><br />
                            <br />
                        </div>
                        <div class="col-md-4">
                            <button type="button" style="width: 100%; font-size: 14px;" class="btn btn-success Print_user_button1">Print</button><br />
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
	
	</section>
</html>
