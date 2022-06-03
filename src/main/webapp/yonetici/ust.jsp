<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>



<header class="header fixed-top clearfix">
	<!--logo start-->
	<div class="brand">

		<a href="index.jsp" class="logo"> <img
			src="../dosya/images/ottologo.png" alt="">
		</a>
		
	</div>
	<!--logo end-->

	<div class="nav notify-row" id="top_menu">
		
		
	</div>
	<div class="top-nav clearfix">
		<!--search & user info start-->
		<ul class="nav pull-right top-menu">
			<li><input type="text" class="form-control search"
				placeholder=" Search"></li>
			<!-- user login dropdown start-->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <img alt=""
					src="../dosya/images/mini.png"> <span class="username">
						<%
							out.print(session.getAttribute("yonetici_ad"));
						%>
				</span> <b class="caret"></b>
			</a>

				<ul class="dropdown-menu extended logout">
					<li><a href="profil.jsp"><i class=" fa fa-suitcase"></i>Profil</a></li>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection(
								"jdbc:mysql://localhost/otobus_bileti", "root", "");
						Statement st1 = conn.createStatement();

						boolean durum_var = (session.getAttribute("yonetici_id") == null);
						String yaz = "";

						if (!durum_var) {
							ResultSet rsa = st1
									.executeQuery("select * from isletme where id= '"
											+ session.getAttribute("yonetici_id") + "'");
							rsa.next();
							yaz = rsa.getString("id");
						}
					%>
					<li><a href="isletme_duzenle.jsp?id=<%out.print(yaz);%>"><i
							class="fa fa-cog"></i>Ayarlar</a></li>
					<li><a href="cikis.jsp"><i class="fa fa-key"></i>Çıkış Yap</a></li>
				</ul></li>
			<!-- user login dropdown end -->
			
		</ul>
		<!--search & user info end-->
	</div>
</header>