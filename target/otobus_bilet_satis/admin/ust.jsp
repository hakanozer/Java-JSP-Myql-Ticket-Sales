<%@page import="com.sun.jndi.cosnaming.IiopUrl.Address"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
import="java.sql.*" import="java.*" errorPage=""%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
 <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/otobus_bileti", "root", "");

	Statement st4 = conn.createStatement();
	Statement st5 = conn.createStatement();
	
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
		<ul class="nav top-menu">
			
<%
String sayi = "";
String mail = "";
String mesaj = "";
String saat="";
String tarih="";
ResultSet rst = st5.executeQuery("select count(id) from iletisim where durum = '0'");
rst.next();
sayi = rst.getString("count(id)");



%>
					 
			
			
			<!-- inbox dropdown start-->
			
			
			<li id="header_inbox_bar" class="dropdown">
			<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
			<i class="fa fa-envelope-o"></i> <span class="badge bg-important"><% out.print(sayi);%></span>
			</a>
				<ul class="dropdown-menu extended inbox">
					<li>
						<p class="red"><% out.print(sayi);%> Yeni Mesajınız Var</p>
					</li>
					<%ResultSet rsf = st5.executeQuery("select * from iletisim where durum = '0' order by id desc limit 0 , 2");
					while (rsf.next()){
						mail= rsf.getString("mail");
						
						if(rsf.getString("mesaj").length() > 26){
							
							mesaj = rsf.getString("mesaj").substring(0, 25);	
						}else{
							
							mesaj = rsf.getString("mesaj");
						}
						
						
	
						saat=rsf.getTime("tarihsaat").toString();
						tarih=rsf.getDate("tarihsaat").toString();


						%>
					<li><a href="mesaj_oku.jsp?id=<%=rsf.getString("id") %>"> 
					<span class="photo">
					<img alt="avatar" src="../dosya/images/mini.png"></span> 
					<span class="subject"> 
					<span class="from"><%out.print(mail); %></span>
					<span class="time"><% Date now = rsf.getTime("tarihsaat");
					DateFormat formatter = new SimpleDateFormat("HH:mm");
					out.print(formatter.format(now).toString()); %> // <%
											    	now = rsf.getDate("tarihsaat");
													formatter = new SimpleDateFormat("dd-MM-yyyy");
													out.print(formatter.format(now).toString());
											     %></span>
					</span> 
					<span class="message"> <%out.print(mesaj); %> </span>
					</a></li>
					<%} %>
					<li><a href="mesaj.jsp">See all messages</a></li>
				</ul></li>
			<!-- inbox dropdown end -->
			
	</div>
	<div class="top-nav clearfix">
		<!--search & user info start-->
		<ul class="nav pull-right top-menu">
			<li><input type="text" class="form-control search"
				placeholder=" Search"></li>
			<!-- user login dropdown start-->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <img alt=""
					src="../dosya/images/mini.png"> <span
					class="username">John Doe</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
					<%
						

						boolean durum_var = (session.getAttribute("admin_id") == null);
						String yaz = "";

						if (!durum_var) {
							ResultSet rsa = st4.executeQuery("select * from admin where id= '"+ session.getAttribute("admin_id") + "'");
							rsa.next();
							yaz = rsa.getString("id");
						}
					%>
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