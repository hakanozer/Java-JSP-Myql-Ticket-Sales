<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>

<%
	//türkçe karakter sorunu gidermek için aşağıdaki komutlar kullanılır.
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	boolean yaz_durum = (request.getParameter("terminal_adi") == null);
	if (!yaz_durum) {

		try {

			String isletme_id = request.getParameter("isletme_id");
			String terminal_adi = request.getParameter("terminal_adi");
			String terminal_adresi = request
					.getParameter("terminal_adresi");
			String terminal_telefon = request
					.getParameter("terminal_telefon");
			String terminal_fax = request.getParameter("terminal_fax");
			String durum = request.getParameter("durum");

			int yaz = st
					.executeUpdate("INSERT INTO  proje.terminal (id ,isletme_id ,terminal_adi , terminal_adresi ,terminal_telefon , terminal_fax ,durum , kayit_tarihi	)VALUES (NULL ,  '"
							+ session.getAttribute("yonetici_id")
							+ "',  '"
							+ terminal_adi
							+ "',  '"
							+ terminal_adresi
							+ "',  '"
							+ terminal_telefon
							+ "',  '"
							+ terminal_fax
							+ "',  '" + durum + "',  now())");
			if (yaz > 0) {
				response.sendRedirect("terminal_kontrol.jsp");
			}

		} catch (Exception e) {
			out.print("Hata : " + e);
		}

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

<!--icheck-->
<link href="../dosya/js/iCheck/skins/minimal/minimal.css"
	rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/yellow.css"
	rel="stylesheet">
<link href="../dosya/js/iCheck/skins/minimal/purple.css"
	rel="stylesheet">

<link href="../dosya/js/iCheck/skins/square/square.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/yellow.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/square/purple.css" rel="stylesheet">

<link href="../dosya/js/iCheck/skins/flat/grey.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/red.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/blue.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
<link href="../dosya/js/iCheck/skins/flat/purple.css" rel="stylesheet">

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
							<li><a href="terminal_kontrol.jsp">Terminal Kontrolü</a></li>
							<li class="active">Yeni Terminal Gir</li>
						</ul>
						<!--breadcrumbs end -->






						<section class="panel">
							<header class="panel-heading">Yeni Terminal Ekle </header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form" action=""
										method="post">

										<div class="form-group">
											<label class="col-sm-2 control-label" for="terminal_adi">Terminal
												Adı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="terminal_adi"
													id="terminal_adi" placeholder="Terminal Adı">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="terminal_adresi">Terminal
												Adresi *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="terminal_adresi" id="terminal_adresi"
													placeholder="Terminal Adresi">
											</div>
										</div>





										<hr style="background-color: red; height: 3px;">



										<div class="form-group">
											<label class="col-sm-2 control-label" for="terminal_telefon">Terminal
												Telefon</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="terminal_telefon" id="terminal_telefon"
													placeholder="Terminal Telefon">
											</div>
										</div>







										<div class="form-group">
											<label class="col-sm-2 control-label" for="terminal_fax">Terminal
												Fax</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="terminal_fax"
													id="terminal_fax" placeholder="Terminal Fax">
											</div>
										</div>




										<div class="form-group">
											<label class="col-sm-2 control-label" for="durum">Firma
												Durum</label>
											<div class="col-sm-6">
												<select class="form-control m-bot15" name="durum" id="durum">
													<option selected="selected" value="0">Aktif</option>
													<option value="1">Pasif</option>

												</select>
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label"></label>
											<div class="col-sm-6">
												<button type="reset" class="btn btn-danger">Temizle</button>
												<button type="submit" value="gonder" class="btn btn-success">Gönder</button>
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

	<script src="../dosya/js/iCheck/jquery.icheck.js"></script>

	<script type="text/javascript" src="../dosya/js/ckeditor/ckeditor.js"></script>

	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>

	<!--icheck init -->
	<script src="../dosya/js/icheck-init.js"></script>


	<script>
		$(document).ready(function(e) {
			// jquery gövdemiz hazır

			$('button[type="submit"]').click(function() {

				if ($('#terminal_adi').val() == "") {
					alert("Lütfen Terminal Adını Giriniz");
					$('#firma_unvani').focus();
					return false;
				} else if ($('#terminal_adresi').val() == "") {
					alert("Lütfen Terminal Adresini Giriniz");
					$('#kullanici_adi').focus();
					return false;
				} else {
					return true;
				}

			})

		})
	</script>



</body>
</html>