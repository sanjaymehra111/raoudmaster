

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html lang="en">
<head>
    
    <title>User Details</title>
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
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.dataTables.min.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.12/af-2.1.2/b-1.2.2/b-colvis-1.2.2/b-flash-1.2.2/b-html5-1.2.2/b-print-1.2.2/cr-1.3.2/fc-3.2.2/fh-3.1.2/kt-2.1.3/r-2.1.0/rr-1.1.2/sc-1.4.2/se-1.2.0/datatables.min.js"></script>    
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	 -->  
	
	
<style>
button, input, select, textarea{
	color:black!important;
	padding-top: 3%;
    padding-left: 2%;
    padding-bottom: 3%;
    border-radius: 10px;
    border: 1px solid #4d4848;
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
    
    .total{
    margin-top: -36px;
    margin-bottom: 28px;
    margin-left: -30px;
    height: 0%;
    width: 16%;
    padding-top: -10%;
    padding-top: 13px;
}
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
    	padding-bottom: 10px;
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


	
	  @media(max-width:975px){
		#example_filter {
		  margin-left: 0%;
	  }
	  
	  .dataTables_length {
      	text-align: center;
      }
      
      .dataTables_filter input {
    	margin-top: -32px!important;
		}
		
		.form-control{
		width:43%!important;
		}
		.dataTables_filter input{
		width: 46%!important;
    	margin-left: 183px;
    	margin-top: -75px!important;
		}
		table.dataTable{
		margin-top: 1px !important;
		}
    
	  }
      
</style>


<style>
.ql-toolbar{
width:97%!important;
background:white;
}
.dataTables_info{
    color:black!important
}
.dataTables_filter input {
    display: block!important; 
}

.dataTables_filter input {
    width: 119%;
    margin-top: -110px;
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

.download_image_button {
	font-size:15px;
}
.download_image_button:hover {
	color:#f8a7a7;
	cursor: pointer;
}
</style>

    
    <script>
    
        $(function ImportPage() {
        	$(".pagename").html("View Bill");
		});
        
        $(function(){
        	StartLoader();
        	$.ajax({
        		url: "fetchdataOfViewBill",
        		type: "post",
        		dataType: "json",
        		success:function(data){
        			 //console.log(data); 
        			var htmlText="";
        			for(var i=0; i<data.length; i++) {
        				//console.log(data[i].id);
        				htmlText+='<tr>';
        				htmlText+='<td style="text-align:center">'+data[i].id+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].user_id+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].user_name.toUpperCase()+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].product_name+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].description+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].charge+'</td>';
        				htmlText+='<td style="text-align:center">'+data[i].date+'</td>';
        				htmlText+='<td style="text-align:center"><img style="width:50px; height:50px; border-radius: 100px" src="http://pcsetupvsss.xyz/UploadedFiles/ProductImages/'+data[i].image+'"></td>';
        				htmlText+='<td style="text-align:center; color:black; "><button id="'+data[i].id+'" style="width:50%!important;" class="DeleteData"> Delete </button></td>';
        				htmlText+='</tr>';
        			}
        			
        			$(".userlist").html(htmlText);
        			
        			//https://pcsetupvsss.xyz/UploadedFiles/user/05599d5b43314de2bce6f346b103f317-IMG_20200717_131717.jpg
        	
        			
        			$('#example thead tr').clone(true).appendTo( '#example thead' );
						//console.log("asdasda");
        			$('#example thead tr:eq(1) th').each(  function (i) {
					        var title = $(this).text();
					        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
					
					        $( 'input', this ).on( 'keyup change', function () {
					            if ( table.column(i).search() !== this.value ) {
					                table
					                    .column(i)
					                    .search( this.value )
					                    .draw();
					            }
					        } );
					        
					} );

        					
        				var min = "1999-01-01";
                        var date = new Date();
                        max = date.getFullYear()+ '-' + ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))+ '-'+ ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())));

                        
                    	$(".ShowDateFunction").hide();
                        var isSafari = /constructor/i.test(window.HTMLElement) || (function (p) { return p.toString() === "[object SafariRemoteNotification]"; })(!window['safari'] || (typeof safari !== 'undefined' && window['safari'].pushNotification));
                        if(!isSafari){
                        	$(".ShowDateFunction").show();
	                        $.fn.dataTable.ext.search.push(
	                            function( settings, data, dataIndex ) {
	                                var date = new Date( data[6] );
	                                date = date.getFullYear()+ '-' + ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))+ '-'+ ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())));
	                         
	                                if (
	                                    ( min === null && max === null ) ||
	                                    ( min === null && date <= max ) ||
	                                    ( min <= date   && max === null ) ||
	                                    ( min <= date   && date <= max )
	                                ) {
	                                    return true;
	                                }
	                                return false;
	                            }
	                        );
                        
                        }
                        
                        $("#fini, #ffin").change( function() {
                            min = $("#fini").val();
                            max = $("#ffin").val();
                            if(min == "")
                                min = "1999-01-01";
                            if(max == ""){
                                var date = new Date();
                                max = date.getFullYear()+ '-' + ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))+ '-'+ ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())));
                            }
                            table.draw();
                        } );
                    
        				
        				/* table.column(5)
	                    .search( this.value)
	                    .draw();
 */			        
        			
        			
					var table = $("#example").DataTable({
						columnDefs: [ { type: 'date', 'targets': [6] } ],
				    	order: [[6, 'desc' ]],
					    aaSorting: [],
					    responsive: true,
					    orderCellsTop: true,
					    fixedHeader: true,
					    "pageLength": 10,
					    "bLengthChange": false, // page length
					    "bFilter": true, // search bar
					    columnDefs: [
					        {
					            responsivePriority: 1,
					            targets: 0
					        },
					        {
					            responsivePriority: 2,
					            targets: -1
					        }
					    ],
						 "footerCallback": function ( row, data, start, end, display ) {
					            var api = this.api(), data;
					 
					            // Remove the formatting to get integer data for summation
					            var intVal = function ( i ) {
					                return typeof i === 'string' ?
					                    i.replace(/[\$,]/g, '')*1 :
					                    typeof i === 'number' ?
					                        i : 0;
					            };
					 
					            // Total over all pages
					            total = api
					                .column( 5 )
					                .data()
					                .reduce( function (a, b) {
					                    return intVal(a) + intVal(b);
					                }, 0 );
					 
					            // Total over this page
					            pageTotal = api
					                .column( 5, { page: 'current'} )
					                .data()
					                .reduce( function (a, b) {
					                    return intVal(a) + intVal(b);
					                }, 0 );
					 
					            // Update footer
					            $( api.column( 5 ).footer() ).html(
					                /* '$'+pageTotal +' ( $'+ total +' total)' */
					            		'Total : ' +pageTotal
					            );
					           // console.log(pageTotal);
					            //$(".total").val(pageTotal);
					        }
					  
					});
					
					$(".dataTables_filter input")
					    .attr("placeholder", "Search here...")
					    .addClass("SeacrhFunction")
					  
					    .css({
					        width: "300px",
					        display: "inline-block"
					    });
					$("#example").wrap("<div class='service_provider_details' style='overflow:scroll'></div>");
					// alert("total")
 					
					//$(".SeacrhFunction").on("keyup",function(){
						//console.log("Pressed Key : ",$(this).val())
						//var table = $('#example').DataTable();
						//var info = table.page.info();
						//console.log(info);
						//console.log(info.end);
						//var count= info.end;
												
					//});
					
					CloseLoader();
        			
        		},
        		error:function(){CloseLoader(); console.log("Admin View Meter List Server Error");}
        	 	}) // ajax close
        	 	
        	 	$(document).on("click", ".DeleteData", function(){
               		var id = $(this).attr("id");
                       console.log(id);
               		var r = confirm("Are You Sure Want To Delete This");
               		if(r == true)
               			{
               				$.ajax({
               					url:"deletedata",
                                   type: "post",
               					data:{"id":id},
               					
               					
               					success:function(data){
               						//alert(data)
               					 location.reload();},
               					error:function(){alert("error")},
               				})
               				}
               			})
        	 	
        	 	/* $.ajax({
            		url: "fetchTotalCharge",
            		type: "post",
            		dataType: "json",
            		success:function(data){
            			//console.log(data);
            			$(".total").val(data[0].amount);
            		},
            		error:function(){CloseLoader(); console.log("Admin View Meter List Server Error");}
        	 	}) // ajax close */
        	 	
        })// function close
        

        
       
        
                
    	/* function myfunc(){
    		var start_date = document.getElementById("start_date").value;
    		var end_date = document.getElementById("end_date").value;
    		console.log(start_date);
    		console.log(end_date);
    	} */

    </script>
    <script>
  
    </script>
</head>

	<jsp:include page="LeftHeader.jsp"/> 
    <section id="contents">
	<jsp:include page="TopHeader.jsp"/>
	  
	
<div style="background-color: #d2d2d2; height: 100%;">
<br>
	<div style="background-color: #464646; border-radius: 5px;">
	<!-- <select class="selectmonth">
		<option value=''>--Select Month--</option>
	    <option selected value='1'>Janaury</option>
	    <option value='2'>February</option>
	    <option value='3'>March</option>
	    <option value='4'>April</option>
	    <option value='5'>May</option>
	    <option value='6'>June</option>
	    <option value='7'>July</option>
	    <option value='8'>August</option>
	    <option value='9'>September</option>
	    <option value='10'>October</option>
	    <option value='11'>November</option>
	    <option value='12'>December</option>
	</select> -->
	<div style="padding-top:25px; color:white; padding-left:10px; min-height:100px">
		<div class="ShowDateFunction">
			FROM <input class="form-control" type="date" id="fini" style="color:black; width:22%">
			TO <input class="form-control" type="date" id="ffin" style="color:black; width:22%">
		</div>
	</div>
	
	<!-- <button  onclick="myfunc()" id="button">GET</button> -->
	<br><br>
	<div class="test-1" align="center">
	    <table id="example" class="table-bordered table_padding" style="width: 100%; color: white;">
			<thead>
				<tr>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Id</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">User Id</th>
					
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">User Name</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Product Name</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Description</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; " id="charge">Charge</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Date</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Image</th>
					<th  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase;">Delete</th>
				</tr>
			</thead>
			
			<tbody style="font-size:12px" class="userlist"></tbody>
			<tfoot>
            <tr>
                <th colspan="5" style="text-align:right"></th>
                <th style="text-align:center;padding:15px;"></th>
            </tr>
        </tfoot>
			
		</table>
		
			<!-- Total<input type="number" class="total" readonly> -->
		          
    </div>
    </div> 
   <div class="container-fluid"></div> 
</div>
	</section>
</html>
