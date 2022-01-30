<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberReg.aspx.cs" Inherits="MemberReg" %>
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
    function register() {
        var loginname = $("#loginname").val();
        var password = $("#password").val();
        var name = $("#Name").val();
        var phone = $("#phone").val();
        var gender = $("#Gender").val();

        

        $.ajax({
            type: "POST",
            url: "MemberHandler.ashx",
            data: { "loginname": loginname, "password": password, "name": name, "phone": phone, "gender": gender, "action": "register" },
            dataType: "text",
            cache: false,
            beforeSend: function () { },
            success: function (data) {
                if (data == "-99")
                {
                    alert("member name all ready exists!");
                }
                else if (data == "1") {
                    alert("Your account has been created! ")
                    location.href = "index.aspx"
                }
                else {
                    alert(" Denied!")
                }
                
            },
            error: function () { }
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
                <div class="col-md-10 ">
                    <h3>Member Register</h3>
                    
                    <div class="gap gap-small"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <img class="pp-img" src="images/reg.png" alt="Image Alternative text" title="Image Title" />
                            <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p>	
                        </div>
                        <div class="col-md-6" style="padding-bottom:20px">
                                <div class="clearfix">
                                    <div class="form-group form-group-cc-number">
                                        <label>login Name</label>
                                        <input class="form-control" id="loginname" placeholder="input your login name" type="text" /><span class="cc-card-icon"></span>
                                    </div>
                                    <div class="form-group form-group-cc-number">
                                        <label>login pwd</label>
                                        <input class="form-control" id="password" placeholder="input your login password" type="text" />
                                    </div>
                                </div>

                                <div class="clearfix">
                                    <div class="form-group form-group-cc-name">
                                        <label>Gender:</label>
                                        <select style="height:30px" size="1" id ="Gender">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="clearfix">
                                    <div class="form-group form-group-cc-name">
                                        <label>Name</label>
                                        <input class="form-control" type="text" id="Name" placeholder="input your first name" />
                                    </div>
                                    <div class="form-group form-group-cc-name">
                                        <label>phone</label>
                                        <input class="form-control" type="text" id="phone" placeholder="input your contact number" />
                                    </div>
                                </div>
                                
                                <input class="btn btn-primary" type="button" value="Register" onclick="register()" />
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
