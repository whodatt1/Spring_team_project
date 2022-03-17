<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAnonymous()">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disney +</title>
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/mystyle.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="/resources/dist/js/bootstrap.bundle.js"></script>
</head>

<body class="my-home-bgi">

  <div style="float: right;" class="m-5">
    <a href="/member/login" class="my-btn p-4" style="text-decoration: none;">로그인</a>
    <a href="/member/register" class="my-btn p-4" style="text-decoration: none;">회원가입</a>
  </div>
  
<div class="my-bg my-footer">
  <footer class="py-3 my-4">
    <div class="text-center">
      <img class="logo" src="/resources/img/disneypluslogo.png">
      <div class="mt-3 my-i">&copy 2021 Company 3, Inc</div>
      <div class="mt-3 my-i">Spring Project | DisneyPlus Reference | # 3 | codingman875@gmail.com</div>
    </div>
  </footer>
</div>
<script>
let removeMember = '<c:out value="${removeMember}"/>';
if (parseInt(removeMember)) {
	alert('회원 탈퇴 완료');
}
</script>
</body>
</html>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.authList" var="auths"/>
<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN') || authVO.auth.equals('ROLE_USER')).get()}">
<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />

<div id="body-wrapper">
	<div id="body-content">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="/resources/img/carousel/1.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="/resources/img/carousel/2.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/3.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/4.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/5.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/6.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/7.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/8.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/9.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/10.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/11.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/12.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/13.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/14.jpg" class="d-block w-100"
						alt="..." />
				</div>
				<div class="carousel-item">
					<img src="/resources/img/carousel/15.jpg" class="d-block w-100"
						alt="..." />
				</div>

				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>


		<div class="home-company">

			<a href="/brand/disney" class="company" style="background-image:url(/resources/img/logo/disney.png);">
			</a>
			
			<a href="/brand/pixar" class="company" style="background-image:url(/resources/img/logo/pixar.png);" >
			</a>
			
			<a href="/brand/marvel" class="company" style="background-image:url(/resources/img/logo/marvel.png);">
			</a>
			
			<a href="/brand/starwars" class="company" style="background-image:url(/resources/img/logo/starwars.png);">
				
			</a>
			<a href="/brand/national" class="company" style="background-image:url(/resources/img/logo/national.png);">
				
			</a>
			<a href="/brand/stars" class="company" style="background-image:url(/resources/img/logo/star.png);">
				
			</a>
		</div>
	</div>
</div>

<jsp:include page="common/footer.jsp" />
</c:if>
</sec:authorize>