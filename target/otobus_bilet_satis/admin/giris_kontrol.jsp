<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>



<%
	boolean kullanici_adi_k = (request.getParameter("kullanici_adi") == null);
	boolean sifre_k = (request.getParameter("sifre") == null);

	if (!kullanici_adi_k && !sifre_k) {
		// işlemlere başla
		//out.print("Giriş Başarılı");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/otobus_bileti", "root", "");
		Statement st = con.createStatement();

		String kul_adi = request.getParameter("kullanici_adi");
		String kul_sif = request.getParameter("sifre");

		ResultSet rs = st
				.executeQuery("select *from admin where kullanici_adi = '"
						+ kul_adi + "' and sifre = '" + kul_sif + "'");

		if (rs.next()) {
			// oturum kontrolü yapılıyor
			// oturum açılıyor
			session.setAttribute("admin_id", rs.getString("id"));

			// beni hatırla kontol yapısı
			boolean beni_hatirla_k = (request
					.getParameter("beni_hatirla") == null);
			if (!beni_hatirla_k) {
				Cookie cookie = new Cookie("admin_cerez",
						rs.getString("id"));
				cookie.setMaxAge(10000);
				response.addCookie(cookie);
			}

			response.sendRedirect("index.jsp");// sayfayı yönlendir

		} else {

			//out.print("Bu kullanıcıdan yok");
			response.sendRedirect("giris.jsp");

		}

	} else {

		// giriş verileri yok
		//out.print("Giriş Bilgileri Yok");
		response.sendRedirect("index.jsp");
	}
%>



