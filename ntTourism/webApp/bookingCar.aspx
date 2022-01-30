<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookingCar.aspx.cs" Inherits="bookingCar" %>

<%@ Register src="userControl/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="userControl/Foot.ascx" tagname="Foot" tagprefix="uc2" %>

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
<!---/End-date-piker---->
<script type="text/javascript">
    function GoOrder(obj)
    {
        var code = $("#HidMemberCode").val();
        if (code == undefined || code == "")
        {
            alert("please login first!");
            return;
        }
        location.href = "CarOrder.aspx?getid=" + obj;
    }
</script>
</head>
<body>
	<form id="form1" runat="server">
	<!-- header-starts -->
	<uc1:Head ID="Head1" runat="server" />
	<!-- header-ends -->

	<!-- content-section-starts -->
	<!--start main -->
        <asp:HiddenField ID="HidMemberCode" runat="server" />  
<div class="main_bg">
<div class="container">
	<div style="height:10px"></div>
	<!--start grids_of_3 -->
	<div class="grids_of_3">
        <asp:Repeater ID="rpt_car" runat="server">
        <ItemTemplate>
		<div class="grid1_of_3" style="padding-bottom:20px">
			<div class="grid1_of_3_img">
                <a href="javascript::" onclick="GoOrder('<%#Eval("carcode")%>')">
				    <img src="admin/carImage/<%#Eval("pic") %>" style="width:350px;height:248px" alt="" />
		            <span class="next"> </span>
                </a>
			</div>
            <h5><%#Eval("cartype")%></h5>
		    <div>Available at <%#Eval("location") %></div>
			<h4>Price at $<%# Convert.ToDecimal (Eval("budget")).ToString("f2")%></h4>
			<div><%#Eval("describe") %></div>
            <input type="button" class="btn btn-success radius" value="booking" onclick="GoOrder('<%#Eval("carcode")%>')"/>
		</div>
        </ItemTemplate>
        </asp:Repeater>
		<div class="clearfix"></div>
	</div>	
</div>
</div>		
<!--start main -->
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
    <uc2:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
    </form>
</body>
</html>
