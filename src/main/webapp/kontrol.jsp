<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<%
	String bulunan_cerez_ad = "";
	int a = 0;

	Cookie cookie = null;
	Cookie[] cookies = null;
	cookies = request.getCookies();
	if (cookies != null) {

		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			bulunan_cerez_ad = cookie.getName();
			if (bulunan_cerez_ad.equals("kullanici_cerez")) {
				a = 1;
				break;
			}
		}
	} else {
		//yok
	}

	//out.print(bulunan_cerez_ad);

	if (a == 1) {
		// boş
		session.setAttribute("kullanici_id", cookie.getValue());
	} else {

		boolean admin_varmi = (session.getAttribute("kullanici_id") == null);
		if (!admin_varmi) {
			// admin var
		} else {
			// admin yok
			response.sendRedirect("uye_giris.jsp");
		}

	}
%>