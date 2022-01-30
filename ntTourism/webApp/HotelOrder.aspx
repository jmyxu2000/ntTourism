<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelOrder.aspx.cs" Inherits="HotelOrder" %>
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
<!---/End-date-piker---->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
    $(function () {
        $("#begindate,#enddate").datepicker();
    });

    function GetTotalMoney()
    {
        var bdate = $("#begindate").val();
        var edate = $("#enddate").val();
        var a1 = Date.parse(new Date(bdate));
        var a2 = Date.parse(new Date(edate));
        var day = parseInt((a2 - a1) / (1000 * 60 * 60 * 24));
        var price = $("#price").val();
        $("#totalmoney").html(price * day);
    }

    function dataSave()
    {
        var roomcode = $("#hidroomcode").val();
        var membercode = $("#HidMemberCode").val();
        var orderprice = $("#totalmoney").html();
        var begindate = $("#begindate").val();
        var enddate = $("#enddate").val();
        var adultnum = $("#adultnum").val();
        var cardnumber = $("#cardnumber").val();
        var cvv = $("#cvv").val();
        var cardholder = $("#cardholder").val();
        var validthru = $("#validthru").val();

        $.ajax({
            type: "POST",
            url: "HotelOrderHandler.ashx",
            data: { "roomcode": roomcode, "membercode": membercode, "orderprice": orderprice, "begindate": begindate, "enddate": enddate, "adultnum": adultnum, "cardnumber": cardnumber, "cvv": cvv, "cardholder": cardholder, "validthru": validthru, "action": "hotelorderadd" },
            dataType: "text",
            cache: false,
            beforeSend: function () { },
            success: function (data) {
                if (data == "1") {
                    alert("Order Success!")
                    location.href = "MemberCenter.aspx"
                }
                else {
                    alert("Error!")
                }
            },
            error: function () {}


        })
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
	<!-- header-starts -->
	<uc1:Head ID="Head1" runat="server" />
	<!-- header-ends -->
	<!-- content-section-starts -->
	    
	<div class="content-section">
	<div class="container">
            <div class="paymemt-row-wrap">
                <div class="col-md-8 ">
                    <h3>Order Details</h3>
                    <ul class="list booking-item-passengers">
                        <li>
                            <div class="row">
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Room Name</label>
                                        <input class="form-control" type="text" id="roomName" value="<%=model.Roomname %>"/>
                                    </div>
                                    <div class="form-group">
                                        <asp:HiddenField ID="hidroomcode" runat="server" value=""/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Room Type</label>
                                        <input class="form-control" type="text" id="roomType" value ="<%=model.Roomtype %>" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Member Name</label>
                                        <asp:HiddenField ID="HidMemberCode" runat="server" />
                                        <input class="date-pick-years form-control" type="text" id="membername" runat="server" value=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-md-offset-3">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input class="form-control" id="price" type="text" value ="<%=model.Price.ToString("#.##") %>"/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    
                                </div>
                                <div class="col-md-3">
                                    
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="row">
                                <div class="col-md-3">
                                    
                                </div>
                                <div class="col-md-3">
                                    <div class="book_date">
                                        <label>begin Date</label>
                                        <input class="date" id="begindate" type="text" value="">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="book_date">
                                        <label>end Date</label>
                                        <input class="date" id="enddate" type="text" value="">
                                    </div>
                                </div>
                               
                                
                                <div class="col-md-3">
                                    <div class="section_room">
                                        <label>Number of Adult</label>
                                        <select id="adultnum" onchange="GetTotalMoney()" class="frm-field required">
							                <option value="1">1</option>
				                            <option value="2">2</option>         
				                            <option value="3">3</option>
							                <option value="4">4</option>
		        		                </select>
                                    </div>
                                </div>
                            </div>
                            
                        </li>
                    </ul>
                    <div class="gap gap-small"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <img class="pp-img" src="images/paypal.png" alt="Image Alternative text" title="Image Title" />
                            <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p>	
                        </div>
                        <div class="col-md-6">
                            
                                <div class="clearfix">
                                    <div class="form-group form-group-cc-number">
                                        <label>Card Number</label>
                                        <input class="form-control" id="cardnumber" placeholder="input your card num" type="text" onblur="GetTotalMoney()" /><span class="cc-card-icon"></span>
                                    </div>
                                    <div class="form-group form-group-cc-cvc">
                                        <label>CVV</label>
                                        <input class="form-control" id="cvv" placeholder="input cvv" type="text" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                    <div class="form-group form-group-cc-name">
                                        <label>Cardholder Name</label>
                                        <input class="form-control" type="text"  placeholder="input Cardholder Name" id="cardholder"/>
                                    </div>
                                    <div class="form-group form-group-cc-date">
                                        <label>Valid Thru</label>
                                        <input class="form-control" id="validthru" placeholder="mm/yy" type="text" />
                                    </div>
                                </div>
                                
                                <input class="btn btn-primary" type="button" onclick = "dataSave()" value="Proceed Payment" />
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="booking-item-payment">
                        <header class="clearfix">
                            <h5 class="mb0">Need pay</h5>
                        </header>
                        <p class="booking-item-payment-total" id="totalprice">Total Money:  <span id="totalmoney"></span>
                        </p>
                    </div>
                </div>
				<div class="clearfix"></div>
            </div>
            <div class="gap"></div>
        </div>
    </div>
	<!-- content-section-ends -->
	<!-- footer-section-starts -->
	<uc2:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
    </form>
</body>
</html>

