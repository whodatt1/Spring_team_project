<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<c:set var="mvo" value="${mdto.mvo}"/>

<div class="py-3 px-5 register">
	<h3>영화 등록</h3>

	<form action="/movies/modify" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="mno" value="${mvo.mno }">
        <input type="hidden" name="pageNo" value="${pgvo.pageNo }">
        <input type="hidden" name="qty" value="${pgvo.qty }">

		<div class="mb-3" style="display: inline-block; margin-right: 30px">
			<span class="margin-r">영화</span> <label class="el-switch"> <input
				type="checkbox" name="movie" value="true" <c:if test="${mvo.movie eq true}">checked</c:if>> <span
				class="el-switch-style"></span>
			</label>
		</div>

		<div class="mb-3" style="display: inline-block;">
			<span class="margin-r">시리즈</span> <label class="el-switch"> <input
				type="checkbox" name="movie" value="false" <c:if test="${mvo.movie eq false}">checked</c:if>> <span
				class="el-switch-style"></span>
			</label>
		</div>

		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="title" value="${mvo.title}">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				>${mvo.description}</textarea>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description2"
				>${mvo.description2}</textarea>
		</span>
		
		<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="company" style="width: 300px">
				<option>회사 선택</option>
				<option value="disney" <c:if test="${mvo.company eq 'disney'}">selected</c:if>>디즈니</option>
				<option value="pixar"  <c:if test="${mvo.company eq 'pixar'}">selected</c:if>>픽사</option>
				<option value="marvel"  <c:if test="${mvo.company eq 'marvel'}">selected</c:if>>마블</option>
				<option value="starwars"  <c:if test="${mvo.company eq 'starwars'}">selected</c:if>>스타워즈</option>
				<option value="national"  <c:if test="${mvo.company eq 'national'}">selected</c:if>>네셔널 지오그래픽</option>
				<option value="stars"  <c:if test="${mvo.company eq 'stars'}">selected</c:if>>스타</option>
		</select>
		</span> 
		
		<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="genre" style="width: 298px">
				<option>장르 선택</option>
				<option value="action"  <c:if test="${mvo.genre eq 'action'}">selected</c:if>>액션</option>
				<option value="animation" <c:if test="${mvo.genre eq 'animation'}">selected</c:if>>애니메이션</option>
				<option value="comedy" <c:if test="${mvo.genre eq 'comedy'}">selected</c:if>>코미디</option>
				<option value="documentary" <c:if test="${mvo.genre eq 'documentary'}">selected</c:if>>다큐멘터리</option>
				<option value="drama" <c:if test="${mvo.genre eq 'drama'}">selected</c:if>>드라마</option>
				<option value="romance" <c:if test="${mvo.genre eq 'romance'}">selected</c:if>>로맨스</option>
				<option value="SF" <c:if test="${mvo.genre eq 'SF'}">selected</c:if>>SF</option>
				<option value="thriller" <c:if test="${mvo.genre eq 'thriller'}">selected</c:if>>스릴러</option>
		</select>
		</span> 
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="openingYear"
			value="${mvo.openingYear}">
			
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="ageLimit"
			value="${mvo.ageLimit}">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="media"
			value="${mvo.media}">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="director"
			value="${mvo.director}">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="actor"
			value="${mvo.actor}">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;"
			placeholder="포스터">
			<button type="button" id="trigger"
				class="btn btn-outline-primary btn-block d-block mb-3">포스터 등록</button>
		</span>
		<div class="" id="fileZone"></div>
		<c:set var="mfList" value="${mdto.mfList }"/>
            <c:forEach items="${mfList}" var="mfvo">
            <div>
  				<img src="../../../../fileUpload/${mvo.posterImg}">
  			</div>
  			<button type="button" data-uuid="${mfvo.uuid}" class="file-x">X</button>
  			
  			</c:forEach>

		<button class="w-100 btn btn-primary btn-lg my-5" id="regBtn"
			type="submit">등록하기</button>
	</form>
</div>
<script src="/resources/js/movies.modify.js"></script>
<script src="/resources/js/movies.register.js"></script>
<jsp:include page="../common/footer.jsp" />


  			