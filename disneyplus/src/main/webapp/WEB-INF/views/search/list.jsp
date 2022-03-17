<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<form action="/board/list" method="get" onsubmit="return false">
	<input type="hidden" id="searchType" name="type" value="tgc">
	<input class="my-search-input" id="searchKeyword" type="text" name="keyword" placeholder="제목, 장르 또는 캐릭터로 검색하세요">
</form>
<div class="container my-5 contents-wrap">
<h1>영화 & 시리즈 둘러보기</h1>
<div class="row py-3" id="searchListArea">
</div>
<div class="text-center py-3">
	<button type="button" style="visibility:hidden;" id="moreBtn" data-page-no="1" class="my-btn">
	더보기
	</button>
</div>
<script src="/resources/js/search.list.js"></script>
<script>
getSearchList();
</script>
<jsp:include page="../common/footer.jsp" />