/**
 * common function
 */


/**
 * 소문자, 대문자, 숫자, 특수문자 포함 및 자릿수 확인
 */
function chkLogin(email,passwd) { 
	var pattern1 = /[0-9]/;						// 숫자 
	var pattern2 = /[a-z]/;						// 소문자 
	var pattern3 = /[A-Z]/;						// 대문자 
	var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자 
	
	if(!pattern1.test(passwd) 
	|| !pattern2.test(passwd) 
	|| !pattern3.test(passwd) 
	|| !pattern4.test(passwd) 
	|| passwd.length <= 8) 
	{ 
		alert("비밀번호는 8자리 이상 소문자, 대문자, 숫자, 특수문자를 모두 포함해야 합니다."); 
		return false; 
	} 
	else 
	{ 
		return true; 
	}
}


