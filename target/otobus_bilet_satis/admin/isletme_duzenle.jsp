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

		String firma_unvani = request.getParameter("firma_unvani");
		String kullanici_adi = request.getParameter("kullanici_adi");
		String sifresi = request.getParameter("sifresi");
		String yetkili_adi_soyadi = request
				.getParameter("yetkili_adi_soyadi");
		String yetkili_mail = request.getParameter("yetkili_mail");
		String yetkili_telefon = request
				.getParameter("yetkili_telefon");
		String firma_adresi = request.getParameter("firma_adresi");
		String firma_telefon = request.getParameter("firma_telefon");
		String firma_fax = request.getParameter("firma_fax");
		String firma_mail = request.getParameter("firma_mail");
		String firma_web = request.getParameter("firma_web");
		String logo = request.getParameter("logo");
		String banka_bilgileri = request
				.getParameter("banka_bilgileri");
		String vergi_bilgileri = request
				.getParameter("vergi_bilgileri");
		String durum = request.getParameter("durum");
		String id = request.getParameter("id");

		try {

			int degistir = st
					.executeUpdate("update isletme set firma_unvani = '"
							+ firma_unvani
							+ "', sifresi='"
							+ sifresi
							+ "',yetkili_adi_soyadi='"
							+ yetkili_adi_soyadi
							+ "',yetkili_mail='"
							+ yetkili_mail
							+ "',yetkili_telefon='"
							+ yetkili_telefon
							+ "',firma_adresi='"
							+ firma_adresi
							+ "',firma_telefon='"
							+ firma_telefon
							+ "',firma_fax='"
							+ firma_fax
							+ "',firma_mail='"
							+ firma_mail
							+ "',firma_web='"
							+ firma_web
							+ "',logo='"
							+ logo
							+ "',banka_bilgileri='"
							+ banka_bilgileri
							+ "',vergi_bilgileri='"
							+ vergi_bilgileri
							+ "',durum='"
							+ durum
							+ "' where id = '" + id + "'");
			if (degistir > 0) {
				response.sendRedirect("isletme_kontrolu.jsp");
			}

		} catch (SQLException e) {
			out.print(e);
		}

	}
%>






<%
	String firma_unvani = "";
	String kullanici_adi = "";
	String sifresi = "";
	String sifresi_t = "";
	String yetkili_adi_soyadi = "";
	String yetkili_mail = "";
	String yetkili_telefon = "";
	String firma_adresi = "";
	String firma_telefon = "";
	String firma_fax = "";
	String firma_mail = "";
	String firma_web = "";
	String logo = "";
	String banka_bilgileri = "";
	String vergi_bilgileri = "";
	String durum = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {
		// bilgileri getir.

		try {

			ResultSet b_rs = st.executeQuery("select *from isletme where id = '"+ request.getParameter("id") + "'");
			b_rs.next();
			firma_unvani = b_rs.getString("firma_unvani");
			kullanici_adi = b_rs.getString("kullanici_adi");
			sifresi = b_rs.getString("sifresi");
			sifresi_t = b_rs.getString("sifresi");
			yetkili_adi_soyadi = b_rs.getString("yetkili_adi_soyadi");
			yetkili_mail = b_rs.getString("yetkili_mail");
			yetkili_telefon = b_rs.getString("yetkili_telefon");
			firma_adresi = b_rs.getString("firma_adresi");
			firma_telefon = b_rs.getString("firma_telefon");
			firma_fax = b_rs.getString("firma_fax");
			firma_mail = b_rs.getString("firma_mail");
			firma_web = b_rs.getString("firma_web");
			logo = b_rs.getString("logo");
			banka_bilgileri = b_rs.getString("banka_bilgileri");
			vergi_bilgileri = b_rs.getString("vergi_bilgileri");
			durum = b_rs.getString("durum");

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("isletme_kontrolu.jsp");
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

		<%@ include file= "ust.jsp" %>

		<!--header end-->
		<!--sidebar start-->

		<%@include file= "sol_menu.jsp" %>


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
							<li><a href="isletme_kontrolu.jsp">İşletme Kontrolü</a></li>
							<li class="active">İşletme Düzenle</li>
						</ul>
						<!--breadcrumbs end -->






						<section class="panel">
							<header class="panel-heading">
								İşletme Düzenle <span class="tools pull-right"> <a
									href="isletme_arsivi.jsp"><button type="button"
											class="btn btn-success" style="margin-top: -7px;">
											<i class="fa fa-eye"></i> Arşiv
										</button></a>
									<button type="button" class="btn btn-danger"
										style="margin-top: -7px;">
										<i class="fa fa-cloud"></i> Yeni İşletme Ekle
									</button>
								</span>
							</header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form"
										action="?duzenle=duzenle&id=<%out.print(request.getParameter("id"));%>"
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_unvani">İşletme
												Adı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_unvani"
													value="<%out.print(firma_unvani);%>" id="firma_unvani"
													placeholder="İşletme Adı">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="kullanici_adi">Kullanıcı
												Adı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" disabled="disabled"
													name="kullanici_adi" value="<%out.print(kullanici_adi);%>"
													id="kullanici_adi" placeholder="Kullanıcı Adı">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="sifresi">Şifresi
												*</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="sifresi"
													value="<%out.print(sifresi);%>" id="sifresi"
													placeholder="Şifresi">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="sifresi_t">Şifresi
												Tekrar *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="sifresi_t"
													value="<%out.print(sifresi_t);%>" id="sifresi_t"
													placeholder="Şifre Tekrar">
											</div>
										</div>



										<hr style="background-color: red; height: 3px;">


										<div class="form-group">
											<label class="col-sm-2 control-label"
												for="yetkili_adi_soyadi">Yetkili Adı Soyadı</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="yetkili_adi_soyadi"
													value="<%out.print(yetkili_adi_soyadi);%>"
													id="yetkili_adi_soyadi" placeholder="Yetkili Adı Soyadı">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="yetkili_mail">Yetkili
												Mail Adresi</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="yetkili_mail"
													value="<%out.print(yetkili_mail);%>" id="yetkili_mail"
													placeholder="Yetkili Mail Adresi">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="yetkili_telefon">Yetkili
												Telefon</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="yetkili_telefon"
													value="<%out.print(yetkili_telefon);%>"
													id="yetkili_telefon" placeholder="Yetkili Telefon">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_adresi">Firma
												Adresi</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_adresi"
													value="<%out.print(firma_adresi);%>" id="firma_adresi"
													placeholder="Firma Adresi">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_telefon">Firma
												Telefon</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_telefon"
													value="<%out.print(firma_telefon);%>" id="firma_telefon"
													placeholder="Firma Telefon">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_fax">Firma
												Fax</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_fax"
													value="<%out.print(firma_fax);%>" id="firma_fax"
													placeholder="Firma Fax">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_mail">Firma
												Mail</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_mail"
													value="<%out.print(firma_mail);%>" id="firma_mail"
													placeholder="Firma Mail">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="firma_web">Firma
												Web</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="firma_web"
													value="<%out.print(firma_web);%>" id="firma_web"
													placeholder="Firma Web">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="logo">Firma
												Logo</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="logo"
													value="<%out.print(logo);%>" id="logo"
													placeholder="Firma Logo">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="banka_bilgileri">Banka
												Bilgileri</label>
											<div class="col-sm-6">
												<textarea class="form-control" name="banka_bilgileri"
													id="banka_bilgileri" rows="6" placeholder="Banka Bilgileri">
													<%
														out.print(banka_bilgileri);
													%>
												</textarea>
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="vergi_bilgileri">Vergi
												Bilgileri</label>
											<div class="col-sm-6">
												<textarea class="form-control" name="vergi_bilgileri"
													id="vergi_bilgileri" placeholder="Vergi Bilgileri" rows="6">
													<%
														out.print(vergi_bilgileri);
													%>
												</textarea>
											</div>
										</div>




										<div class="form-group">
											<label class="col-sm-2 control-label" for="durum">Firma
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
		<!--right sidebar start-->

		<!--right sidebar end-->
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

				if ($('#firma_unvani').val() == "") {
					alert("Lütfen Firma Ünvanı Giriniz");
					$('#firma_unvani').focus();
					return false;
				} else if ($('#kullanici_adi').val() == "") {
					alert("Lütfen Kullanıcı Adı Giriniz");
					$('#kullanici_adi').focus();
					return false;
				} else if ($('#sifresi').val() == "") {
					alert("Lütfen Şifre Giriniz");
					$('#sifresi').focus();
					return false;
				} else if ($('#sifresi_t').val() == "") {
					alert("Lütfen Şifre Tekrarı Giriniz");
					$('#sifresi_t').focus();
					return false;
				} else if ($('#sifresi_t').val() != $('#sifresi').val()) {
					alert("Şifreler Uyuşmuyor");
					$('#sifresi').focus();
					return false;
				} else {
					return true;
				}

			})

		})
	</script>



</body>
</html>