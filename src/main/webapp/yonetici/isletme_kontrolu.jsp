<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>


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
							<li><a href="index.jsp">Kontroller</a></li>
							<li class="active">İşletme Kontrolü</li>
						</ul>
						<!--breadcrumbs end -->





						<section class="panel">
							<header class="panel-heading">
								İşletmeler <span class="tools pull-right"> <%
 	ResultSet rs = st.executeQuery("select * from isletme where id= '"
 			+ session.getAttribute("yonetici_id") + "'");
 	rs.next();
 %> <a href="isletme_duzenle.jsp?id=<%out.print(rs.getString("id"));%>"><button
											type="button" class="btn btn-danger"
											style="margin-top: -7px;">İşletme Bilgilerini
											Düzenle</button></a>

								</span>
							</header>


							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form" action=""
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_unvani">İşletme
												Adı :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_unvani">
													<%
														out.print(rs.getString("firma_unvani"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="kullanici_adi">Kullanıcı
												Adı :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="kullanici_adi">
													<%
														out.print(rs.getString("kullanici_adi"));
													%>
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
										<div class="form-group">
											<label class="col-sm-2 control-label"
												for="yetkili_adi_soyadi">Yetkili Adı Soyadı :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label"
													for="yetkili_adi_soyadi">
													<%
														out.print(rs.getString("yetkili_adi_soyadi"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="yetkili_mail">Yetkili
												Mail Adresi :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="yetkili_mail">
													<%
														out.print(rs.getString("yetkili_mail"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="yetkili_telefon">Yetkili
												Telefon :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="yetkili_telefon">
													<%
														out.print(rs.getString("yetkili_telefon"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_adresi">Firma
												Adresi :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_adresi">
													<%
														out.print(rs.getString("firma_adresi"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_telefon">Firma
												Telefon :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_telefon">
													<%
														out.print(rs.getString("firma_telefon"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_fax">Firma
												Fax :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_fax">
													<%
														out.print(rs.getString("firma_fax"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_mail">Firma
												Mail :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_mail">
													<%
														out.print(rs.getString("firma_mail"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_web">Firma
												Web :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="firma_web">
													<%
														out.print(rs.getString("firma_web"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="logo">Firma
												Logo :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="logo">
													<%
														out.print(rs.getString("logo"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="banka_bilgileri">Banka
												Bilgileri :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="banka_bilgileri">
													<%
														out.print(rs.getString("banka_bilgileri"));
													%>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="vergi_bilgileri">Vergi
												Bilgileri :</label>
											<div class="col-sm-6">
												<label class="col-sm-2 control-label" for="vergi_bilgileri">
													<%
														out.print(rs.getString("vergi_bilgileri"));
													%>
												</label>
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
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>

	<!--dynamic table-->
	<script type="text/javascript" language="javascript"
		src="../dosya/js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="../dosya/js/data-tables/DT_bootstrap.js"></script>
	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<!--dynamic table initialization -->
	<script src="../dosya/js/dynamic_table_init.js"></script>



</body>
</html>