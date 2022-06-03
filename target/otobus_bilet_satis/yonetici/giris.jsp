<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<%
	boolean admin_varmi = (session.getAttribute("yonetici_id") == null);
	if (!admin_varmi) {
		response.sendRedirect("index.jsp");
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

<title>Yönetici Girişi</title>

<!--Core CSS -->
<link href="../dosya/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../dosya/css/bootstrap-reset.css" rel="stylesheet">
<link href="../dosya/font-awesome/css/font-awesome.css" rel="stylesheet" />

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

<body class="login-body">

	<div class="container">

		<form class="form-signin" action="giris_kontrol.jsp" method="post">
			<h2 class="form-signin-heading">Yönetici Girişi</h2>
			<div class="login-wrap">
				<div class="user-login-info">
					<input type="text" name="kullanici_adi" class="form-control" placeholder="Kullanıcı Adı" autofocus> 
						<input type="password" name="sifresi" class="form-control" placeholder="Şifre">

				</div>
				<label class="checkbox"> 
				<input type="checkbox" name="beni_hatirla" value="beni_hatirla">Beni Hatırla</label>
				<button class="btn btn-lg btn-login btn-block" type="submit">Giriş Yap</button>


			</div>

		</form>

	</div>



	<!-- Placed js at the end of the document so the pages load faster -->

	<!--Core js-->
	<script src="../dosya/js/jquery.js"></script>
	<script src="../dosya/bs3/js/bootstrap.min.js"></script>

</body>
</html>
