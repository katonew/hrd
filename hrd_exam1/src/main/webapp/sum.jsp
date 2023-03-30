<%@page import="controller.Dao"%>
<%@page import="Dto.MoneyDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<center><h3>회원매출조회</h3></center>
		<table border="1" style="margin: 0 auto;">
			<tr>
				<th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
			</tr>
		<%
			Dao dao = new Dao();
			ArrayList<MoneyDto> list = dao.getmoneyList();
			for(int i=0;i<list.size();i++){
				MoneyDto dto = list.get(i);
		%>
			<tr>
				<td><%=dto.getCustno() %></td>
				<td><%=dto.getCustname() %></td>
				<td><%=dto.getGrade().equals("A")? "VIP" : dto.getGrade().equals("B")? "일반" : "직원" %></td>
				<td><%=dto.getSum() %></td>
			</tr>
		<%		
			}
		%>
		</table>
	
	<%@ include file="footer.jsp" %>

</body>
</html>