<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberCenter.aspx.cs" Inherits="MemberCenter" %>


<%@ Register src="userControl/Foot.ascx" tagname="Foot" tagprefix="uc1" %>

<%@ Register src="userControl/Head.ascx" tagname="Head" tagprefix="uc2" %>

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
   
</head>
<body>
	<form id="form1" runat="server">
	<!-- header-starts -->
	<uc2:Head ID="Head1" runat="server" />
	<!-- header-ends -->
	<!-- content-section-starts -->
	<!--start main -->
   

    <br />
    <table class="table table-hover">
	<caption><h2>Hotel Order List</h2></caption>
	<thead>
		<tr>
			<th>Room Name</th>
			<th>Room Type</th>
			<th>Price</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
		</tr>
	</thead>
	<tbody>
        <asp:Repeater ID="rpt_hotelorder" runat="server">
        <ItemTemplate>
        <tr>
			<td width="30"><%#Eval("roomname")%></td>
			<td width="30"><%#Eval("roomtype")%></td>
            <td width="30"><%#Eval("orderprice")%></td>
            <td width="50"><%#Eval("begindate")%></td>
            <td width="50"><%#Eval("enddate")%></td>
            <td width="30"><%#Eval("state")%></td>
            
		</tr>
        </ItemTemplate>
        </asp:Repeater>
        

	</tbody>
    </table>
    <br />
    <table class="table table-hover">
	<caption><h2>Car Order List</h2></caption>
	<thead>
		<tr>
			<th>Car Type</th>
			<th>Order Price</th>
			<th>Pickup Location</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
		</tr>
	</thead>


	<tbody>
        <asp:Repeater ID="rpt_carorder" runat="server">
        <ItemTemplate>
        <tr>
			<td width="30"><%#Eval("cartype")%></td>
			<td width="30"><%#Eval("orderprice")%></td>
			<td width="30"><%#Eval("location")%></td>
            <td width="50"><%#Eval("begindate")%></td>
            <td width="50"><%#Eval("enddate")%></td>
            <td width="30"><%#Eval("state")%></td>
		</tr>
        </ItemTemplate>
        </asp:Repeater>
       
	</tbody>
    </table>

    <br />
        <table class="table table-hover">
    
	<caption><h2>Destination Order List</h2></caption>
	<thead>
		<tr>
			<th>Destination Name</th>
			<th>Price</th>
			<th>Date</th>
            <th>Status</th>
		</tr>
	</thead>
	<tbody>
        <tr>
	    <asp:Repeater ID="rpt_destinationorder" runat="server">
        <ItemTemplate>
        <tr>
			<td width="50"><%#Eval("destinationname")%></td>
			<td width="30"><%#Eval("orderprice")%></td>
            <td width="50"><%#Eval("date")%></td>
            <td width="30"><%#Eval("state")%></td>
		</tr>
        </ItemTemplate>
        </asp:Repeater>
		</tr>

	</tbody>
    </table>

	<!-- content-section-ends -->
	<!-- footer-section-starts -->
    <uc1:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
        
    </form>
</body>
</html>

