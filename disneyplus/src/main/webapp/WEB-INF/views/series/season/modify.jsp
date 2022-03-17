<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/nav.jsp" />
<div class="py-3 px-5 register">
	<h3>시즌 등록</h3>
	<c:set var="svo" value="${sdto.svo}"/>
	<form action="/series/season/modify" method="post"
		enctype="multipart/form-data">
		
		<input type="hidden" name="mno" value="${svo.mno}">
		<input type="hidden" name="sno" value="${svo.sno}">
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="title" placeholder="제목"
			value="${svo.title }">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="number" class="my-form" name="season"
			placeholder="시즌" value="${svo.season }">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="text" class="my-form" name="media"
			placeholder="영상 url" value="${svo.media }">
		</span>
		
		<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				placeholder="상세 정보">${svo.description}</textarea>
		</span>
		
		
		<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;"
			placeholder="포스터">
			<button type="button" id="trigger"
				class="btn btn-outline-primary btn-block d-block mb-3">썸네일</button>
		</span>
		<div class="" id="fileZone"></div>
		
		<!-- 기존에 등록된 파일 리스트 출력부분 -->

		<c:set var="mfList" value="${sdto.mfList }" />
		<c:forEach items="${mfList}" var="mfvo">
			<div>
				<img src="../../../../fileUpload/${svo.thumbnail}">
			</div>
			<span class="badge bg-secondary rounded-pill">${mfvo.fileSize }
				Byte</span>
			<button type="button" data-uuid="${mfvo.uuid}" class="file-x">X</button>

		</c:forEach>
		<div style="text-align:center;">
		<button class="btn btn-primary my-btn-lg my-5" id="regBtn"
			type="submit" style="margin-right: 60px;">수정 하기</button>
			<button class="btn btn-danger my-btn-lg my-5" id="delBtn" type="button">삭제 하기</button>
			</div>
	</form>
	<form action="/series/season/remove" method="post" id="delForm">
						<input type="hidden" name="mno" value="${svo.mno }"> <input
							type="hidden" name="sno" value="${svo.sno }">
					</form>
</div>

<script src="/resources/js/season.modify.js"></script>
<script src="/resources/js/movies.register.js"></script>

<jsp:include page="../../common/footer.jsp" />