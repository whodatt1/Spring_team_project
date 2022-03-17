<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<div class="my-5 contents-wrap">