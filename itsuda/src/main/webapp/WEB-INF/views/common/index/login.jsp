<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common/include/directives.jsp"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setHeader("ExPires","0");
	
%>
<%!
	// clientIP
	String getClientIP(HttpServletRequest request) {
	  String ip = request.getHeader("X-FORWARDED-FOR"); 
	  if (ip == null || ip.length() == 0) {
	    ip= request.getHeader("Proxy-Client-IP");
	  }
	  if (ip == null || ip.length() == 0) {
	    ip= request.getHeader("WL-Proxy-Client-IP");  
	  }
	  if (ip == null || ip.length() == 0) {
	    ip = request.getRemoteAddr();
	  }
	  return ip;
	}
%>
<%!
	// clientAgent
	String getClientAgent(HttpServletRequest request) {
	  String agent = request.getHeader("User-Agent"); 
	  return agent;
	}
%>

<script>
	function login(){
		// checkBox 값 전달 (hidden tag 이용)
		var checked = $('#loginAutoBox').is(":checked");
		if(checked == true){
			$("#loginAuto").value = 'Y';
		}
		else{
			$("#loginAuto").value = 'N';
		}
	}
</script>

<div class="container">
	<div class="row">
	    <div class="col-md">
			<div class="modal-content">
				<div class="modal-body">
					<form role="form" action="<c:url value='/member/login'/>" method="post">
						<input name = "clientIp" type="hidden" value="<%=getClientIP(request) %>"/>
						<input name = "clientAgent" type="hidden" value="<%=getClientAgent(request) %>"/>
				 		<div class="form-group">
				 			<label for="email">이메일</label>
				 			<input type="email" class="form-control" id="email" name="email" placeholder="이메일주소를 입력해주세요" />
				 		</div>
					 	<div class="form-group">
						 	<label for="password">비밀번호</label>
					 		<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" />
					 	</div>
					 	<!-- <div class="checkbox">
					 		<label><input type="checkbox" id="loginAutoBox" name="loginAutoBox" />로그인 상태 유지</label>
					 		<input type="hidden" id="loginAuto" name="loginAuto" value="N" />
					 	</div> -->
					 	<input type="hidden" id="loginAuto" name="loginAuto" value="N" />
					 	<div class="form-group">
					 		<button type="submit" class="col-md btn btn-success" onclick="login()" style="margin-bottom: 10px;">로그인&nbsp;<i class="fa fa-check spaceLeft"></i></button>
						</div>
					</form>
	    		</div>
			</div>
		</div>
	</div>
</div>