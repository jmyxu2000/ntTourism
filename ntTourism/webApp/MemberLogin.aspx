<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberLogin.aspx.cs" Inherits="MemberLogin" %>
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
<script type="text/javascript">
    function login() {
        var loginname = $("#loginname").val();
        var password = $("#password").val();

        if (loginname == undefined || loginname == "") {
            alert("The account cannot be empty!");
            return;
        }

        $.ajax({
            type: "POST",
            url: "MemberHandler.ashx",
            data: { "loginname": loginname, "password": password, "action": "login" },
            dataType: "text",
            cache: false,
            beforeSend: function () { },
            success: function (data) {

                if (data == "1") {
                    location.href = "index.aspx"
                }
                else  {
                    alert("Access Denied!")
                }
            },
            error: function () { }
        })

    }
    </script>
</head>
<body>
	<form id="form1" runat="server" method="post">
	<!-- header-starts -->
	<uc1:Head ID="Head1" runat="server" />
	<!-- header-ends -->
	<!-- content-section-starts -->
	<div class="content-section">
	<div class="container">
            <div class="paymemt-row-wrap">
                <div class="col-md-10 ">
                    <h3>Member Login</h3>
                    
                    <div class="gap gap-small"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <img class="pp-img" src="images/reg.png" alt="Image Alternative text" title="Image Title" />
                            <p>Important: You will be required to enter your bank details to complete your payment.</p>	
                        </div>
                        <div class="col-md-6" style="padding-bottom:120px">
                                <div class="clearfix">
                                    <div class="form-group form-group-cc-number">
                                        <label>login Name</label>
                                        <input class="form-control" placeholder="input your login name" type="text" id="loginname" /><span class="cc-card-icon"></span>
                                    </div>
                                    <div class="form-group form-group-cc-number">
                                        <label>password</label>
                                        <input class="form-control" placeholder="input your login password" type="password" id="password"/>
                                    </div>
                                </div>
                                
                                <input class="btn btn-primary" type="button" value="Login" onclick="login()" />
                            </div>
                    </div>
                </div>
            </div>
            <div class="gap"></div>
        </div>

	<!-- content-section-ends -->
	<!-- footer-section-starts -->
    <uc2:Foot ID="Foot1" runat="server" />
	<!-- footer-section-ends -->
        
    </form>
</body>
</html>
