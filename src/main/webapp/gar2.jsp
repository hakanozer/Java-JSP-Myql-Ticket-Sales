<%@ include file="terminal/ayar.jsp"%>

<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>

<%
	ResultSet rs_gar = st
			.executeQuery("select * from garlar where id='"
					+ request.getParameter("id") + "'");
	rs_gar.next();
	String id = rs_gar.getString("il_id");
	rs_gar = st.executeQuery("select * from garlar where il_id!='" + id
			+ "'");
%>
<select name="varis_yeri" id="varis_yeri"  class="SelectField">
	<option>Seç</option>
	<%
		while (rs_gar.next()) {
	%>
	<option value="<%=rs_gar.getString("id")%>"><%=rs_gar.getString("gar_adi")%></option>
	<%
		}
	%>
</select>