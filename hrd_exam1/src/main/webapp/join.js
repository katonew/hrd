console.log('join js 열림')



function join(){
	console.log('join 버튼')
	
	//  유효성 검사
	if(document.joinform.custname.value==""){
		alert('회원 성명을 입력해주세요')
		document.joinform.custname.focus(); // 커서이동
		return false;
	}
	if(document.joinform.phone.value==""){
		alert('회원 전화를 입력해주세요')
		document.joinform.phone.focus(); // 커서이동
		return false;
	}
	if(document.joinform.address.value==""){
		alert('회원 주소를 입력해주세요')
		document.joinform.address.focus(); // 커서이동
		return false;
	}
	if(document.joinform.joindate.value==""){
		alert('가입 일자를 입력해주세요')
		document.joinform.joindate.focus(); // 커서이동
		return false;
	}
	if(document.joinform.grade.value==""){
		alert('고객등급를 입력해주세요')
		document.joinform.cigradety.focus(); // 커서이동
		return false;
	}
	if(document.joinform.city.value==""){
		alert('도시코드를 입력해주세요')
		document.joinform.city.focus(); // 커서이동
		return false;
	}
	
	
	document.joinform.submit();
	alert('회원가입이 완료되었습니다.')
	
	
}