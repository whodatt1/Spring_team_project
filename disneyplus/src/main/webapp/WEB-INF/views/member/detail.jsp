<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<style>
.register{
	text-align:center;
	max-width:700px;
	margin:32px auto;
}

.my-form{
	display:inline;
	backdrop-filter: blur(50px);
    background-color: rgb(49, 52, 62);
    border: 1px solid transparent;
    border-radius: 4px;
    caret-color: rgb(2, 231, 245);
    height: 48px;
    margin: 0px;
    outline: none;
    color:white;
    padding: 7px 12px;
    transition: all 0.1s ease 0s;
    width: 50%;
}
</style>

<div class="py-3 px-5 register">
	<h3>계정</h3>

		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" value="${mvo.email}" readonly>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="password" class="my-form" value="${mvo.pwd}" readonly>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<h3>가입날짜</h3>
			<p>${mvo.regAt}</p>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<h3>마지막 로그인</h3>
			<p>${mvo.lastLogin}</p>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<h3>등급</h3>
			<p>${mvo.grade}</p>
		</span>
		<sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal.mvo.email" var="authEmail"/>
		 <c:if test="${authEmail eq mvo.email}">
	       <a href="/member/modify?email=${mvo.email}" class="w-50 btn btn-outline-warning mb-3">계정 수정</a><br>
	       <button type="button" id="delBtn" class="w-50 btn btn-outline-danger mb-4">계정 탈퇴</button>
		 </c:if>
		</sec:authorize>
		<form action="/member/remove" method="post" id="removeForm">
			<input type="hidden" name="email" value="${authEmail}">
			<input type="hidden" class="my-form mb-2" name="pwd" id="pwd" maxlength="20" placeholder="비밀번호를 입력하세요">
			<button type="button" id="confDelBtn" class="w-50 btn btn-outline-danger" style="display: none;">확인</button>
		</form>
</div>
    
    
<script>
let isMod = '<c:out value="${isMod}"/>';
let removeMember = '<c:out value="${removeMember}"/>';
if (parseInt(isMod)) {
	alert("회원정보 수정 성공");
}
if (parseInt(removeMember) == 0) {
	alert('회원 탈퇴 실패');
	alert('비밀번호가 틀렸습니다');
}
</script>
<script src="/resources/js/member.detail.js"></script>
<jsp:include page="../common/footer.jsp" />
