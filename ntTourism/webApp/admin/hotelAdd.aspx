<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelAdd.aspx.cs" Inherits="admin_hotelAdd" %>
<!--_meta 作为公共模版分离出去-->
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

    <title>hotel add</title>

   
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
            var hotelcode = $("#HidHotelCode").val();
            var hotelname = $("#hotelname").val();
            var citycode = $("#citycode").val();
            var roomnum = $("#roomnum").val();
            var seq = $("#seq").val();
            var describe = $("#describe").val();
            var imgfile = $("#hidImgFile").val();

            $.ajax({
                type: "POST",
                url: "HotelHandler.ashx",
                data: {"hotelcode":hotelcode, "hotelname": hotelname, "citycode": citycode, "roomnum": roomnum, "seq": seq, "describe": describe, "imgfile": imgfile, "action": "hoteladd" },
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
            <asp:HiddenField ID="HidHotelCode" runat="server" />
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">hotel picture：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <span class="btn-upload form-group">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="btnImgUp" CssClass="btn btn-primary radius" runat="server" Text="Upload Picture" OnClick="btnImgUp_Click" />
                        <asp:Label ID="lbl_result" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="hidImgFile" runat="server" />
                    </span>
                </div>
            </div>
            
            
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>hotelname：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="hotelname" name="hotelname" runat="server">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>citycode：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <asp:DropDownList ID="citycode" runat="server" Cssclass =" select"></asp:DropDownList>
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>total room number ：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="roomnum" name="roomnum" runat="server">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>sequence：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="seq" name="seq" runat="server">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">describe：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea id ="describe" name="beizhu" class="textarea" placeholder=" " runat="server"></textarea>
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