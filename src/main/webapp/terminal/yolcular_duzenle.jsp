<%@include file="kontrol.jsp"%>
<%@include file="ayar.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.util.*" import="java.text.*"
	import="java.*" errorPage=""%>



<%
	//türkçe karakter sorunu giderek için aşağıdaki komutlar kullanılır.
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	boolean duzenle_varmi = (request.getParameter("duzenle") == null);
	if (!duzenle_varmi) {
		// düzenle işlemine başla

		String yolcu_tc = request.getParameter("yolcu_tc");
		String adi = request.getParameter("adi");
		String soyadi = request.getParameter("soyadi");
		String adres = request.getParameter("adres");
		String tel = request.getParameter("tel");
		String mail = request.getParameter("mail");
		String durum = request.getParameter("durum");
		String id = request.getParameter("id");

		try {

			int degistir = st
					.executeUpdate("update yolcular set yolcu_tc = '"
							+ yolcu_tc + "',adi='" + adi + "',soyadi='"
							+ soyadi + "',adres='" + adres + "',tel='"
							+ tel + "',mail='" + mail + "',durum='"
							+ durum + "' where id = '" + id + "'");
			if (degistir > 0) {
				response.sendRedirect("yolcular.jsp");
			}

		} catch (SQLException e) {
			out.print(e);
		}

	}
%>

<%
	String yolcu_tc = "";
	String adi = "";
	String soyadi = "";
	String adres = "";
	String tel = "";
	String mail = "";
	String durum = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {
		// bilgileri getir.

		try {

			ResultSet b_rs = st
					.executeQuery("select *from yolcular where id = '"
							+ request.getParameter("id") + "'");
			b_rs.next();
			yolcu_tc = b_rs.getString("yolcu_tc");
			adi = b_rs.getString("adi");
			soyadi = b_rs.getString("soyadi");
			adres = b_rs.getString("adres");
			tel = b_rs.getString("tel");
			mail = b_rs.getString("mail");
			durum = b_rs.getString("durum");

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("yolcular.jsp");
	}
%>

<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>Personel Paneli</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/js/jquery-ui/jquery-ui-1.10.1.custom.min.css"
	rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="../dosya/js/jvector-map/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<link href="../dosya/css/clndr.css" rel="stylesheet">
<!--clock css-->
<link href="../dosya/js/css3clock/css/style.css" rel="stylesheet">
<!--Morris Chart CSS -->
<link rel="stylesheet" href="../dosya/js/morris-chart/morris.css">
<!-- Custom styles for this template -->
<link href="../dosya/css/style.css" rel="stylesheet">
<link href="../dosya/css/style-responsive.css" rel="stylesheet" />

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
							<li><a href="yolcular.jsp">Yolcular</a></li>
							<li class="active">Kişi Düzenle</li>
						</ul>
						<!--breadcrumbs end -->

						<section class="panel">
							<header class="panel-heading">
								KİŞİ DÜZENLE <span class="tools pull-right"> <a
									href="yolcular_arşivi.jsp"><button type="button"
											class="btn btn-success" style="margin-top: -7px;">
											<i class="fa fa-eye"></i> Arşiv
										</button></a> <a href="yolcular_yeni_kayit.jsp"><button type="button"
											class="btn btn-danger" style="margin-top: -7px;">
											<i class="fa fa-cloud"></i> Yeni Kişi Ekle
										</button></a>
								</span>
							</header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form"
										action="?duzenle=duzenle&id=<%out.print(request.getParameter("id"));%>"
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="yolcu_tc">Yolcu
												TC *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="yolcu_tc"
													value="<%out.print(yolcu_tc);%>" id="yolcu_tc"
													placeholder="TC">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="adi">Adı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="adi"
													value="<%out.print(adi);%>" id="adi" placeholder="Adı">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="soyadi">Soyadı
												*</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="soyadi"
													value="<%out.print(soyadi);%>" id="soyadi"
													placeholder="Soyadi">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label" for="tel">Telefon
												*</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="tel"
													value="<%out.print(tel);%>" id="tel"
													placeholder="Telefon">
											</div>
										</div>

										<hr style="background-color: red; height: 3px;">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="adres">Adres</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="adres"
													value="<%out.print(adres);%>" id="adres"
													placeholder="Adres">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="mail">Mail
												Adresi</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="mail"
													value="<%out.print(mail);%>" id="mail" placeholder="Mail">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="durum">Terminal
												Durum</label>
											<div class="col-sm-6">
												<select class="form-control m-bot15" name="durum" id="durum">

													<%
														if (durum.equals("0")) {
													%>
													<option selected="selected" value="0">Aktif</option>
													<%
														} else {
													%>
													<option value="0">Aktif</option>
													<%
														}
													%>


													<%
														if (durum.equals("1")) {
													%>
													<option selected="selected" value="1">Pasif</option>
													<%
														} else {
													%>
													<option value="1">Pasif</option>
													<%
														}
													%>


													<%
														if (durum.equals("2")) {
													%>
													<option selected="selected" value="2">Silinmiş</option>
													<%
														} else {
													%>
													<option value="2">Silinmiş</option>
													<%
														}
													%>

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
	<script src="../dosya/js/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>
	<script src="../dosya/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="../dosya/js/jquery.scrollTo.min.js"></script>
	<script src="../dosya/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
	<script src="../dosya/js/jquery.nicescroll.js"></script>
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
	<script src="../dosya/js/skycons/skycons.js"></script>
	<script src="../dosya/js/jquery.scrollTo/jquery.scrollTo.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="../dosya/js/calendar/clndr.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
	<script src="../dosya/js/calendar/moment-2.2.1.js"></script>
	<script src="../dosya/js/evnt.calendar.init.js"></script>
	<script src="../dosya/js/jvector-map/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../dosya/js/jvector-map/jquery-jvectormap-us-lcc-en.js"></script>
	<script src="../dosya/js/gauge/gauge.js"></script>
	<!--clock init-->
	<script src="../dosya/js/css3clock/js/css3clock.js"></script>
	<!--Easy Pie Chart-->
	<script src="../dosya/js/easypiechart/jquery.easypiechart.js"></script>
	<!--Sparkline Chart-->
	<script src="../dosya/js/sparkline/jquery.sparkline.js"></script>
	<!--Morris Chart-->
	<script src="../dosya/js/morris-chart/morris.js"></script>
	<script src="../dosya/js/morris-chart/raphael-min.js"></script>
	<!--jQuery Flot Chart-->
	<script src="../dosya/js/flot-chart/jquery.flot.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.pie.resize.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.animator.min.js"></script>
	<script src="../dosya/js/flot-chart/jquery.flot.growraf.js"></script>
	<script src="../dosya/js/dashboard.js"></script>
	<script src="../dosya/js/jquery.customSelect.min.js"></script>
	<!--common script init for all pages-->
	<script src="../dosya/js/scripts.js"></script>
	<!--script for this page-->



	<script>
		$(document).ready(function(e) {
			// jquery gövdemiz hazır

			$('button[type="submit"]').click(function() {

				if ($('#yolcu_tc').val() == "") {
					alert("Lütfen Tc'nizi Giriniz");
					$('#yolcu_tc').focus();
					return false;
				} else if ($('#adi').val() == "") {
					alert("Lütfen Adınızı Giriniz");
					$('#adi').focus();
					return false;
				} else if ($('#soyadi').val() == "") {
					alert("Lütfen Soyadınızı Giriniz");
					$('#soyadi').focus();
					return false;
				} else if ($('#tel').val() == "") {
					alert("Lütfen Telefonunuzu Giriniz");
					$('#tel').focus();
					return false;
				} else {
					return true;
				}

			});

		});
	</script>



</body>
</html>