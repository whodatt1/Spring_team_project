<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="py-3 px-5">
	<h1 class="disney movie">시리즈</h1>
	<div class="dropdown my-dropdown movie">
            <a class="my-btn" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              장르 선택
            </a>
            <ul class="dropdown-menu">
            
              <li><a class="dropdown-item " id="action" href="">액션</a></li>
              <li><a class="dropdown-item " id="animation" href="">애니메이션</a></li>
              <li><a class="dropdown-item" id="comedy" href="">코미디</a></li>
              <li><a class="dropdown-item" id="documentary" href="">다큐멘터리</a></li>
              <li><a class="dropdown-item" id="drama" href="">드라마</a></li>
              <li><a class="dropdown-item" id="SF" href="">SF</a></li>
              <li><a class="dropdown-item" id="thriller" href="">스릴러</a></li>
            </ul>
          </div>
          <sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.authList" var="auths"/>
          <c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
          <div class="" style="display:inline-block;">
          	<a class="my-btn" href="/series/register">등록</a>
          </div>
			</c:if>
</sec:authorize>
	<div class="row" id="movieListArea">
		<c:forEach items="${list}" var="mvo">
			<a
				href="/series/detail?mno=${mvo.mno }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&genre=${pgn.pgvo.genre}"
				class="col-md-15-me col-sm-3 my-posters"
				style="background-image: url(../../../../fileUpload/${mvo.posterImg});"> </a>
		</c:forEach>
	</div>
	<div style="text-align:center; margin-top:30px;">
	<button type="button" id="moreBtn" data-page="1" style="visibility: hidden;" class="btn btn-outline-secondary btn-block w-100">
						MORE +</button>
						</div>
</div>
<script src="/resources/js/series.list.js"></script>
<jsp:include page="../common/footer.jsp" />