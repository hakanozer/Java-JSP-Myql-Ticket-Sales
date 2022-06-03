<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<%
	Cookie cookie = new Cookie("yonetici_cerez", "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);

	session.removeAttribute("yonetici_id");

	response.sendRedirect("giris.jsp");
%>