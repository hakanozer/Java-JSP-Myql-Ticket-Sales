<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" import="java.*" errorPage=""%>
    
    
    
<div id="HeaderPanel">
  <div id="HeaderPanelContent"><a id="LogoLink" href="./">
    <div id="Logo"></div>
    </a>
    <div id="HeaderPanelLayout"><a id="_0" href="firmalar.jsp" class="Active HeaderPanelLayout">Firmalar</a>
      <div id="Line"></div>
      <a id="_1"  href="hakkimizda.jsp" class="Active HeaderPanelLayout">Hakkımızda</a>
      <div id="Line"></div>
      <a id="_2"  href="bilet_islemleri.jsp" class="Active HeaderPanelLayout">Bilet İşlemleri</a>
      <div id="Line"></div>
      <a id="_4"  href="iletisim.jsp" class="Active HeaderPanelLayout">İletişim</a>
      <div id="Line"></div>
    </div>
    
    
    
  <%
  boolean kullanici_varmi = (session.getAttribute("kullanici_id") == null);
  if(!kullanici_varmi){
  %>
  
   <div id="SingOnText">
      <div id="SingOnTextPanel">
        <div id="SingOnTextContent">
          <div id="SignIn">
          <a href="cikisyap.jsp "/>Çıkış Yap</a>
          </div>
          <div id="SignUp">
         <a> Syn :<% out.print(session.getAttribute("kullanici_adi")); %> </a>
          </div>
        </div>
      </div>
    </div>
  
  
  <%}else{ %>
    
    <div id="SingOnText">
      <div id="SingOnTextPanel">
        <div id="SingOnTextContent">
          <div id="SignIn">
          <a href="uye_giris.jsp"/>Üye Giriş</a>
          </div>
          <div id="SignUp">
          <a href="yeni_uye.jsp "/>Üye Ol</a>
          </div>
        </div>
      </div>
    </div>
    
  <% }%>  
    
    
    
  </div>
</div>




