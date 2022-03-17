<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="register my-5 contents-wrap">
<h1 class="py-3">굿즈 수정</h1>
<form action="/goods/modify" method="post"
		enctype="multipart/form-data">
<input type="hidden" name="gno" value="${gdto.gvo.gno }">
<input type="hidden" name="pageNo" value="${pgvo.pageNo }">
<input type="hidden" name="qty" value="${pgvo.qty }">
<input type="hidden" name="company" value="${pgvo.company }">
<input type="hidden" name="kinds" value="${pgvo.kinds }">
<input type="hidden" name="goodsImg" value="">
<span style="position: relative; display: block;" class="mb-3">
	<input type="text" class="my-form" name="gname" value="${gdto.gvo.gname }">
</span>
<span style="position: relative; display: block;" class="mb-3">
			<textarea rows="3" cols="6" class="my-form2" name="description"
				placeholder="상품 상세 정보">${gdto.gvo.description }</textarea>
</span>
<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="company" style="width: 346px;">
				<option>회사 선택</option>
				<option value="disney" ${gdto.gvo.company eq 'disney' ? 'selected' : ''}>디즈니</option>
				<option value="pixar" ${gdto.gvo.company eq 'pixar' ? 'selected' : ''}>픽사</option>
				<option value="marvel" ${gdto.gvo.company eq 'marvel' ? 'selected' : ''}>마블</option>
				<option value="starwars" ${gdto.gvo.company eq 'starwars' ? 'selected' : ''}>스타워즈</option>
				<option value="national" ${gdto.gvo.company eq 'national' ? 'selected' : ''}>네셔널 지오그래픽</option>
				<option value="star" ${gdto.gvo.company eq 'star' ? 'selected' : ''}>스타</option>
			</select>
</span>
<span style="position: relative; display: inline-block;" class="mb-3">
			<select class="my-form" name="kinds" style="width: 346px;">
				<option>종류 선택</option>
				<option value="tshirt" ${gdto.gvo.kinds eq 'tshirt' ? 'selected' : '' }>티셔츠</option>
				<option value="cap" ${gdto.gvo.kinds eq 'cap' ? 'selected' : '' }>캡</option>
				<option value="tumbler" ${gdto.gvo.kinds eq 'tumbler' ? 'selected' : '' }>텀블러</option>
				<option value="sticker" ${gdto.gvo.kinds eq 'sticker' ? 'selected' : '' }>스티커</option>
				<option value="poster" ${gdto.gvo.kinds eq 'poster' ? 'selected' : '' }>포스터</option>
			</select>
</span>
<span style="position: relative; display: block;" class="mb-3">
	<input type="text" class="my-form" name="price" value="${gdto.gvo.price }">
</span>
<span style="position: relative; display: block;" class="mb-3">
			<input type="file" class="my-form" name="files" id="files" style="display: none;" multiple>
			<button type="button" id="trigger"
				class="my-btn d-block mb-3">굿즈
				이미지</button>
</span>
<div class="" id="fileZone"></div>

<c:set var = "gfList" value = "${gdto.gfList }"/>
            <div class="cole-12 mb-3">
            	<ul class="list-group list-group-flush" id="gfList">
            	<c:forEach items="${gfList }" var="gfvo" varStatus="status">
  					<li class="list-group-item d-flex justify-content-between align-items-start my-bg mb-3" style="color: white; border-radius: 4px;">
  					<c:choose>
  						<c:when test="${gfvo.fileType > 0 }">
	  						<div>
	  							<img src="../../../../fileUpload/${fn:replace(gfvo.saveDir,'\\','/')}/${gfvo.uuid }_th_${gfvo.fileName}" style="width:100px; height:80px;">
	  						</div>
  						</c:when>
  						<c:otherwise>
  							<div>
  								<i class="fas fa-file fa-3x" style="color: white;"></i>
  							</div>
  						</c:otherwise>
  					</c:choose>
    					<div class="ms-2 me-auto">
      						<div class="fw-bold">${gfvo.fileName }</div>
      						${gfvo.regAt }
      						<div>${gfvo.fileSize } KB</div>
    					</div>
    					<button type="button" data-uuid=${gfvo.uuid } class="my-btn file-x">삭제</button>
  					</li>
  				</c:forEach>
  				</ul>
           	</div>
<button class="my-btn my-5 w-100" id="regBtn"
			type="submit">수정하기</button>
</form>
<script src="/resources/js/goods.register.js"></script>
<script src="/resources/js/goods.modify.js"></script>
<jsp:include page="../common/footer.jsp" />