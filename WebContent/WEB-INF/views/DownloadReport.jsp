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
        		url:"ViewUserGroupAllDetails",
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			//console.log("Response : ", data);
        			var html="";
        			for(var i=0; i<data.length; i++) {
						html+='<tr>';
						html+='<td>'+data[i].name+'</td>';
						html+='<td>'+data[i].contact+'</td>';
						html+='<td>'+data[i].meter_number+'</td>';
						var date = data[i].date.split(" ");
						html+='<td style="text-align:center">'+date[0]+'</td>';
						html+='</tr>';
        			}
        			$(".userlist").html(html);
        			
        			$("#example").DataTable({
						columnDefs: [ { type: 'date', 'targets': [3] } ],
				    	order: [[3, 'desc' ]],
						aaSorting: [],
						responsive: true,
						pageLength : 10,
						"bLengthChange" : true, //thought this line could hide the LengthMenu
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
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width: 100px;">Meter No.</td>
					<td  style="text-align:center; padding:8px;  font-size:12px; font-weight:bold; text-transform: uppercase; min-width: 100px;">Created</td>
					
				</tr>
			</thead>
			<tbody style="font-size:12px" class="userlist"></tbody>
		</table>
            
    </div>
    </div> 
    <div class="container-fluid"></div> 
</div>
	</section>
</html>
