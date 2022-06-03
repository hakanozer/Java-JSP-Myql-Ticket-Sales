<%@ page contentType="text/html"%>
<%@ page
	import="javax.xml.parsers.DocumentBuilderFactory,
javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"%>
<%
	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	DocumentBuilder db = dbf.newDocumentBuilder();
	Document doc = db.parse("http://www.tcmb.gov.tr/kurlar/today.xml");

	NodeList node1 = doc.getElementsByTagName("ForexBuying");
	NodeList node2 = doc.getElementsByTagName("ForexSelling");
%>
<html>
<body>
	<center>
		<table>
			<tr>

				<td font-weight:bold;">Euro Alis</td>
         <td font-weight:bold;">Euro Satis</td>

    </tr>
			<tr>
				<%
					for (int i = 11; i < 12; i++) {
				%>
				<td><%=node1.item(i).getFirstChild().getNodeValue()%></td>
				<td><%=node2.item(i).getFirstChild().getNodeValue()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>

