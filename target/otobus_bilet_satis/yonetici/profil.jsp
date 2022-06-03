<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>

<%
// silme işlemi yapıyor
boolean sil_olay = (request.getParameter("olay") == null);
if(!sil_olay){
	String id = request.getParameter("id");
	int durum = st.executeUpdate("update isletme set durum = 2 where id = '"+id+"'");
	if(durum > 0){
		
		//out.print("Silme İşlemi Başarılı");
		response.sendRedirect("isletme_kontrolu.jsp");
	}
}

boolean foto_yukleme = (request.getParameter("action") == "foto-degis");
if(foto_yukleme){
	out.print(request.getParameter("profil_foto"));
}
%>







<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>BucketAdmin</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!--dynamic table-->
<link href="../dosya/js/advanced-datatable/css/demo_page.css"
	rel="stylesheet" />
<link href="../dosya/js/advanced-datatable/css/demo_table.css"
	rel="stylesheet" />
<link rel="stylesheet" href="../dosya/js/data-tables/DT_bootstrap.css" />

<!-- File Upload Css -->


<link rel="stylesheet" href="../dosya/js/bootstrap-fileupload/bootstrap-fileupload.css" />
<script src="../dosya/js/bootstrap-fileupload/bootstrap-fileupload.js"></script>

<!-- Custom styles for this template -->
<link href="../dosya/css/style.css" rel="stylesheet">
<link href="../dosya/css/style-responsive.css" rel="stylesheet" />

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<section id="container">
		<!--header start-->

		<%@ include file="ust.jsp"%>

		<!--header end-->
		<!--sidebar start-->

		<%@include file="sol_menu.jsp"%>


		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">



				<!--Boş sayfa-->
				<div class="row">


					<div class="col-md-12">


						<!--breadcrumbs start -->
						<ul class="breadcrumb">
							<li><a href="index.jsp"><i class="fa fa-home"></i>
									Anasayfa</a></li>
							<li><a href="index.jsp">Profil</a></li>

						</ul>
						<!--breadcrumbs end -->





						<section class="panel">
							<header class="panel-heading">
								İşletmeler <span class="tools pull-right"> <%


ResultSet rs = st.executeQuery("select * from isletme where id= '"+session.getAttribute("yonetici_id")+"'");
rs.next();
%>

								</span>
							</header>


							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form" action="?action=foto-degis" method="post" enctype="multipart/form-data">




										<div class="form-group ">
											<label class="col-sm-2 control-label" >Resim :</label>
											<div class="col-md-9">
												<div class="fileupload fileupload-new"
													data-provides="fileupload">
													<div class="fileupload-preview fileupload-new thumbnail"
														style="width: 200px; height: 150px; max-width: 200px; max-height: 150px; line-height: 20px;">
														<img
															src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
															alt="" />
													</div>
													<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 10px;"></div>


													<div>
														<span class="btn btn-white btn-file"> <span
															class="fileupload-new"><i class="fa fa-paper-clip"></i>
																Select image</span> <span class="fileupload-exists"><i
																class="fa fa-undo"></i> Change</span>
														<input type="file" class="default" name="profil_foto"/>
														</span> <a href="#" class="btn btn-danger fileupload-exists"
															data-dismiss="fileupload"><i class="fa fa-trash"></i>
															Remove</a>
															<button type="submit" class="btn btn-info">Kaydet</button>
													</div>
												</div>

											</div>
										</div>

									
									
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_unvani">İşletme
												Adı :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_unvani">
													<%out.print(rs.getString("firma_unvani"));%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="kullanici_adi">Kullanıcı
												Adı :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="kullanici_adi">
													<%out.print(rs.getString("kullanici_adi"));%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="sifresi">Şifresi
												:</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="sifresi">****</label>
											</div>
										</div>
								</form>
								</div>
	


							</div>

						</section>
					</div>


				</div>


			</section>
		</section>
		<!--main content end-->
	
	</section>
	<!-- Placed js at the end of the document so the pages load faster -->
	<!--Core js-->



	<!--Core js-->
	<script src="../dosya/js/jquery.js"></script>
	<script src="../dosya/js/jquery-1.8.3.min.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script src="../dosya/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script class="include" type="text/javascript"
		src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>

	<script src="../dosya/js/bootstrap-switch.js"></script>

	<script type="text/javascript"
		src="../dosya/js/fuelux/js/spinner.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="../dosya/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript"
		src="../dosya/js/jquery-multi-select/js/jquery.quicksearch.js"></script>

	<script type="text/javascript"
		src="../dosya/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>

	<script src="../dosya/js/jquery-tags-input/jquery.tagsinput.js"></script>

	<script src="../dosya/js/select2/select2.js"></script>
	<script src="../dosya/js/select-init.js"></script>


	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<script src="../dosya/js/toggle-init.js"></script>

	<script src="../dosya/js/advanced-form.js"></script>
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>



</body>
</html>