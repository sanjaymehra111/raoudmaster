
<div class="loader_head">
  
  
 <div class="loading_page">

 <style> 
   .loading_circle
    {
	    top: 45%;
	    position: absolute;
	    left: 48%;
    }
    .loading_page
    {
	    position: fixed;
	    width: 100%;
	    height: 0%;
	    overflow:hidden;
	    background: #000000ed; 
	    z-index: 999999;
	    top: 0;
    }
    
     .circle {
	  	box-sizing: border-box;
	  	width: 70px;
		height: 70px;
	  	border-radius: 50%;
	  	border: 2px solid #908888;
	  	border-top-color: #ffffff;
	  	animation: spin 2s infinite linear;
	}  

 	
	 .rotate_image
	 {
	 	width:100px;
	 	animation: spin 2s infinite linear;
	 }
	 
	 @keyframes spin { 
	  100% { 
	    transform: rotate(360deg); 
	  } 
	} 
	 
	 
	@media(max-width:975px)
	{
		.loading_circle
	    {
		    top: 40%;
		    position: absolute;
		    left: 40%;
	    }
	}
	
 </style>
 
 <script>
 function StartLoader(){
	 $(".loading_page").css({"height":"100%"});
 }
 function CloseLoader(){
	 $(".loading_page").css({"height":"0%"});
 }
 </script>
 	
 <div class="circle loading_circle">
 <!-- <img class="rotate_image" src="/serviceonway/files/images/android_logo.png"> -->
 </div>
 
 </div>
 
  
</div>