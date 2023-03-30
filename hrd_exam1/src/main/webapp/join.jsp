<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="controller.Dao"%>
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
	
	<%
		// jsp 이용한 서블릿 대체
		Dao dao = new Dao();
		int custno = dao.getcustno();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String now = sdf.format(date);
		
	%>
	
	<center><h3>홈쇼핑 회원 등록</h3></center>
	<form name="joinform" action="/hrd_exam1/join" method="post">
		<table border="1" style="margin: 0 auto;">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input value="<%=custno %>" type="text" name="custno"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input value="<%=now %>" type="text" name="joindate"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<center>
						<button onclick="join()" type="button">등록</button>
						<a href="/hrd_exam1/view.jsp" ><button type="button">조회</button></a>
					</center>
				</td>
			</tr>
		</table>
	
	</form>
	<%@ include file="footer.jsp" %>
	
	
	<script src="/hrd_exam1/join.js" type="text/javascript"></script>

</body>
</html>