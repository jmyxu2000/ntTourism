<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listAttraction.aspx.cs" Inherits="admin_listAttraction" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Attraction</title>
</head>
<body>

<div class="page-container">
	<div class="text-c">
		
		<input type="text" class="input-text" style="width:250px" placeholder="Search Destination" id="searchdestinationname" name="">
		<button type="button" class="btn btn-success radius" id="" onclick="search()" name=""><i class="Hui-iconfont">&#xe665;</i> Search</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="member_add('add attraction','destinationAdd.aspx','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> Add Attraction</a></span> </div>
	<div class="mt-20">
    <br />
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="20">seq</th>
				<th width="80">attraction name</th>
				<th width="80">city</th>
				<th width="80">price</th>
				<th width="">describe</th>
				<th width="130">picture info</th>
				
				<th width="100">operation</th>
			</tr>
		</thead>
		
		<tbody>
            <asp:Repeater ID="rpt_list" runat="server">
			<ItemTemplate>
			<tr class="text-c">
				<td><%#Eval("seq") %></td>
				<td><%#Eval("destinationname") %></td>
				<td><%#Eval("cityname") %></td>
				<td><%#Eval("needmoney") %></td>
				<td class="text-l"><%#Eval("describe") %></td>
				<td><img style="width:100px; height:100px" src="destinationImage/<%#Eval("pic")%>" /></td>
				
				<td class="td-manage">
                    <a title="edit" href="javascript:;" onclick="member_edit('edit','destinationAdd.aspx?getid=<%#Eval("destinationcode") %>','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
                    <a title="delete" href="javascript:;" onclick="member_del(this,'<%#Eval("destinationcode")%>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</td>
			</tr>
			</ItemTemplate>
			</asp:Repeater>
		</tbody>
	</table>
	</div>
</div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 

<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.15/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

	

    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}


function member_edit(title,url,id,w,h){
    layer_show(title,url,w,h);
}
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);	
    }

    function search() {
        var attractionname = $("#searchdestinationname").val();
        location.href = "listAttraction.aspx?destinationname=" + attractionname;
    }
    function member_del(obj, id) {

        layer.confirm('Are you sure you want delete？', function (index) {
            $.ajax({
                type: 'POST',
                data: { "id": id, "action": "del" },
                url: 'DestinationHandler.ashx',
                dataType: 'text',
                success: function (data) {
                    if (data == "1") {
                        layer.alert("Delete success");
                        location.href = "listAttraction.aspx";
                    }
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

</script> 
</body>
</html>
