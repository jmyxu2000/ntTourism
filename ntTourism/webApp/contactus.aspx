<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<%@ Register Src="~/userControl/Foot.ascx" TagPrefix="uc1" TagName="Foot" %>
<%@ Register Src="~/userControl/Head.ascx" TagPrefix="uc1" TagName="Head" %>



<!DOCTYPE html>
<html>
<head>
<title>NT Tourism</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link rel="stylesheet" href="css/font-awesome.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script type="text/javascript">
	    function dataSave() {

	        var username = $("#userName").val();
	        var useremail = $("#userEmail").val();
	        var usermobile = $("#userMobile").val();
	        var usermsg = $("#userMsg").val();

	        if (username == undefined || username == "") {

	            alert("Your name must be filled");
	            return;
	        }


	       
	        if (usermsg == undefined || username == "") {

	            alert("The message box should not be empty ");
	            return;
	        }



	        $.ajax({
	            type: "POST",
	            url: "ContactHandler.ashx",
	            data: { "username": username, "useremail": useremail, "usermobile": usermobile, "usermsg": usermsg },
	            dataType: "text",
	            cache: false,
	            beforeSend: function () { },
	            success: function (data) {
	                if (data == "1") {
	                    alert("Request Success!")
	                    location.href = "index.aspx"
	                }
	                else {
	                    alert("Error!")
	                }
	            },
	            error: function () { }


	        })
	    }

</script>



<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,900italic,900,700italic,700,500italic,500,400italic,300,300italic,100italic,100' rel='stylesheet' type='text/css'>
		<script src="js/jquery.easydropdown.js" type="text/javascript"></script>
</head>
<body>
	<!-- header-starts -->
    <uc1:Head runat="server" ID="Head" />
	<!-- header-ends -->
	<!-- content-section-starts -->
	<div class="main_bg">
<div class="container">
	<div class="main">
		<div class="contact">				
				<div class="contact_left">
					<div class="contact_info">
			    	 	<h3>Find Us Here</h3>
			    	 		<div class="map">
					   			<iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color: #444444;text-shadow: 0 1px 0 #ffffff;text-align: left;font-size: 1em;padding: 5px;font-weight: 600;">View Larger Map</a></small>
					   		</div>
      				</div>
      			<div class="company_address">
				     	<h3>Company Information :</h3>
						<p>Northern Territory</p>
						<p>Darwin</p>
						<p>AU</p>
				   		<p>Phone:(61)0481995378</p>
				 	 	<p>Email: <a href="jimmyxu200011@gmail.com"></a></p>
				   		<p>Follow on: <a href="#">Facebook</a>, <a href="#">Twitter</a></p>
				   </div>
				</div>				
				<div class="contact_right">
				  <div class="contact-form">
				  	<h3>Contact Us</h3>
					    <form method="post" action="">
					    	<div>
						    	<span><label>NAME</label></span>
						    	<span><input name="userName" id="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input name="userEmail" id="userEmail" type="text" class="textbox"></span>
						    </div>
						    <div>
						     	<span><label>MOBILE</label></span>
						    	<span><input name="userPhone" id="userMobile"type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>SUBJECT</label></span>
						    	<span><textarea name="userMsg" id="userMsg"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="button" onclick="dataSave()" value="submit us"></span>
						  </div>
					    </form>
				    </div>
  				</div>		
  				<div class="clearfix"></div>		
		  </div>
	</div>
</div>
</div>			
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<uc1:Foot runat="server" ID="Foot" />
	<!-- footer-section-ends -->
</body>
</html>