<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="userControl_Head" %>
<div class="page-header">
		<div class="container">
			<div class="page-header-info">
				<div class="page-header-info-head text-center">
					<a href="index.aspx"><h1>NT Tourism</h1></a>
				</div>
				<!-- start h_menu4 -->
					<div class="h_menu4">
					<a class="toggleMenu" href="">Menu</a>
					<ul class="nav p-nav">
						<li class="active"><a href="index.aspx">HOME</a></li>
						<li><a href="booking.aspx">Hotels</a>
							<ul>
								<asp:Repeater ID="rptHotel" runat="server">
									<ItemTemplate>
										<li><a href="booking.aspx?getid=<%#Eval("citycode")%>"><%#Eval("cityname")%></a></li>
									</ItemTemplate>
                                </asp:Repeater>
							</ul>
						</li>
							<li><a href="bookingCar.aspx" class="root">Car Rental</a>
							<ul>
								<asp:Repeater ID="rptCar" runat="server">
									<ItemTemplate>
										<li><a href="bookingCar.aspx?getid=<%#Eval("citycode")%>"><%#Eval("cityname")%></a></li>
									</ItemTemplate>
                                </asp:Repeater>
							</ul>
						</li>

						<li><a href="bookingDestination.aspx" class="root">Destinations</a>
							<ul>
								<asp:Repeater ID="rpt_destination" runat="server">
									<ItemTemplate>
										<li><a href="bookingDestination.aspx?getid=<%#Eval("citycode")%>"><%#Eval("cityname")%></a></li>
									</ItemTemplate>
                                </asp:Repeater>
							</ul>
						</li>
							<li><a href="contactus.aspx">Contact</a></li>
                        <li><a href="#">Welcome:<%=membername %></a>
                            <ul>
                                <li id="li_login" runat="server"><a href="MemberLogin.aspx">Member Login</a></li>
                                <li id="li_reg" runat="server"><a href="MemberReg.aspx">Member Register</a></li>
                                <li id="li_logined" runat="server"><a href="MemberCenter.aspx">Member Center</a></li>
                                <li id="li_close" runat="server"><a href="LoginOut.aspx">LogOut</a></li>
                            </ul>
                        </li>
                        
						</ul>
						<script type="text/javascript" src="js/nav.js"></script>
				    </div>
				<!-- end h_menu4 -->
			</div>
		</div>
	</div>