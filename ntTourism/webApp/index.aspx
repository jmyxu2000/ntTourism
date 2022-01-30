<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register src="userControl/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="userControl/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<title>NT Tourism</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,900italic,900,700italic,700,500italic,500,400italic,300,300italic,100italic,100' rel='stylesheet' type='text/css'>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
            </script>
<script src="js/jquery.easydropdown.js"></script>
</head>
<body>
    
    <!-- header-starts -->
	<uc1:Head ID="Head1" runat="server" />
	<!-- header-ends -->

	<!-- header-starts -->
	<div class="header">
		<div class="container">
			<div class="header-info">
				<div class="header-info-head text-center">
					<a href="index.aspx"><h1>THE TOP END</h1></a>
					<h2>DIFFERENT FROM BOTTOM END</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- header-ends -->
	<!-- content-section-starts -->
	<div class="content-section">
		<div class="services-section">
			<div class="services-section-left">
				<h3>Go Now</h3>
				<h3>REGRET NEVER</h3>
				<h5>Discover the unique culture and landscape</h5>
			</div>
			<div class="services-section-right">
				<div class="services-section-right-text">
					<p><img src="images/quotes.png" alt="" />Tourism NT is a Northern Territory Government statutory authority responsible for promoting the Northern Territory as a must-do, unique holiday destination.</p>
					<p class="end-q">CU in the NT<img src="images/quot.png" alt="" /></p>
					<a href="https://www.linkedin.com/in/jinmin-xu-2a43691a4/">Jimmy</a>
					<span>Developer</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="call-us text-center">
			<h3></h3>
		</div>
		<div class="planning-section">
			<div class="container">
				<div class="col-md-8 planning-section-left">
					<h3>Travel Planning Tips</h3>
					<h4>& Advice for Everyone</h4>
					<div class="sap_tabs">	
						 <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Hotels</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Cars</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Destinations</span></li>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="tab_img">
                                      <asp:Repeater ID="rpt_hotel" runat="server">
                                      <ItemTemplate>
									  <li>
										<div class="view view-first">                                           
					   		  			   <img src="admin/hotelImage/<%#Eval("hotelpic") %>" class="img-responsive" alt="" style="width:250px; height:230px"/>
										   <div class="info1"> </div>
											 <div class="mask">
						                     </div>
								              <div class="tab_desc">
													<h5><%#Eval("hotelname") %></h5>
													
											  </div>
										  </div>
										</li>
                                        </ItemTemplate>
                                        </asp:Repeater>
										
										
									</ul>
							     </div>
                                </div>

                                <div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="tab_img">
                                      <asp:Repeater ID="rpt_car" runat="server">
                                      <ItemTemplate>
									  <li>
										<div class="view view-first">
					   		  			   <img src="admin/carImage/<%#Eval("pic") %>" class="img-responsive" alt="" style="width:250px; height:230px"/>
										   <div class="info1"> </div>
											 <div class="mask">
						                     </div>
								              <div class="tab_desc">
													<h5><%#Eval("cartype") %></h5>
                                                    
													
											  </div>
										  </div>
										</li>
                                        </ItemTemplate>
                                        </asp:Repeater>
									</ul>
							     </div>	 	        					 
			     		    </div>

                               <div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="tab_img">
                                      <asp:Repeater ID="rpt_destination" runat="server">
                                      <ItemTemplate>
									  <li>
										<div class="view view-first">
					   		  			   <img src="admin/destinationImage/<%#Eval("pic") %>" class="img-responsive" alt="" style="width:250px; height:230px"/>
										   <div class="info1"> </div>
											 <div class="mask">
						                     </div>
								              <div class="tab_desc">
													<h5><%#Eval("destinationname") %></h5>
													
											  </div>
										  </div>
										</li>
                                        </ItemTemplate>
                                        </asp:Repeater>
									</ul>
							     </div>	 	        					 
			     		    </div>
                        </div>
                    </div>
				</div>
				<div class="col-md-4 planning-section-right">
					<div class="planning-section-right-grid">
						<div class="yup-text">
							<h3>Tourism NT</h3>
						</div>
						<div class="image">
							<img src="images/yup.jpg" alt="" />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="planning-section-right-grid2">
						<div class="couple-text">
							<h3>IT'S THE TIME TO BE A TERRITORIAN</h3>
						</div>
						<div class="couple-image">
							<img src="images/couple.png" alt="" />
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<uc2:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
</body>
</html>
