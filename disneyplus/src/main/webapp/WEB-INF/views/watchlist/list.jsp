<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="container my-5 contents-wrap">
<sec:authentication property="principal.mvo.email" var="authEmail"/>
	<input type="hidden" name="email" value="${authEmail }">
	<input type="hidden" name="profileName" value="${profile.profileName }">
	<h1 class="py-3">관심 컨텐츠</h1>
	<div class="row py-3" id="watchListArea">
	</div>
	<div class="text-center py-3">
		<button type="button" style="visibility:hidden;" id="moreBtn" data-pageNo="1" class="my-btn">
		더보기
		</button>
	</div>
	<script>
		const email = document.querySelector("input[name=email]").value;
		const profileName = document.querySelector("input[name=profileName]").value;
	</script>
	<script src="/resources/js/watchlist.list.js"></script>
	<script>
		getWatchList(email, profileName);
	</script>
<jsp:include page="../common/footer.jsp" />