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

		String sehir = request.getParameter("sehir");
		String varilacak_yer = request.getParameter("varilacak_yer");
		String guzargah_no = request.getParameter("guzargah_no");
		String saat = request.getParameter("saat");
		String plaka = request.getParameter("plaka");
		String sofor_adi = request.getParameter("sofor_adi");
		String sofor_tel = request.getParameter("sofor_tel");
		String arac_modeli = request.getParameter("arac_modeli");
		String koltuk_sayisi = request.getParameter("koltuk_sayisi");
		String id = request.getParameter("id");

		try {

			int degistir = st
					.executeUpdate("update servis set sehir = '"
							+ sehir + "',varilacak_yer = '"
							+ varilacak_yer + "',guzargah_no = '"
							+ guzargah_no + "', saat = '" + saat
							+ "',plaka = '" + plaka + "',sofor_adi = '"
							+ sofor_adi + "',sofor_tel = '" + sofor_tel
							+ "',arac_modeli = '" + arac_modeli
							+ "',koltuk_sayisi = '" + koltuk_sayisi
							+ "' where id = '" + id + "'");
			if (degistir > 0) {
				response.sendRedirect("servis.jsp");
			}

		} catch (SQLException e) {
			out.print(e);
		}

	}
%>

<%
	String sehir = "";
	String varilacak_yer = "";
	String guzargah_no = "";
	String saat = "";
	String plaka = "";
	String sofor_adi = "";
	String sofor_tel = "";
	String arac_modeli = "";
	String koltuk_sayisi = "";

	boolean id_varmi = (request.getParameter("id") == null);
	if (!id_varmi) {
		// bilgileri getir.

		try {

			ResultSet b_rs = st
					.executeQuery("select *from servis where id = '"
							+ request.getParameter("id") + "'");
			b_rs.next();
			sehir = b_rs.getString("sehir");
			varilacak_yer = b_rs.getString("varilacak_yer");
			guzargah_no = b_rs.getString("guzargah_no");
			saat = b_rs.getString("saat");
			plaka = b_rs.getString("plaka");
			sofor_adi = b_rs.getString("sofor_adi");
			sofor_tel = b_rs.getString("sofor_tel");
			arac_modeli = b_rs.getString("arac_modeli");
			koltuk_sayisi = b_rs.getString("koltuk_sayisi");

		} catch (SQLException e) {
			out.print(e);
		}

	} else {
		response.sendRedirect("servis.jsp");
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>Servis Düzenleme</title>
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

<link rel="stylesheet"
	href="../dosya/js/timepicker/include/ui-1.10.0/ui-lightness/jquery-ui-1.10.0.custom.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="../dosya/js/timepicker/jquery.ui.timepicker.css?v=0.3.3"
	type="text/css" />

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
	<section id="container"> <!--header start--> <%@ include
		file="ust.jsp"%> <!--header end--> <!--sidebar start-->

	<%@include file="sol_menu.jsp"%> <!--sidebar end-->
	<!--main content start--> <section id="main-content"> <section
		class="wrapper"> <!--Boş sayfa-->
	<div class="row">


		<div class="col-md-12">


			<!--breadcrumbs start -->
			<ul class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-home"></i> Anasayfa</a></li>
				<li><a href="servis.jsp">İşletme Kontrolü</a></li>
				<li class="active">Servis Düzenle</li>
			</ul>
			<!--breadcrumbs end -->

			<section class="panel"> <header class="panel-heading">Servis
			Düzenle <span class="tools pull-right">

				<button type="button" class="btn btn-danger"
					style="margin-top: -7px;">
					<i class="fa fa-cloud"></i> Yeni Servis Ekleme
				</button>
			</span> </header>

			<div class="panel-body">
				<div class="position-left">

					<form class="form-horizontal bucket-form"
						action="?duzenle=duzenle&id=<%out.print(request.getParameter("id"));%>"
						method="post">


						<div class="form-group">
							<label class="col-sm-2 control-label" for="sehir">Şehir
								Adı *</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="sehir"
									value="<%out.print(sehir);%>" id="sehir" placeholder="Şehir">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" for="guzargah_no">Güzergah
								No *</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="guzargah_no"
									value="<%out.print(guzargah_no);%>" id="guzargah_no"
									placeholder="Güzergah No">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" for="varilacak_yer">Servis
								Noktaları *</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="varilacak_yer"
									value="<%out.print(varilacak_yer);%>" id="varilacak_yer"
									placeholder="Servis Noktaları">
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label" for="saat">Saat</label>
							<div class="col-sm-6">
								<input type="time" class="form-control" name="saat"
									value="<%out.print(saat);%>" id="saat" placeholder="Saat">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" for="plaka">Plaka</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="plaka"
									value="<%out.print(plaka);%>" id="plaka" placeholder="Plaka">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" for="sofor_adi">Şofor
								Adı</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="sofor_adi"
									value="<%out.print(sofor_adi);%>" id="sofor_adi"
									placeholder="Şofor Adı">
							</div>
						</div>



						<div class="form-group">
							<label class="col-sm-2 control-label" for="sofor_tel">Sofor
								Telefonu</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="sofor_tel"
									value="<%out.print(sofor_tel);%>" id="sofor_tel"
									placeholder="Şofor Telefonu">
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" for="arac_modeli">Araç
								Modeli</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="arac_modeli"
									value="<%out.print(arac_modeli);%>" id="arac_modeli"
									placeholder="Araç Modeli">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="koltuk_sayisi">Koltuk
								Sayısı</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="koltuk_sayisi"
									value="<%out.print(koltuk_sayisi);%>" id="koltuk_sayisi"
									placeholder="Koltuk Sayısı">
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
	</section> </section> <!--main content end--></section>

	<script>
		$(document).ready(function(e) {
			// jquery gövdemiz hazır

			$('button[type="submit"]').click(function() {

				if ($('#sehir').val() == "") {
					alert("Lütfen Şehir Adı Giriniz");
					$('#sehir').focus();
					return false;
				} else if ($('#guzargah_no').val() == "") {
					alert("Lütfen Güzergah No Giriniz");
					$('#guzargah_no').focus();
					return false;
				} else if ($('#varilacak_yer').val() == "") {
					alert("Lütfen Servis Noktalarını Giriniz");
					$('#varilacak_yer').focus();
					return true;

				}
			})

		})
	</script>


	<script type="text/javascript"
		src="../dosya/js/timepicker/include/jquery-1.9.0.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.core.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.widget.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.tabs.min.js"></script>
	<script type="text/javascript"
		src="../dosya/js/timepicker/include/ui-1.10.0/jquery.ui.position.min.js"></script>

	<script type="text/javascript"
		src="../dosya/js/timepicker/jquery.ui.timepicker.js?v=0.3.3"></script>

	<script type="text/javascript"
		src="../dosya/https://apis.google.com/js/plusone.js"></script>



	<script type="text/javascript">
		$(document).ready(function() {

			$('#saat').timepicker({
				showNowButton : true,
				showDeselectButton : true,
				defaultTime : '', // removes the highlighted time for when the input is empty.
				showCloseButton : true
			});
		})
	</script>

</body>
</html>