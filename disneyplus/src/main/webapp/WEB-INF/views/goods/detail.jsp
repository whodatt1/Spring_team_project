<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<style>
.star-rating {
    display: flex;
    flex-direction: row-reverse;
    font-size: 2.25rem;
    line-height: 2.5rem;
    justify-content: space-around;
    padding: 0 0.2em;
    text-align: left;
    width: 5em;
  }
   
  .star-rating input {
    display: none;
  }
   
  .star-rating label {
    -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
    -webkit-text-stroke-width: 2.3px;
    -webkit-text-stroke-color: #2b2a29;
    cursor: pointer;
  }
   
  .star-rating :checked ~ label {
    -webkit-text-fill-color: gold;
  }
   
  .star-rating label:hover,
  .star-rating label:hover ~ label {
    -webkit-text-fill-color: #fff58c;
  }
  .fa-plus:hover {
  	color: white;
  }
</style>
<div class="container my-5 contents-wrap">
<h1 class="py-3">굿즈 상세 정보</h1>
<h5>${gdto.gvo.company eq 'disney' ? '디즈니' : gdto.gvo.company eq 'pixar' ? '픽사' : gdto.gvo.company eq 'marvel' ? '마블' : gdto.gvo.company eq 'starwars' ? '스타워즈' : gdto.gvo.company eq 'national' ? '내셔널지오그래픽' : '스타'} > ${gdto.gvo.kinds eq 'tshirt' ? '티셔츠' : gdto.gvo.kinds eq 'cap' ? '캡' : gdto.gvo.kinds eq 'tumblr' ? '텀블러' : gdto.gvo.kinds eq 'sticker' ? '스티커' : '포스터' }</h4>
<h4 class="py-3">${gdto.gvo.gname }</h1>
<div class="row pb-5" style="border-bottom: 1px solid silver">
<input type="hidden" name="gno" value="${gdto.gvo.gno }">
<input type="hidden" name="price" value="${gdto.gvo.price }">
	<c:set var = "gfList" value = "${gdto.gfList }"/>
	<div id="carouselExampleControls" class="carousel slide col-md-6" data-bs-ride="carousel">
	  <div class="carousel-inner">
	  	<c:forEach items="${gfList }" var="gfvo" varStatus="status">
	    	<div class="carousel-item ${status.index eq 0 ? 'active' : ''}">
	      		<img src="../../../../fileUpload/${fn:replace(gfvo.saveDir,'\\','/')}/${gfvo.uuid }_th_${gfvo.fileName}" class="d-block" style="width: 640px; height: 480px">
	    	</div>
	    </c:forEach>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<div class="col-md-6">
		<h5 class="pb-3" style="border-bottom: 1px solid silver">제품 정보 <span class="my-goods-company">Goods Detail</span></h5>
		<ul style="padding-left: 0;">
			<li class="row">
				<p class="col-md-4">회사</p>
				<p class="col-md-8" style="font-weight: bold;">${gdto.gvo.company eq 'disney' ? '디즈니' : gdto.gvo.company eq 'pixar' ? '픽사' : gdto.gvo.company eq 'marvel' ? '마블' : gdto.gvo.company eq 'starwars' ? '스타워즈' : gdto.gvo.company eq 'national' ? '내셔널지오그래픽' : '스타'}</p>
			</li>
			<li class="row">
				<p class="col-md-4">품목</p>
				<p class="col-md-8" style="font-weight: bold;">${gdto.gvo.kinds eq 'tshirt' ? '티셔츠' : gdto.gvo.kinds eq 'cap' ? '캡' : gdto.gvo.kinds eq 'tumblr' ? '텀블러' : gdto.gvo.kinds eq 'sticker' ? '스티커' : '포스터' }</p>
			</li>
			<li class="row">
				<p class="col-md-4">조회수</p>
				<p class="col-md-8" style="font-weight: bold;">${gdto.gvo.readCount }</p>
			</li>
			<li class="row">
				<p class="col-md-4">구매 후기</p>
				<p class="col-md-8" style="font-weight: bold;">${gdto.gvo.cmtQty }</p>
			</li>
		</ul>
		<h5 class="pb-3" style="border-bottom: 1px solid silver">제품 구매 <span class="my-goods-company">Goods Purchase</span></h5>
		<ul style="padding-left: 0;">
			<li class="row">
				<p class="col-md-4">구매 개수</p>
				<p class="col-md-8" style="font-weight: bold;">
					<a id="purMinus" style="width: 26px; height: 26px;" onclick="countMinus();"><i class="fas fa-minus"></i></a>
					<input type="text" id="purchaseCount" value="1" style="width: 26px; height: 26px;" readonly>
					<a id="purPlus" style="width: 26px; height: 26px;" onclick="countPlus();"><i class="fas fa-plus"></i></a>
				</p>
			</li>
			<li class="row">
				<p class="col-md-4">가격</p>
				<p class="col-md-8" id="price" style="font-weight: bold;">
					${gdto.gvo.price }
				</p>
				<p class="col-md-12" style="font-weight: bold;">
					<a class="my-btn w-100" id="purchaseBtn" style="text-decoration: none;">구매</a>
				</p>
			</li>
		</ul>
	</div>
</div>
<div class="row mt-5 pb-3">
	<c:forEach items="${gfList }" var="gfvo" varStatus="status">
		<img class="mb-5" src="../../../../fileUpload/${fn:replace(gfvo.saveDir,'\\','/')}/${gfvo.uuid }_${gfvo.fileName}" class="d-block w-100">
	</c:forEach>
	<div class="text-center mb-5">
		${gdto.gvo.description }
	</div>
	<div class="text-center">
		<a style="text-decoration: none;" class="my-btn" href="/goods/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&company=${pgvo.company}&kinds=${pgvo.kinds}">굿즈 목록</a>
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.mvo.email" var="authEmail"/>
		<sec:authentication property="principal.mvo.authList" var="auths"/>
		<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
		<a style="text-decoration: none;" class="my-btn" href="/goods/modify?gno=${gdto.gvo.gno }">굿즈 수정</a>
		<a style="text-decoration: none;" class="my-btn" id="delBtn">굿즈 삭제</a>
		</c:if>
		</sec:authorize>
	</div>
</div>
<h5 class="pb-3" style="border-bottom: 1px solid silver">굿즈 리뷰 작성 <span class="my-goods-company">Goods Review Post</span></h5>
<input type="hidden" name="email" value="${authEmail }">
<input type="hidden" name="profileName" value="${profile.profileName }">
<div class="star-rating space-x-4 mx-auto pb-3">
	<input type="radio" id="5-stars" name="rvScore" value="5" v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="rvScore" value="4" v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="rvScore" value="3" v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="rvScore" value="2" v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="rvScore" value="1" v-model="ratings" />
	<label for="1-star" class="star">★</label>
</div>
<span style="position: relative; display: block;" class="pb-3">
	<textarea rows="3" cols="6" class="my-form2" name="rvContent" placeholder="여러분의 소중한 리뷰를 입력해주세요"></textarea>
</span>
<div class="text-center pb-3">
<button class="my-btn" id="rvPostBtn">등록하기</button>
</div>
<h5 class="pb-3" style="border-bottom: 1px solid silver">리뷰 리스트 <span class="my-goods-company">Goods Review List</span></h5>
<ul class="list-group" id="rvListArea">
</ul>
<ul class="pagination justify-content-center py-5" id="rvPaging">
</ul>
<form action="/goods/remove" method="post" id="delForm">
	<input type="hidden" name="gno" value="${gdto.gvo.gno }">
	<input type="hidden" name="pageNo" value="${pgvo.pageNo }">
	<input type="hidden" name="qty" value="${pgvo.qty }">
	<input type="hidden" name="company" value="${pgvo.company }">
	<input type="hidden" name="kinds" value="${pgvo.kinds }">
</form>
<script>
let gnoVal = document.querySelector('input[name=gno]').value;
let isMod = '<c:out value="${isMod}"/>';
if (parseInt(isMod)) {
	alert('굿즈 수정 성공');
}
</script>
<script src="/resources/js/goods.detail.js"></script>
<script src="/resources/js/goods.comment.js"></script>
<script>
getReviewList(gnoVal);
</script>
<jsp:include page="../common/footer.jsp" />