<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="register my-5 contents-wrap">
<h1 class="py-3">굿즈 생성</h1>
<form action="/goods/register" method="post"
		enctype="multipart/form-data">
<span style="position: relative; display: block;" class="mb-3">
	<input type="text" class="my-form" name="gname" placeholder="상품 이름" required>
</span>
<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				placeholder="상품 상세 정보" required></textarea>
</span>
<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="company" style="width: 346px;" required>
				<option>회사 선택</option>
				<option value="disney">디즈니</option>
				<option value="pixar">픽사</option>
				<option value="marvel">마블</option>
				<option value="starwars">스타워즈</option>
				<option value="national">네셔널 지오그래픽</option>
				<option value="star">스타</option>
			</select>
</span>
<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="kinds" style="width: 346px;" required>
				<option>종류 선택</option>
				<option value="tshirt">티셔츠</option>
				<option value="cap">캡</option>
				<option value="tumbler">텀블러</option>
				<option value="sticker">스티커</option>
				<option value="poster">포스터</option>
			</select>
</span>
<span style="position: relative; display: block;" class="mb-3">
	<input type="number" class="my-form" name="price" placeholder="상품 가격" required>
</span>
<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;" multiple required>
			<button type="button" id="trigger"
				class="my-btn d-block mb-3">굿즈
				이미지</button>
</span>
<div class="" id="fileZone"></div>
<button class="my-btn my-5 w-100" id="regBtn"
			type="submit">등록하기</button>
</form>
<script src="/resources/js/goods.register.js"></script>
<jsp:include page="../common/footer.jsp" />