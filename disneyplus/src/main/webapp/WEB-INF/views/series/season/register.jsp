<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/nav.jsp" />
<div class="py-3 px-5 register">
	<h3>시즌 등록</h3>

	<form action="/series/season/register" method="post"
		enctype="multipart/form-data">
		
		<input type="hidden" name="mno" value="${mno}">
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="title" placeholder="제목">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="season"
			placeholder="시즌">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="media"
			placeholder="영상 url">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				placeholder="상세 정보"></textarea>
		</span>
		
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;"
			placeholder="포스터">
			<button type="button" id="trigger"
				class="btn btn-outline-primary btn-block d-block mb-3">썸네일</button>
		</span>
		<div class="" id="fileZone"></div>

		<button class="w-100 btn btn-primary btn-lg my-5" id="regBtn"
			type="submit">등록하기</button>
	</form>
</div>
<script src="/resources/js/movies.register.js"></script>


<jsp:include page="../../common/footer.jsp" />