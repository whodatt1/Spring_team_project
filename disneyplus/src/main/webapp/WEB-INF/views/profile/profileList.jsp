<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
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
<body>
<style>
    *{
        text-align: center;
        color: #fff;
    }
    .icon {
    	width: 10px;
    }
    img {
      width: 200px;
      height: 200px;
      border-radius: 70%;
    }
    button {
    	border-radius: 70%;
    }
    .icon :hover{
      border: 3px solid #a3abcc;
    }
    .b {
      margin-top: 5%;
      margin-bottom: 8%;
    }
    .pro {
	  margin: 20px 20px;
	  margin-bottom: 8%;
      display: inline-block;
    }
    .mod {
      width: 120px;
      display:block;
      line-height:50px;
      text-align:center;
      background-color:#0072d2;
      color:#fff;
      margin-right: 30px;
      text-decoration: none;
    }
    .mod :hover{
      color: white;
    }
    p {
		font-family: SeolSans-Medium,sans-serif;
		font-size: 24px;
	    font-weight: 500;
	    line-height: 1.3;
    }
    .key{
    	width: 40px;
    	height: 40px;
    }
    .flex{
    	align-items: flex-start;
    	display:flex;
    	justify-content: center;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="height: 71px">
      <a class="navbar-brand" href="/"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown"></div>
    </div>
    <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.mvo.email" var="authEmail"/>
    <a class="mod" href="/profile/login?email=${authEmail}">완료</a>
    </sec:authorize>
</nav>
  <div class="container my-5 contents-wrap">

    <div class="b">
        <h2>프로필 수정</h2><br>
        <h4>수정할 프로필을 선택하세요</h4>
    </div>
    
    <div class="flex">
    <c:forEach items="${profile}" var="pvo" >
        <div class="pro">
            <a class="icon" href="/profile/modify?pno=${pvo.pno}">
            <img src="<spring:url value='${pvo.icon}'/>"></a><br>
            <p>${pvo.profileName}<img style="margin-left: 8px; width: 15px; height: 15px;" src="<spring:url value='/resources/img/mod.png'/>"></p>
            <c:if test="${pvo.locked > 0}">
            <div class="img_no"><img class="key" src="/resources/img/key.png"></div>
            </c:if>
        </div>
 	</c:forEach>
 	
 	<c:if test="${mvo.profileLimit != 0}">
	 	<div class="pro">
		   	<a class="icon" href="/profile/selectIcon">
		   	<img src="<spring:url value='/resources/img/profileplus.png'/>"></a><br>
		   	<p>프로필 추가</p>
		   	<div class="img_no"></div>
	    </div>
    </c:if>
</div>
</div>
</body>
</html>
