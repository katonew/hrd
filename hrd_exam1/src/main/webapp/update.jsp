
<%@page import="Dto.MemberDto"%>
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
		int custno = Integer.parseInt(request.getParameter("custno"));
		Dao dao = new Dao();
		MemberDto dto = dao.getmember(custno);
	%>
	
	<center>
		<h3>홈쇼핑 회원 정보 수정</h3>
		<form name="updateform" action="/hrd_exam1/join" method="get">
			<table border="1" style="margin: 0 auto;">
				<tr>
					<th>회원번호</th>
					<td><input value="<%=dto.getCustno() %>" type="text" name="custno"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input value="<%=dto.getCustname() %>" type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input value="<%=dto.getPhone() %>" type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input value="<%=dto.getAddress() %>" type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input value="<%=dto.getJoindate() %>" type="text" name="joindate"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input value="<%=dto.getGrade() %>" type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input value="<%=dto.getCity() %>" type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
							<button onclick="onupdate()" type="submit">수정</button>
							<a href="/hrd_exam1/view.jsp" ><button type="button">조회</button></a>
						</center>
					</td>
				</tr>
			</table>
		
		</form>
	</center>
	<script type="text/javascript">
		function onupdate() {
			alert('수정성공');
			document.updateform.sumit();
		}
	</script>
	<%@ include file="footer.jsp" %>
	
</body>
</html>