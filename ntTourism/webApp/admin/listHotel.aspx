<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listHotel.aspx.cs" Inherits="admin_listHotel" %>


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
<title>Hotel</title>
</head>
<body>
<br />
<div class="page-container">
	<div class="text-l"> 
		<input type="text" class="input-text" style="width:250px" placeholder="Search Hotel" id="searchhotelname" name="">
		<button type="button" class="btn btn-success radius" id="" name="" onclick="search()"><i class="Hui-iconfont">&#xe665;</i> Search</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
         <a href="javascript:;" onclick="member_add('add hotel','hotelAdd.aspx','','530')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> add hotel</a></span>  </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="20">seq</th>
				<th width="100">cityname</th>
				<th width="50">hotelname</th>
				<th width="50">roomNum</th>
				<th width="150">hotelpic</th>
				<th width="200">describe</th>
				<th width="100">operation</th>
			</tr>
		</thead>
		<tbody>
            <asp:Repeater ID="rpt_list" runat="server">
			<ItemTemplate>
				<tr class="text-c">
				<td><%#Eval("seq")%></td>
				<td> <%#Eval("cityname")%></td>
				<td><%#Eval("hotelname")%></td>
				<td><%#Eval("roomNum")%></td>
				<td>
                    <img style="width:100px; height:100px" src="hotelImage/<%#Eval("hotelpic")%>" />
				</td>
				<td class="text-l"><%#Eval("describe") %></td>
				<td class="td-manage">
                    <a title="edit" href="javascript:;" onclick="member_edit('edit','hotelAdd.aspx?getid=<%#Eval("hotelcode") %>','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
                    <a title="delete" href="javascript:;" onclick="member_del(this,'<%#Eval("hotelcode")%>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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


function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}

function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}


function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function search() {
    var hname = $("#searchhotelname").val();
    location.href = "listHotel.aspx?htname=" + hname ;
}


function member_del(obj, id) {
   
    layer.confirm('Are you sure you want delete？', function (index) {
		$.ajax({
		    type: 'POST',
		    data:{"id":id,"action":"del"},
			url: 'HotelHandler.ashx',
			dataType: 'text',
			success: function (data) {
			    if (data == "1")
			    {
			        layer.alert("Delete success");
			        location.href = "listHotel.aspx";
			    }
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script> 
</body>
</html>