<%@ page language="java" contentType="text/html; charset=UTF-8"  isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">




<title>产品列表</title>





<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify.core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify.default.css">



</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="/pages/header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="/pages/aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<!-- @@master = admin-layout.html-->
		<!-- @@block = content -->

		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					数据管理 <small>数据列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">数据管理</a></li>
					<li class="active">数据列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建"
											onclick="location.href='${pageContext.request.contextPath}/pages/product-add.jsp'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										<button type="button" id="delPro" class="btn btn-default" title="删除">
											<i class="fa fa-trash-o"></i> 删除
										</button>
										<button type="button" id="openStatus" class="btn btn-default" title="开启">
											<i class="fa fa-check"></i> 开启
										</button>
										<button type="button" id="shieldStatus" class="btn btn-default" title="屏蔽">
											<i class="fa fa-ban"></i> 屏蔽
										</button>
										<button type="button" class="btn btn-default" title="刷新">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" id="term" class="form-control input-sm"
										   placeholder="搜索">
									<button type="button" onclick="find()">搜索</button><span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px;"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">编号</th>
										<th class="sorting_asc sorting_asc_disabled">产品名称</th>
										<th class="sorting_desc sorting_desc_disabled">出发城市</th>
										<th class="sorting">出发时间</th>
										<th class="text-center sorting">产品价格</th>
										<th class="sorting">产品描述</th>
										<th class="text-center sorting">状态</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody id="product">


								</tbody>

							</table>
							<!--数据列表/-->

							<!--工具栏-->
							<div class="pull-left">
								</div>
							</div>
							<div class="box-tools pull-right">
<%--								<div class="has-feedback">--%>
<%--									<input type="text" id="term" class="form-control input-sm"--%>
<%--										placeholder="搜索">--%>
<%--									<button type="button" onclick="find()">搜索</button>--%>
<%--								</div>--%>
							</div>
							<!--工具栏/-->

						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共<span id="pageTotals"></span> 页，共<span id="totalRecords"></span>条数据。 每页
								<select id="pageSize" class="form-control">
								</select> 条
							</div>
						</div>

						<div id="Pagination" class="box-tools pull-right">
<%--							<ul class="Pagination">--%>
<%--								<li><a href="#" aria-label="Previous">首页</a></li>--%>
<%--								<li><a href="#">上一页</a></li>--%>
<%--								<li><a href="#">1</a></li>--%>
<%--								<li><a href="#">2</a></li>--%>
<%--								<li><a href="#">3</a></li>--%>
<%--								<li><a href="#">4</a></li>--%>
<%--								<li><a href="#">5</a></li>--%>
<%--								<li><a href="#">下一页</a></li>--%>
<%--								<li><a href="#" aria-label="Next">尾页</a></li>--%>
<%--							</ul>--%>
						</div>
					</div>

			</section>
			<!-- 正文区域 /-->

		</div>
		<!-- @@close -->
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2014-2017 <a
				href="http://www.hwua.com">上海海文信息技术有限公司</a>.
			</strong> All rights reserved.
		</footer>
		<!-- 底部导航 /-->

	</div>

	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider(1).js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.pagination.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jQuery/alertify.js"></script>


	<script>
		var isFirst = true;
		var currPage;
		$(function () {
			pagination(1,3);

			$("#pageSize").change(function () {
				$("#tbody").empty();
				isFirst = true;
				pagination(1,$(this).val());
			});

			$("#openStatus").click(function () {
				updateProStatus(1);
			});

			$("#shieldStatus").click(function(){
				updateProStatus(0);
			});

			$("#delPro").click(function () {
				delProById();
			})


		});



		function pagination(pageNo,pageSize) {
			$.get(
					"${pageContext.request.contextPath}/product/queryAllPro/"+pageNo+"/"+pageSize,
					function (data) {
						var $tbody = $("#product");
						$tbody.empty();
						$.each(data.list,function(index,pros){
							var $tr = $("<tr></tr>");
							var $td0 = $("<td><input name='ids' value='"+pros.id+"' type='checkbox'/></td>")
							var $td1 = $("<td>"+((index+1)+(pageNo-1)*pageSize)+"</td>");
							var $td2 = $("<td>"+pros.productNum+"</td>");
							var $td3 = $("<td>"+pros.productName+"</td>");
							var $td4 = $("<td>"+pros.cityName+"</td>");
							var $td5 = $("<td>"+pros.departureTime+"</td>");
							var $td6 = $("<td class='text-center'>"+pros.productPrice+"</td>");
							var $td7 = $("<td>"+pros.productDesc+"</td>");
							var $td8 = "";
							if (pros.productStatus === 1){
								$td8 = $("<td  class='text-center'>开启</td>");
							}else {
								$td8 = $("<td  class='text-center'>关闭</td>");
							}
							var $td9 = $("<td class='text-center'></td>");
							var $button1 = $("<button type=\"button\"  class='btn bg-olive btn-xs' onclick=showOrd('"+pros.id+"')>订单</button>");
							// var $button2 = $("<button type=\"button\" class=\"btn bg-olive btn-xs\">详情</button>");
							// var $button3 = $("<button type=\"button\" class=\"btn bg-olive btn-xs\">编辑</button>");
							$td9.append($button1);
							$tr.append($td0).append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7).append($td8).append($td9);
							$tbody.append($tr)
						});

						$("#pageTotals").html(data.pages);
						$("#totalRecords").html(data.total);

						$("#pageSize").empty();
						for (var i=1; i<=5; i++){
							var $option;
							if (i==data.pageSize){
								$option = $("<option selected='selected'>"+i+"</option>")
							}else {
								$option = $("<option>"+i+"</option>")
							}
							$("#pageSize").append($option)
						}
						if (isFirst){
							initPagination(data.total,pageSize);
							isFirst=false;
						}
					}
			)
		}

		function showOrd(pid) {
			window.location = "${pageContext.request.contextPath}/order/queryOrdByPid/"+pid;
		}

		function initPagination(total,pageSize) {
			$("#Pagination").pagination(total,{
				num_edge_entries: 2, //边缘页数
				num_display_entries:4, //主体按钮数
				callback: pageselectCallback,  /*回调函数，当点击按钮的时候，就会调用指定的分页处理函数*/
				items_per_page: pageSize, //每页显示记录数
				prev_text: "前一页",
				next_text: "后一页"
			})
			function pageselectCallback(page_index){
				currPage = page_index + 1;
				//首次加载的时候不要再次执行分页函数，因为一开始的时候就先做了加载数据，第二次开始，当点击分页按钮的时候重新加载分页函数拿到下一页的数据
				if(!isFirst){
					pagination(page_index + 1, pageSize);
				}
				isFirst=false;
				return false;
			}
		}

		function reset () {
			alertify.set({
				labels : {
					ok : "确定",
					cancel : "取消"
				},
				delay : 5000,
				buttonReverse : false,
				buttonFocus : "ok"
			});
		}

		function updateProStatus(status) {
			reset();
			var ids = [];
			$("input[name='ids']:checked").each(function (index) {
				ids[index]=$(this).val();
			})
			if(ids.length==0){
				alertify.alert("请选择要操作的选项！");
				return false;
			}else{
				alertify.confirm("是否确定更新?",
						function(){
							$.ajax({
								url : "${pageContext.request.contextPath}/product/updateProStatus",
								type:"post",
								traditional: true,
								dataType : "json",
								data : {
									"_method":"put",
									"ids" : ids,
									"status": status
								},
								success: function () {
									pagination(currPage,$("#pageSize").val());
								}
							})
						},
						function(){
							alertify.error('取消');
						});
			}
		}

		function delProById(){
			reset();
			var ids = [];
			$("input[name='ids']:checked").each(function (index) {
				ids[index]=$(this).val();
			})
			if(ids.length==0){
				alert().alert("请选择要操作的选项！");
				return false;
			}else{
				alertify.confirm("是否确定删除?",
						function(){
							$.ajax({
								url : "${pageContext.request.contextPath}/product/delProduct",
								type:"post",
								traditional: true,
								dataType : "json",
								data : {
									"_method":"delete",
									"ids" : ids
								},
								success: function () {
									pagination(currPage,$("#pageSize").val());
								}
							})
						},
						function(){
							alertify.error('取消');
						});
			}
		}

		function find(){
			var term = $("#term").val();
			if (term != "" && term != null){
				window.location.href = "${pageContext.request.contextPath}/product/findlike1/" + term;
			}
		}


		$(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(function() {

			// 激活导航位置
			setSidebarActive("admin-datalist");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>

</html>