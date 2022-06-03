<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>



<%
	boolean kullanici_tc_k = (request.getParameter("tcno") == null);
	boolean sifre_k = (request.getParameter("Password") == null);

	if (!kullanici_tc_k && !sifre_k) {
		// işlemlere başla
		//out.print("Giriş Başarılı");

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/otobus_bileti", "root", "");
		Statement st = con.createStatement();

		String kul_tc = request.getParameter("tcno");
		String kul_sif = request.getParameter("Password");

		ResultSet rs1 = st.executeQuery("select * from yolcular where yolcu_tc = '"+ kul_tc + "' and sifre = '" + kul_sif + "'");

		if (rs1.next()) {
			// oturum kontrolü yapılıyor
			// oturum açılıyor
			session.setAttribute("kullanici_id", rs1.getString("id"));
			session.setAttribute("kullanici_adi", rs1.getString("adi") + " " + rs1.getString("soyadi"));
			

			// beni hatırla kontol yapısı
			boolean beni_hatirla_k = (request.getParameter("beni_hatirla") == null);
			if (!beni_hatirla_k) {
				Cookie cookie = new Cookie("kullanici_cerez",rs1.getString("id"));
				cookie.setMaxAge(10000);
				response.addCookie(cookie);
			}

			response.sendRedirect("index.jsp");// sayfayı yönlendir

		} else {

			//out.print("Bu kullanıcıdan yok");
			response.sendRedirect("uye_giris.jsp");

		}

	} else {

		// giriş verileri yok
		//out.print("Giriş Bilgileri Yok");
		response.sendRedirect("index.jsp");
	}
%>



