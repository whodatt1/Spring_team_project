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
      border: 5px solid #a3abcc;
    }
    .b {
      margin-top: 10%;
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
      background-color:#222;
      color: white;
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

<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="height: 71px">
      <img class="logo" src="/resources/img/disneypluslogo.png">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
      </div>
    </div>
    <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.mvo.email" var="authEmail"/>
    <a class="mod" href="/profile/profileList?email=${authEmail}">프로필 수정</a>
    </sec:authorize>
</nav>
  <div class="container my-5 contents-wrap">

    <div class="b">
        <h2>어느 프로필로 시청하시겠어요?</h2>
    </div>
    
  <div class="flex">  
    <c:forEach items="${profile}" var="pvo" varStatus="status">
    	
	    <c:choose>
			<c:when test="${pvo.locked > 0 }">
			    <div class="pro">
			      <a class="icon" href="/profile/loginPin?pno=${pvo.pno}">
			      <img src="<spring:url value='${pvo.icon}'/>"></a><br>
			      <p>${pvo.profileName}</p>
			      <div class="img_no"><img class="key" src="/resources/img/key.png"></div>
			    </div>
		    </c:when>
		    
		    <c:otherwise>
		    	<div class="pro">
		    	  <form action="/profile/login" method="post" id="loginForm${status.count}">
		    	  	<input type="hidden" name="pno" value="${pvo.pno}">
		    	  	<a class="icon"><img id="icon" src="<spring:url value='${pvo.icon}'/>"></a><br>
		    	  </form>
			      <p>${pvo.profileName}</p>
			      <div class="img_no"></div>
			    </div>
		    </c:otherwise>
	    </c:choose>  
	    
 	</c:forEach>
 	
 	<c:if test="${mvo.profileLimit != 0}">
	 	<div class="pro">
		   	<a class="icon" href="/profile/selectIcon">
		   	<img src="<spring:url value='/resources/img/profileplus.png'/>"></a><br>
		   	<p>프로필 추가</p>
	    </div>
	</c:if>
</div>
</div>
<script src="/resources/js/profile.login.js"></script>
</body>
</html>
