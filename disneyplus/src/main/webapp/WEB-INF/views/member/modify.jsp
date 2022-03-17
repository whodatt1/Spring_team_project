<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h3>계정 수정</h3>

	<form action="/member/modify" method="post" id="modForm">

		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="email" value="${mvo.email}" readonly>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="password" class="my-form" id="pwd" name="pwd" maxlength="20" 
			value="${mvo.pwd}" onfocus="this.value=''">
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
			<p>${mvo.grade > 100 ? '관리자' : '일반회원'}</p>
		</span>
		
		<button class="w-50 btn btn-primary btn-lg my-5" id="modBtn" type="button">수정 완료</button>
	
	</form>	
		
</div>
<script src="/resources/js/member.modify.js"></script>
<jsp:include page="../common/footer.jsp" />
