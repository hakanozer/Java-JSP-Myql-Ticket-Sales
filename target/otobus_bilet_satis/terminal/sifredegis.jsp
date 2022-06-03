<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>


<%
	//türkçe karakter sorunu giderek için aşağıdaki komutlar kullanılır.
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	boolean duzenle_varmi = (request.getParameter("duzenle") == null);
	if (!duzenle_varmi) {
		// düzenle işlemine başla

		String esifre = request.getParameter("sifresi");
		String id = request.getParameter("id");
		String kullanici_adi = request.getParameter("kullanici_adi");
		String ysifre = request.getParameter("ysifre");

		try {

			String personel_id = String.valueOf(session.getAttribute("personel_id"));
			ResultSet sifre_r = st4.executeQuery("select *from personel where id = '"+ personel_id + "' and  sifresi = '" + esifre + "'");
			if (sifre_r.next()) {
				// şifre doğru işlemleri gerçekleştir

				int degistir = st4.executeUpdate("update personel set sifresi = '"+ ysifre + "' where id = '" + personel_id+ "'");
				if (degistir > 0) {
					response.sendRedirect("cikis.jsp");
				}

			} else {

				out.print("<script>alert(\"Eski Şifre Hatalı\")</script>");
			}

		} catch (SQLException e) {
			out.print(e);
		}

	}
%>






<%
	String kullanici_adi = "";
	String sifre = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {
		// bilgileri getir.

		try {

			ResultSet rss = st4.executeQuery("select *from personel where id = '"+ request.getParameter("id") + "'");
			rss.next();
			kullanici_adi = rss.getString("kullanici_adi");
			sifre = rss.getString("sifresi");

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon"  href="../dosya/images/favicon.png">
<title>BucketAdmin</title>
<!--Core CSS -->
<link  href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link  href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link  href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!--icheck-->
<link  href="../dosya/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/minimal/red.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/minimal/green.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/minimal/yellow.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/minimal/purple.css" rel="stylesheet">

<link  href="../dosya/js/iCheck/skins/square/square.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/square/red.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/square/green.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/square/blue.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/square/yellow.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/square/purple.css" rel="stylesheet">

<link  href="../dosya/js/iCheck/skins/flat/grey.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/flat/red.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/flat/green.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/flat/blue.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
<link  href="../dosya/js/iCheck/skins/flat/purple.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link  href="../dosya/css/style.css" rel="stylesheet">
<link  href="../dosya/css/style-responsive.css" rel="stylesheet" />

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
							<li class="active">Admin Ayarlar</li>
						</ul>
						<!--breadcrumbs end -->






						<section class="panel">
							<header class="panel-heading">Admin Ayarlar </header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form"
										action="?duzenle=duzenle&id=<%out.print(request.getParameter("id"));%>"
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="kullanici_adi">Kullanıcı
												Adı </label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="kullanici_adi"
													value="<%out.print(kullanici_adi);%>" id="kullanici_adi"
													placeholder="Kullanıcı Adı" disabled>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="sifre">Eski
												Şifre </label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="sifre"
													id="sifre" placeholder="Eski Şifre">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="ysifre">Yeni
												Şifre </label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="ysifre"
													id="ysifre" placeholder="Yeni Şifre">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="ysifre_t">Yeni
												Şifre Tekrar </label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="ysifre_t"
													id="ysifre_t" placeholder="Yeni Şifre Tekrar">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label"></label>
											<div class="col-sm-6">
												<button type="submit" value="gonder" class="btn btn-success">Değiştir</button>
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

				if ($('#sifre').val() == "") {
					alert("Lütfen Eski Şifre Giriniz");
					$('#sifre').focus();
					return false;
				} else if ($('#ysifre').val() == "") {
					alert("Lütfen Yeni Şifre Giriniz");
					$('#ysifre').focus();
					return false;
				} else if ($('#ysifre_t').val() == "") {
					alert("Lütfen Yeni Şifre Tekrarı Giriniz");
					$('#ysifre_t').focus();
					return false;
				} else if ($('#ysifre_t').val() != $('#ysifre').val()) {
					alert("Şifreler Uyuşmuyor");
					$('#ysifre').focus();
					return false;
				} else {
					return true;
				}

			})

		})
	</script>



</body>
</html>