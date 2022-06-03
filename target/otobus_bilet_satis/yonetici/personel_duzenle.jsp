<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
<%@ include file="ayar.jsp"%>

<%
	//türkçe karakter sorunu gidermek için aşağıdaki komutlar kullanılır.
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	boolean duzenle_varmi = (request.getParameter("duzenle") == null);
	if (!duzenle_varmi) {
		//düzenle işlemine başla
		String personel_adiSoyadi = request
				.getParameter("personel_adiSoyadi");
		String kullanici_adi = request.getParameter("kullanici_adi");
		String sifresi = request.getParameter("sifresi");
		String terminal_id = request.getParameter("terminal_id");
		String adresi = request.getParameter("adresi");
		String telefon = request.getParameter("telefon");
		String mail = request.getParameter("mail");
		String durum = request.getParameter("durum");

		String id = request.getParameter("id");

		try {
			int degistir = st
					.executeUpdate("update personel set personel_adiSoyadi='"
							+ personel_adiSoyadi
							+ "', kullanici_adi='"
							+ kullanici_adi
							+ "',sifresi='"
							+ sifresi
							+ "',terminal_id='"
							+ terminal_id
							+ "',adresi='"
							+ adresi
							+ "',telefon='"
							+ telefon
							+ "',mail= '"
							+ mail
							+ "',durum = '"
							+ durum
							+ "' where id ='"
							+ id + "'");
			if (degistir > 0) {
				response.sendRedirect("personel_kontrol.jsp");

			}
		} catch (SQLException e) {
			out.print(e);
		}

	}
%>

<%
	String personel_adiSoyadi = "";
	String kullanici_adi = "";
	String sifresi = "";
	String sifresi_t = "";

	String adresi = "";
	String telefon = "";
	String mail = "";
	String durum = "";
	String terminal_id = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {
		// bilgileri getir.

		try {

			ResultSet b_rs = st
					.executeQuery("select *from personel where id = '"
							+ request.getParameter("id") + "'");
			b_rs.next();
			personel_adiSoyadi = b_rs.getString("personel_adiSoyadi");
			kullanici_adi = b_rs.getString("kullanici_adi");
			sifresi = b_rs.getString("sifresi");
			terminal_id = b_rs.getString("terminal_id");
			adresi = b_rs.getString("adresi");
			telefon = b_rs.getString("telefon");
			mail = b_rs.getString("mail");
			durum = b_rs.getString("durum");

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("personel_kontrol.jsp");
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
							<li><a href="personel_kontrol.jsp">Personel Kontrolü</a></li>
							<li class="active">Personel Düzenle</li>
						</ul>
						<!--breadcrumbs end -->






						<section class="panel">
							<header class="panel-heading">
								Personel Düzenle <span class="tools pull-right"> <a
									href="personel_arsiv.jsp"><button type="button"
											class="btn btn-success" style="margin-top: -7px;">
											<i class="fa fa-eye"></i> Arşiv
										</button></a>
									<button type="button" class="btn btn-danger"
										style="margin-top: -7px;">
										<i class="fa fa-cloud"></i> Yeni Personel Ekle
									</button>
								</span>
							</header>

							<div class="panel-body">
								<div class="position-left">

									<form class="form-horizontal bucket-form"
										action="?duzenle=duzenle&id=<%out.print(request.getParameter("id"));%>"
										method="post">


										<div class="form-group">
											<label class="col-sm-2 control-label"
												for="personel_adiSoyadi">Personel Adı Soyadı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"
													name="personel_adiSoyadi"
													value="<%out.print(personel_adiSoyadi);%>"
													id="personel_adiSoyadi" placeholder="Personel Adı Soyadı">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="kullanici_adi">Kullanıcı
												Adı *</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="kullanici_adi"
													value="<%out.print(kullanici_adi);%>" id="kullanici_adi"
													placeholder="Kullanıcı Adı">
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

										<div class="form-group">
											<label class="col-sm-2 control-label" for="terminal_id">Terminal
												Seçimi *</label>
											<div class="col-sm-6">
												<select class="form-control m-bot15" name="terminal_id"
													id="terminal_id">

													<%
														ResultSet rs_t = st
																.executeQuery("select *from terminal where  durum = 0");
														while (rs_t.next()) {

															if (rs_t.getString("id").equals(terminal_id)) {
													%>

													<option selected="selected"
														value="<%out.print(rs_t.getString("id"));%>">
														<%
															out.print(rs_t.getString("terminal_adi"));
														%>
													</option>

													<%
														} else {
													%>

													<option value="<%out.print(rs_t.getString("id"));%>">
														<%
															out.print(rs_t.getString("terminal_adi"));
														%>
													</option>


													<%
														}
													%>



													<%
														}
													%>
												</select>
											</div>
										</div>




										<hr style="background-color: grey; height: 1px;">


										<div class="form-group">
											<label class="col-sm-2 control-label" for="adresi">Personel
												Adres</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="adresi"
													value="<%out.print(adresi);%>" id="adresi"
													placeholder="Personel Adres">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="telefon">Personel
												Telefon</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="telefon"
													value="<%out.print(telefon);%>" id="telefon"
													placeholder="Personel Telefon">
											</div>
										</div>


										<div class="form-group">
											<label class="col-sm-2 control-label" for="mail">Personel
												Mail</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="mail"
													value="<%out.print(mail);%>" id="mail"
													placeholder="Personel Mail">
											</div>
										</div>



										<div class="form-group">
											<label class="col-sm-2 control-label" for="durum">Personel
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

				if ($('#personel_adiSoyadi').val() == "") {
					alert("Lütfen Personel Adı ve Soyadı Giriniz");
					$('#personel_adiSoyadi').focus();
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