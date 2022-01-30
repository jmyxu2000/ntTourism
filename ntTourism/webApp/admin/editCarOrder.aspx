<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editCarOrder.aspx.cs" Inherits="admin_editCarOrder" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico">
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

    <title> edit car order</title>

    
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
    
    <script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
    
    <script type="text/javascript">
        function dataSave() {
            var ordercode = $("#Hidordercode").val();
            var state = $("#state").val();


            $.ajax({
                type: "POST",
                url: "EditOrderHandler.ashx",
                data: { "state": state, "ordercode": ordercode, "action": "carorderedit" },
                dataType: "text",
                cache: false,
                beforeSend: function () { },
                success: function (data) {
                    if (data == "1") {
                        layer.msg("Request Success!", { icon: 1, time: 1200 }, function () {
                            window.parent.location.reload();
                        });
                    }
                    else {
                        alert("Error!")
                    }
                },
                error: function () { }
            })
        }

    </script>
    
</head>
<body>
    <article class="page-container">
        <form method="post" class="form form-horizontal" runat="server">
            <asp:HiddenField ID="Hidordercode" runat="server" />

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>State：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="Change order state" id="state" name="state" runat="server">
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="button" onclick="dataSave()" value="save">
                </div>
            </div>
        </form>
    </article>
</body>
</html>