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
// by ym 2018-07-04 비밀번호 변경 시, 검증 기능
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
//by ym 2018-07-04 비밀번호 변경 시, 재 확인 기능
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
//by ym 2018-07-04 라이브러리 상세 조회 및 수정 기능
function detail_link(num, team, mode){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	if(mode == "detail") form.setAttribute("action", "detailLink");
	else form.setAttribute("action", "editLink");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "seq");
	hiddenField.setAttribute("value", num);
	var hiddenField2 = document.createElement("input");
	hiddenField2.setAttribute("type", "hidden");
	hiddenField2.setAttribute("name", "team");
	hiddenField2.setAttribute("value", team);
	
	form.appendChild(hiddenField);
	form.appendChild(hiddenField2);
	document.body.appendChild(form);
	form.submit();
}

//by ym 2018-07-04 라이브러리 삭제 기능
function del_link(num, team){
	
	var chk = confirm("삭제하시겠습니까?");
	if(chk == true)
	{
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "deleteLink");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "seq");
		hiddenField.setAttribute("value", num);
		var hiddenField2 = document.createElement("input");
		hiddenField2.setAttribute("type", "hidden");
		hiddenField2.setAttribute("name", "team");
		hiddenField2.setAttribute("value", team);
		
		form.appendChild(hiddenField);
		form.appendChild(hiddenField2);
		document.body.appendChild(form);
		form.submit();
	}
};
// by ym. 2018-07-04 라이브러리 추가 시 description 글자 수 제한 기능 
function len_chk(){  
  var frm = document.getElementById("description"); 
  if(frm.value.length > 200){  
       alert("글자수는 영문 200, 한글 100자로 제한됩니다.");  
       frm.value = frm.value.substring(0,200);  
       frm.focus();  
  } 

} 
