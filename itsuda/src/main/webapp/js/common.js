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

// by ym. 2018-07-04 비밀번호 변경 - 입력한 비밀번호 검증
function newPwdCheck(){
	var newPwd = document.getElementById("newPassword").value;
	var newPwdChk = document.getElementById("newPasswordCheck").value;
	var pattern1 = /[0-9]/;						// 숫자 
	var pattern2 = /[a-z]/;						// 소문자 
	var pattern3 = /[A-Z]/;						// 대문자 
	var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자 
	
	if(!pattern1.test(newPwd) 
	|| !pattern2.test(newPwd) 
	|| !pattern3.test(newPwd) 
	|| !pattern4.test(newPwd) 
	|| newPwd.length <= 8) 
	{ 
		alert("비밀번호는 8자리 이상 소문자, 대문자, 숫자, 특수문자를 모두 포함해야 합니다."); 
		return false; 
	}
	else if(newPwd != newPwdChk)
	{
		alert("변경하실 비밀번호를 다시 확인해주시기 바랍니다."); 
		return false; 
	}
	else 
	{
		return true; 
	}
}

//by ym. 2018-07-04 비밀번호 변경 - 입력한 비밀번호 일치여부를 view에 표시
function pwdCheck(){
	var newPwd = document.getElementById("newPassword").value;
	var newPwdChk = document.getElementById("newPasswordCheck").value;
	var pwdChk = document.getElementById("passwordCheck");
	pwdChk.style.color = "red";
	if(newPwdChk == null || newPwdChk == undefined) pwdChk.innerHTML = "비밀번호를 입력해주세요.";
	else if(newPwd != newPwdChk) pwdChk.innerHTML = "비밀번호가 일치하지 않습니다.";
	else 
	{
		pwdChk.innerHTML = "비밀번호가 일치합니다.";
		pwdChk.style.color = "green";
	}
}
