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

			if (bulunan_cerez_ad.equals("personel_cerez")) {
				a = 1;
				break;
			}

		}
	} else {

	}

	if (a == 1) {
		session.setAttribute("personel_id", cookie.getValue());
	} else {

		boolean terminal_varmi = (session.getAttribute("personel_id") == null);

		if (!terminal_varmi) {

		} else {
			// admin yok
			response.sendRedirect("giris.jsp");
		}
	}
%>