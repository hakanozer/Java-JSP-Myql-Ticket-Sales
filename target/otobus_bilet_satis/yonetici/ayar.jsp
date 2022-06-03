<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>



<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost/otobus_bileti", "root", "");
	Statement st = con.createStatement();

	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
%>