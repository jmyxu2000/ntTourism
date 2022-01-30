<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelDetails.aspx.cs" Inherits="HotelDetails" %>

<%@ Register src="userControl/Foot.ascx" tagname="Foot" tagprefix="uc1" %>

<%@ Register src="userControl/Head.ascx" tagname="Head" tagprefix="uc2" %>

<!DOCTYPE html>
<html>
<head>
<title>TRAVEL</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link rel="stylesheet" href="css/font-awesome.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<script src="js/jquery.easydropdown.js" type="text/javascript"></script>
	<!---strat-date-piker---->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>
		  <script>
				  $(function() {
				    $( "#datepicker,#datepicker1" ).datepicker();
				  });
		  </script>
<!---/End-date-piker---->
    <script type ="text/javascript">
        function goBooking(id)
        {
            var code = $("#HidMemberCode").val();
            if (code == undefined || code == "")
            {
                alert("please login first!");
                return;
            }
            //判断是否登录
            location.href = "HotelOrder.aspx?getid=" + id;
        }
    </script>
</head>
<body>
	<form id="form1" runat="server">
	<!-- header-starts -->
	<uc2:Head ID="Head1" runat="server" />
	<!-- header-ends -->
	<!-- content-section-starts -->
	<!--start main -->
    <asp:HiddenField ID="HidMemberCode" runat="server" />
<div class="main_bg">
<div class="container">
	<div class="main">
		<asp:Repeater ID="rpt_hotelDetails" runat="server">
        <ItemTemplate>
        <div class="details">
			<h2><%#Eval("hotelname") %></h2>
			<div class="det_pic">
				  <img src="admin/hotelImage/<%#Eval("hotelpic") %>" alt="" style="height:350px"/>
			</div>
			<div class="det_text">
				<%#Eval("describe") %>
				<%--<div class="read_more">
					 <a href="details.html">read more</a>
				</div>--%>
			</div>
		</div>
        </ItemTemplate>
        </asp:Repeater>

    <table class="table table-hover">
	<caption>Room List</caption>
	<thead>
		<tr>
			<th>Room Name</th>
			<th>Room Type</th>
			<th>Price</th>
            <th>Describe</th>
            <th>Booking</th>
		</tr>
	</thead>
	<tbody>
        <asp:Repeater ID="rpt_room" runat="server">
        <ItemTemplate>
		<tr>
			<td><%#Eval("roomname") %></td>
			<td><%#Eval("roomtype") %></td>
			<td>$<%# Convert.ToDecimal (Eval("price")).ToString("f2")%></td>
            <td><%#Eval("describe") %></td>
            <td><a href="##" onclick="goBooking('<%#Eval("roomcode") %>')">booking</a></td>
		</tr>
        </ItemTemplate>
        </asp:Repeater>
	</tbody>
</table>
	</div>
</div>
</div>	
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
    <uc1:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
        
    </form>
</body>
</html>
