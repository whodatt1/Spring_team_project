<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />
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
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}
</style>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
     <c:set value="action" var="genre"/>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="/"><i class="fas fa-home my-i"></i> <span class="underline">홈</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/rank/list"><i class="far fa-chart-bar my-i"></i> <span class="underline">랭킹</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/search/list"><i class="fas fa-search my-i"></i> <span class="underline">검색</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/watchlist/list"><i class="fas fa-plus my-i"></i> <span class="underline">관심컨텐츠</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/movies/list?genre=${genre }"><i class="fas fa-film my-i"></i> <span class="underline">영화</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/series/list?genre=${genre }"><i class="fas fa-tv my-i"></i> <span class="underline">시리즈</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/goods/list?company=disney"><i class="fas fa-store my-i"></i> <span class="underline">굿즈</span></a>
          </li>
           
          <li class="nav-item">
          	<sec:authentication property="principal.mvo.email" var="authEmail"/>
            <a class="nav-link" href="/cart/list?email=${authEmail }&profileName=${profile.profileName}"><i class="fas fa-shopping-cart my-i"></i> <span class="underline">구매목록</span></a>
          </li>
          
         	 <li class="nav-item dropdown my-dropdown" style="position: absolute; right: 3%; min-width: 10rem;">
         	 	<c:if test="${profile.icon != null}">
           		<a class="nav-link" style="text-align: right;" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
             		<img id="icon" style="width: 48px; height: 48px; border-radius: 70%;" src="<spring:url value='${profile.icon}'/>">
           		</a>
           		</c:if>
	            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           		<sec:authorize access="isAuthenticated()">
				
           		<sec:authentication property="principal.mvo.authList" var="auths"/>
	              <li><a class="dropdown-item" href="/profile/login?email=${authEmail}">프로필 로그인</a></li>
	              <li><a class="dropdown-item" href="/profile/selectIcon">프로필 추가</a></li>
	              <li><a class="dropdown-item" href="/profile/profileList?email=${authEmail}">프로필 수정</a></li>
	              <li><a class="dropdown-item" href="/member/detail?email=${authEmail}">계정</a></li>
	              <c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
	              <li><a class="dropdown-item" href="/member/list">계정리스트</a></li>
	              </c:if>
	              <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
	            </sec:authorize>
	            </ul>
        	 </li>
         		
        </ul>
      </div>
    </div>
  </nav>

<c:set var="mvo" value="${mdto.mvo}" />
<c:set var="mfList" value="${mdto.mfList }" />
<div class="bgImg" style="background-image: url(../../../../fileUpload/${mvo.bgImg});">
	<div class="img-wrapper">
		<div class="main-wrapper">
			<h2 class="title">${mvo.title}</h2>
			<span class="age-wrapper"> <c:choose>
					<c:when test="${mvo.ageLimit < 12}">
						<img class="age" alt="" src="/resources/img/logo/all.png">
					</c:when>
					<c:when test="${mvo.ageLimit eq 12}">
						<img class="age" alt="" src="/resources/img/logo/12age.png">
					</c:when>
					<c:when test="${mvo.ageLimit eq 15}">
						<img class="age" alt="" src="/resources/img/logo/15age.png">
					</c:when>
					<c:when test="${mvo.ageLimit eq 18}">
						<img class="age" alt="" src="/resources/img/logo/18age.png">
					</c:when>
				</c:choose> <img class="age" alt="" src="/resources/img/logo/ad.png"> <img
				class="age" alt="" src="/resources/img/logo/cc.png">

			</span> <span class="age-wrapper">
				${fn:substring(mvo.openingYear,0,10)} • <c:choose>
					<c:when test="${mvo.genre eq 'action'}">액션</c:when>
					<c:when test="${mvo.genre eq 'animation'}">애니메이션</c:when>
					<c:when test="${mvo.genre eq 'comedy'}">코미디</c:when>
					<c:when test="${mvo.genre eq 'documentary'}">다큐멘터리</c:when>
					<c:when test="${mvo.genre eq 'drama'}">드라마</c:when>
					<c:when test="${mvo.genre eq 'romance'}">로맨스</c:when>
					<c:when test="${mvo.genre eq 'SF'}">SF</c:when>
					<c:when test="${mvo.genre eq 'thriller'}">스릴러</c:when>
				</c:choose>
			</span>

			<div class="play-div">
				<a href="/movies/play?mno=${mvo.mno}" class="playbtn"><i
					class="fas fa-play"></i>&nbsp;&nbsp;재생</a>
				<div class="plus-wishlist">
                  <input type="hidden" name="wlTitle" value="${mvo.title }"/>
                  <input type="hidden" name="wlPosterImg" value="${mvo.posterImg }"/>
                  <i class="fas fa-plus fa-2x" id="plusWishList"></i>
                  <i class="fas fa-minus fa-2x" id="minusWishList"></i>
               </div>
               <sec:authorize access="isAuthenticated()"/>
						<sec:authentication property="principal.mvo.authList" var="auths" />
               <c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
					<div class="d-inline">
						<a class="my-btn" id="regChar" data-bs-toggle="modal"
							data-bs-target="#myModal"
							style="margin-top: 4px; margin-right: 3px;">캐릭터 추가</a>
					</div>
					<div class="d-inline">
						<a class="my-btn" id="delChar"
							style="margin-top: 4px; margin-right: 3px;">캐릭터 삭제</a>
					</div>
					<div class="d-inline">
						<a class="my-btn"
							href="/movies/modify?mno=${mvo.mno}&pageNo=${pgvo.pageNo}&qty=${pgvo.qty}&genre=${pgvo.genre}"
							style="margin-top: 4px; margin-right: 3px;">수정</a>
					</div>
					<div class="d-inline">
						<a class="my-btn" id="delBtn" style="margin-top: 4px;">삭제</a>
					</div></c:if>
					<form action="/movies/remove" method="post" id="delForm">
						<input type="hidden" name="mno" value="${mvo.mno }"> <input
							type="hidden" name="pageNo" value="${pgvo.pageNo }"> <input
							type="hidden" name="qty" value="${pgvo.qty }"> <input
							type="hidden" name="genre" value="${pgvo.genre }">
					</form>
					
				</div>
			</div>
			<div class="padding50">
			<p class="description">${mvo.description}</p>

			<nav class="info">
				<div class="d-info" id="des">상세 정보</div>
				<div class="d-info" id="review">리뷰</div>
			</nav>
			<div id="visiblearea">
				<div class="title-des">
					<h1 class="d-title">${mvo.title}</h1>
					<div class="d-des">
						<p class="p-des">${mvo.description2}</p>
					</div>

					<div class="m-info">

						<div class="m-infoRL">

							<div class="m-info-items">
								<p class="m-info-item">공개일:</p>
								<p class="m-info-item">
									${mvo.openingYear}</p>
							</div>

							<div class="m-info-items">
								<p class="m-info-item">장르:</p>
								<p class="m-info-item">
									<c:choose>
										<c:when test="${mvo.genre eq 'action'}">액션</c:when>
										<c:when test="${mvo.genre eq 'animation'}">애니메이션</c:when>
										<c:when test="${mvo.genre eq 'comedy'}">코미디</c:when>
										<c:when test="${mvo.genre eq 'documentary'}">다큐멘터리</c:when>
										<c:when test="${mvo.genre eq 'drama'}">드라마</c:when>
										<c:when test="${mvo.genre eq 'romance'}">로맨스</c:when>
										<c:when test="${mvo.genre eq 'SF'}">SF</c:when>
										<c:when test="${mvo.genre eq 'thriller'}">스릴러</c:when>
									</c:choose>
								</p>
							</div>

							<div class="m-info-items">
								<p class="m-info-item">관람등급:</p>
								<p class="m-info-item">
									<c:choose>
										<c:when test="${mvo.ageLimit < 12}">
											<img class="age" alt="" src="/resources/img/logo/all.png">
										</c:when>
										<c:when test="${mvo.ageLimit eq 12}">
											<img class="age" alt="" src="/resources/img/logo/12age.png">
										</c:when>
										<c:when test="${mvo.ageLimit eq 15}">
											<img class="age" alt="" src="/resources/img/logo/15age.png">
										</c:when>
										<c:when test="${mvo.ageLimit eq 18}">
											<img class="age" alt="" src="/resources/img/logo/18age.png">
										</c:when>
									</c:choose>
								</p>
							</div>
						</div>

						<div class="m-infoRL">
							<div class="m-info-items">
								<p class="m-info-item">연출:</p>
								<p class="m-info-item">${mvo.director}</p>
							</div>
							<div class="m-info-items">
								<p class="m-info-item">출연:</p>
								<p class="m-info-item">${mvo.actor}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="Rvisible">
				<h5 class="pb-3">
					리뷰 작성 <span class="my-goods-company"> Review Post</span>
					<img alt="" src="/resources/img/logo/bar.png" width=100% height=1px;>
				</h5>
				<input type="hidden" name="email" value="${authEmail }"> <input
					type="hidden" name="profileName" value="${profile.profileName }">
				<div class="star-rating space-x-4 mx-auto pb-3">
					<input type="radio" id="5-stars" name="rvScore" value="5"
						v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rvScore" value="4"
						v-model="ratings" /> <label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rvScore" value="3"
						v-model="ratings" /> <label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rvScore" value="2"
						v-model="ratings" /> <label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rvScore" value="1"
						v-model="ratings" /> <label for="1-star" class="star">★</label>
				</div>
				<span style="position: relative; display: block;" class="pb-3">
					<textarea rows="3" cols="6" class="my-form2" name="rvContent"
						placeholder="여러분의 소중한 리뷰를 입력해주세요"></textarea>
				</span>
				<div class="text-center pb-3">
					<button class="my-btn" id="rvPostBtn">등록하기</button>
				</div>
				<h5 class="pb-3" style="border-bottom: 1px solid silver">
					리뷰 리스트 <span class="my-goods-company">Review List</span>
				</h5>
				<ul class="list-group" id="rvListArea">
				</ul>
				<ul class="pagination justify-content-center py-5" id="rvPaging">
				</ul>
			</div>
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" style="color: black;">캐릭터 이름</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="input-group my-3">
								<input type="text" class="form-control" id="charName">
								<button class="btn btn-success" id="charReg" type="button">Post</button>
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<span id="mno" style="display: none;">${mvo.mno}</span>

<div class="my-bg footer">
	<footer class="py-3 my-4">
		<div class="text-center">
			<img class="logo" src="/resources/img/disneypluslogo.png">
			<div class="mt-3 my-i">&copy 2021 Company 3, Inc</div>
			<div class="mt-3 my-i">Spring Project | DisneyPlus Reference |
				# 3 | Joo , Lim, Kim</div>
		</div>
	</footer>
</div>
<script>
	const mno = document.getElementById("mno").innerHTML;
</script>

<script src="/resources/js/media.comment.js"></script>
<script src="/resources/js/media.watchlist.js"></script>
<script>
	getReviewList(mno);
	changeWishListBtn();
</script>
<script src="/resources/js/movies.detail.js"></script>
</body>
</html>
