<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="py-3 px-5 disney-wrapper">
	<h1 class="disney">Starwars</h1>

	<div class="row" id="rankListArea">
		<c:forEach items="${list}" var="mvo">
			<a
				href="/${mvo.movie eq true ? 'movies' : 'series'}/detail?mno=${mvo.mno}"
				class="col-md-15 col-sm-3 my-poster"
				style="background-image: url(../../../../fileUpload/${mvo.posterImg});"> </a>
		</c:forEach>
	</div>
</div>


<jsp:include page="../common/footer.jsp" />