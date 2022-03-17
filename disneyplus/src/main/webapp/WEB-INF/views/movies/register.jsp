<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="py-3 px-5 register">
	<h3>영화 등록</h3>

	<form action="/movies/register" method="post"
		enctype="multipart/form-data">

		<div class="mb-3" style="display: inline-block; margin-right: 30px">
			<span class="margin-r">영화</span> <label class="el-switch"> <input
				type="checkbox" name="movie" value="true" checked> <span
				class="el-switch-style"></span>
			</label>
		</div>

		<div class="mb-3" style="display: inline-block;">
			<span class="margin-r">시리즈</span> <label class="el-switch"> <input
				type="checkbox" name="movie" value="false"> <span
				class="el-switch-style"></span>
			</label>
		</div>

		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="title" placeholder="제목">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				placeholder="상세 정보 간략히"></textarea>
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description2"
				placeholder="상세 정보 자세히"></textarea>
		</span>
		
		<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="company" style="width: 300px">
				<option>회사 선택</option>
				<option value="disney">디즈니</option>
				<option value="pixar">픽사</option>
				<option value="marvel">마블</option>
				<option value="starwars">스타워즈</option>
				<option value="national">네셔널 지오그래픽</option>
				<option value="stars">스타</option>
		</select>
		</span> 
		
		<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="genre" style="width: 298px">
				<option>장르 선택</option>
				<option value="action">액션</option>
				<option value="animation">애니메이션</option>
				<option value="comedy">코미디</option>
				<option value="documentary">다큐멘터리</option>
				<option value="drama">드라마</option>
				<option value="romance">로맨스</option>
				<option value="SF">SF</option>
				<option value="thriller">스릴러</option>
		</select>
		</span> 
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="openingYear"
			placeholder="개봉년도">
			
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="ageLimit"
			placeholder="나이 제한">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="media"
			placeholder="영상 url">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="director"
			placeholder="감독">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="actor"
			placeholder="출연">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;"
			placeholder="포스터">
			<button type="button" id="trigger"
				class="btn btn-outline-primary btn-block d-block mb-3">poster
				Image</button>
		</span>
		<div class="" id="fileZone"></div>
		


		<button class="w-100 btn btn-primary btn-lg my-5" id="regBtn"
			type="submit">등록하기</button>
	</form>
</div>
<script src="/resources/js/movies.register.js"></script>
<jsp:include page="../common/footer.jsp" />