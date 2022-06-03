<%@ include file="ayar.jsp"%>
<%@include file="kontrol.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="../dosya/images/favicon.png">
<title>Sefer Sorgula-Terminal Paneli</title>
<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

<link rel="stylesheet" href="../dosya/css/bootstrap-switch.css" />
<!--clock css-->
<link href="../dosya/js/css3clock/css/style.css" rel="stylesheet">
<!--jQuery Vdo and Audio Player-->
<link rel="stylesheet" type="text/css"
	href="../dosya/js/jplayer/skin/blue.monday/jplayer.blue.monday.css" />

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
	<%
		// SELECT sefer.id, sefer.kalkis_yeri, sefer.varis_yeri, isletme_id, saat, gar.gar_adi, otobus_tipi, normal_fiyat, indirimli_fiyat FROM sefer INNER JOIN gar WHERE gar.id = sefer.kalkis_yeri OR gar.id = sefer.varis_yeri AND sefer.id ="+request.getParameter("id")+" 

		ResultSet rs = st
				.executeQuery("SELECT  * FROM sefer INNER JOIN garlar WHERE garlar.id = sefer.kalkis_yeri OR garlar.id = sefer.varis_yeri AND sefer.id ='"
						+ request.getParameter("id") + "'");

		rs.next();
		String kalkis_yeri = rs.getString("gar_adi");
		rs.next();
		String varis_yeri = rs.getString("gar_adi");
		String saat = rs.getString("saat");
		ResultSet rs2 = st2
				.executeQuery("select count(*) as sayi from biletler where sefer_id='"
						+ request.getParameter("id")
						+ "' and sefer_tarihi='"
						+ request.getParameter("tarih") + "'");
		rs2.next();
	%>


	<section class="panel">
		<div class="user-heading alt gray-bg">

			<h1>&nbsp;&nbsp;Sefer Bilgileri</h1>

		</div>

		<ul class="nav nav-pills nav-stacked">
			<li><a href="javascript:;"> <i class="fa fa-envelope-o"></i>
					Hareket Tarihi <span
					class="badge label-success pull-right r-activity"><%=request.getParameter("tarih")%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-tasks"></i>
					Hareket Saati <span
					class="badge label-danger pull-right r-activity"><%=saat%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-bell-o"></i>
					Kalkış <span class="badge label-success pull-right r-activity"><%=kalkis_yeri%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-comments-o"></i>Varış
					<span class="badge label-warning pull-right r-activity"><%=varis_yeri%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-envelope-o"></i>
					Sefer Tipi <span class="badge label-success pull-right r-activity"><%=rs.getString("sefer_tipi")%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-tasks"></i>
					Otobü Tipi <span class="badge label-danger pull-right r-activity"><%=rs.getString("otobus_tipi")%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-tasks"></i>
					Koltuk Sayısı <span
					class="badge label-danger pull-right r-activity"><%=rs.getString("koltuk_sayisi")%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-tasks"></i> Dolu
					Koltuk Sayısı <span
					class="badge label-danger pull-right r-activity"><%=rs2.getString("sayi")%></span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-bell-o"></i>
					Normal Fiyat <span
					class="badge label-success pull-right r-activity"><%=rs.getString("normal_fiyat")%>
						TL</span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-comments-o"></i>İndirimli
					Fiyat <span class="badge label-warning pull-right r-activity"><%=rs.getString("indirimli_fiyat")%>
						TL</span></a></li>
			<li><a href="javascript:;"> <i class="fa fa-comments-o"></i>Ayrıntılı
					Bilgi:<%=rs.getString("bilgi")%> <span
					class="badge label-warning pull-right r-activity"></span></a></li>
		</ul>
		<div class="user-heading alt gray-bg">

			<h1>&nbsp;&nbsp;Durak Bilgileri</h1>

		</div>
		<%
			ResultSet rs_mola = st
					.executeQuery("select * from sefer_mola inner join molayeri where sefer_mola.sefer_id='"
							+ request.getParameter("id")
							+ "' and molayeri.id=sefer_mola.mola_id order by varis_saat asc");
		%>
		<ul class="nav nav-pills nav-stacked">
			<li><a href="javascript:;"> <i class="fa fa-envelope-o"></i><%=kalkis_yeri%>
					<span class="badge label-success pull-right r-activity"><%=saat%></span></a></li>
			<%
				while (rs_mola.next()) {
			%>
			<li><a href="javascript:;"> <i class="fa fa-envelope-o"></i><%=rs_mola.getString("molayeri_adi")%>
					<span class="badge label-success pull-right r-activity"><%=rs_mola.getString("varis_saat")%></span></a></li>
			<%
				}
			%>

			<li><a href="javascript:;"> <i class="fa fa-tasks"></i> <%=varis_yeri%>
					<span class="badge label-danger pull-right r-activity"></span></a></li>
		</ul>
	</section>
</html>