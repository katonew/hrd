<%@page import="controller.Dao"%>
<%@page import="Dto.MemberDto"%>
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
	<center><h3>회원목록조회/수정</h3></center>
	<table border="1" style="margin: 0 auto;">
		<tr>
			<th>회원번호</th><th>회원성명</th><th>전화번호</th>
			<th>주소</th><th>가입일자</th><th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% 
			Dao dao = new Dao();
			ArrayList<MemberDto> list = dao.getMemberList();
			for(int i=0;i<list.size();i++) {
				MemberDto dto = list.get(i);
				
		%>
		<tr>
			<td><a href="/hrd_exam1/update.jsp?custno=<%=dto.getCustno() %>"><%=dto.getCustno() %></a></td>
			<td><%=dto.getCustname() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getAddress() %></td>
			<td><%=dto.getJoindate() %></td>
			<td><%=dto.getGrade().equals("A")? "VIP" : dto.getGrade().equals("B")? "일반" : "직원" %></td>
			<td><%=dto.getCity() %></td>
		</tr>
		<%
			}
		%>
	</table>
	
	<%@ include file="footer.jsp" %>


</body>
</html>