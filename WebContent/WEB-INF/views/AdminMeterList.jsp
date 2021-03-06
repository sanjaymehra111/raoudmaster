<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html lang="en">
<head>
    <title>Meter List</title>
	<!--For Webpage Logo-->
    <link rel="shortcut icon" href="/raoudmarket/files/images/login.png">
	
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
      padding-bottom:10px;
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
		  /* margin-left: -105%; */
	  }

	  .text_center {
		  text-align: center;
	  }

	  .fix_button {
		padding:10px; 
	  }
	
	  @media(max-width:975px){
		#example_filter {
		  margin-left: 0%;
	  }
	  
	  .dataTables_length {
	      text-align: center;
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
        	$(".pagename").html("Meter List");
		});
        
        $(function(){
        	StartLoader();
        	$.ajax({
        		url:"ViewMeterList",
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			//console.log("Response : ", data);
        			var html="";
        			for(var i=0; i<data.length; i++) {
						html+='<tr>';
						html+='<td>'+data[i].shop_name+'</td>';
						html+='<td>'+data[i].meter_number+'</td>';
						html+='<td>'+data[i].charge+'</td>';
						html+='<td style="text-align:center">'+data[i].date+'</td>';
						if(data[i].updated_date == null)
							html+='<td style="text-align:center"> - </td>';
						else
							html+='<td style="text-align:center">'+data[i].updated_date+'</td>';
						
						if(data[i].status == "1")
							html+='<td style="text-align:center"><button mid="'+data[i].meter_number+'" class="click_button btn_open" style="background-color:green; color:white">OPEN</button></td>';
						else
							html+='<td style="text-align:center"><button mid="'+data[i].meter_number+'" class="click_button btn_close" style="background-color:red; color:white">Close</button></td>';
							
						html+='<td style="text-align:center"><button mid="'+data[i].meter_number+'" class="click_button btn_edit">EDIT</button></td>';
							
					}
        			$(".meterlist").html(html);
        			
        			$("#example").DataTable({
						columnDefs: [ { type: 'date', 'targets': [3] } ],
				    	order: [[3, 'desc' ]],
						aaSorting: [],
						responsive: true,
						pageLength : 10,
						"bLengthChange" : true, //thought this line could hide the LengthMenu
			    		//"bInfo":true, 
						
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

        
        $(document).on("click", ".btn_edit", function(){
        	StartLoader();
        	var mid = $(this).attr("mid");
        	$.ajax({
        		url:"ViewSpecMeterList",
        		data:{"mid":mid},
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			//console.log(data);
        			$(".update_user_button1").attr("mid", data[0].meter_number);
        			$(".update_u_shop_name").val(data[0].shop_name);
        			$(".update_u_meter").val(data[0].meter_number);
        			$(".update_u_meter_charge").val(data[0].charge);
        			
        			var button = '<button mid="'+data[0].meter_number+'" statusto="0" style="outline: none; width: 81%; font-size: 14px;" class="btn btn-danger meter_status_change">Change Status To Closed</button>';
                	if(data[0].status == "0")
                    var button = '<button mid="'+data[0].meter_number+'" statusto="1" style="outline: none; width: 81%; font-size: 14px;" class="btn btn-success meter_status_change">Change Status To Open</button>'; 
                	$("#dvStatusInfo").html(button);
                	
                	$("#MeterEditModel").modal("show");
                	CloseLoader();
        			
        		},// success close
        		error:function(){CloseLoader(); console.log("Admin View Specific Meter List Server Error");}
        	})// ajax close 
        })// click close
        
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
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Shop Name</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Meter No.</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Charge</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width:100px">Created</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width:100px">Updated</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Status</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Action</td>
				</tr>
			</thead>
			<tbody style="font-size:12px" class="meterlist"></tbody>
		</table>
            
    </div>
    </div>
    <div class="container-fluid"></div> 
</div>
   

<div id="MeterEditModel" class="modal fade" role="dialog">

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
                            	var shop = $(".update_u_shop_name").val();
                            	var charge = $(".update_u_meter_charge").val();
                            	var mid = $(".update_user_button1").attr("mid");
                                		
                    			$.ajax({
                        			url:"UpdateMeterDetails",
                        			data:{"mid":mid, "shop":shop, "charge":charge}, 
                        			type:"post",
                        			dataType:"text",
                        			success:function(e){
                        				CloseLoader();
                        				//console.log("Res", e);
                        				location.reload(true);
                        			},
                        			error:function(){ CloseLoader(); console.log("Update Meter Details Server Error"); }
                        		}) // ajax close
                        	})// main functino close
                        }
                    }); //update_user_button1 click close
                
                
                    $(document).on("click", ".meter_status_change", function () {
                    	var mid = $(this).attr("mid");
                        var status = $(this).attr("statusto");
                        //var error = "Change To Close";
                        //if(status == "1")
                        //	error = "Change To Open";
                        var chk = window.confirm("Continue To Change Status");
                    	if(chk == true){
	                    	StartLoader();
	                        $.ajax({
	                    		url:"UpdateMeterStatus",
	                    		data:{"mid":mid, "status":status}, 
	                    		type:"post",
	                    		dataType:"text",
	                    		success:function(e){
	                    			CloseLoader();
	                    			//console.log("Res", e);
	                    			location.reload(true);
	                    		},
	                    		error:function(){ CloseLoader(); console.log("Update Meter Status Server Error"); }
	                    	}) // ajax close
                    	}// if close
                    })// main functino close
                    
                
                })

            </script>

            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background-image: linear-gradient(#adccdc, rgba(150, 150, 150, 0.22), rgba(119, 220, 243, 0.17));">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align: center;">Edit Meter Details</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;">


                        <i class="fa fa-home fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3 update_u_shop_name" placeholder="User Shop Name*" id="lblShopName">
                        <br>
                        <br>

                        <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="text" class="text_field3  update_u_meter" placeholder="User Meter Number*" id="lblMeterNum" readonly="readonly">
                        <br>
                        <br>

                        <i class="fa fa-inr fa_text_fonts1 fa_text_fonts12"></i>
                        <input type="number" onkeypress="if(this.value.length>=10) return false" class="text_field3  update_u_meter_charge" placeholder="Meter Charge*" id="lblMeterCharge">
                        <br>
                        <br>
                        <br>

                        <div style="text-align: center;" id="dvStatusInfo">
                        </div>
                        <br>
                        <br>
                        <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-success update_user_button1">Update</button>
                        <button type="button" style="width: 100px; font-size: 14px;" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        	
</section>
</html>
