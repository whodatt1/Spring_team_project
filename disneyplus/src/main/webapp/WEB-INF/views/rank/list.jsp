<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="container my-5 contents-wrap">
	<h1 class="py-3">랭킹</h1>
	<h4>지금 뜨는 영화 & 시리즈</h4>
	<div class="row py-3" id="rankListArea">
	</div>
	<div id="arrowArea" class="py-3">
	</div>
	<script src="/resources/js/rank.list.js"></script>
	<script>
		getRankList()
	</script>
<jsp:include page="../common/footer.jsp" />