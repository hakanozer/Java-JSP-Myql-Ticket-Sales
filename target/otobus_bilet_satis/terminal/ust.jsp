<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
	<%
	
	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	
	%>
	
	
	
<header class="header fixed-top clearfix">
	<!--logo start-->
	<div class="brand">

		<a href="index.jsp" class="logo"> <img
			src="../dosya/images/ottologo.png" alt="">
		</a>

	</div>
	<!--logo end-->

	<div class="nav notify-row" id="top_menu">
		<!--  notification start -->
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/otobus_bileti", "root", "");
			Statement st1 = conn.createStatement();

			boolean durum_var = (session.getAttribute("personel_id") == null);
			String yaz = "";
			String pad = "";
			ResultSet rsas;
			if (!durum_var) {

				rsas = st1.executeQuery("select * from personel where id='"
						+session.getAttribute("personel_id") + "'");
				rsas.next();
				yaz = rsas.getString("id");
				pad=rsas.getString("personel_adiSoyadi");
			}
		%>
		<!--  notification end -->
	</div>
	<div class="top-nav clearfix">
		<!--search & user info start-->
		<ul class="nav pull-right top-menu">
			
			<!-- user login dropdown start-->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <img alt=""
					src="../dosya/images/mini.png"> <span
					class="username"> <%=pad
 	
 %>
				</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<li><a href="profil.jsp"><i class=" fa fa-suitcase"></i>Profile</a></li>

					<li><a href="sifredegis.jsp?id=<%out.print(yaz);%>"><i
							class="fa fa-cog"></i>Ayarlar</a></li>

					<li><a href="cikis.jsp"><i class="fa fa-key"></i> Çıkış
							Yap</a></li>
				</ul></li>
			<!-- user login dropdown end -->

		</ul>
		<!--search & user info end-->
	</div>
</header>