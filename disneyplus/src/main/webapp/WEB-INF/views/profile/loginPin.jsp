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
    a {
    	width: 10px;
    }
    input{
        width: 300px;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
        color: black;
    }
    img {
      width: 200px;
      border-radius: 70%;
    }
    button {
      border-radius: 70%;
    }
    img :hover{
      border: 5px solid #a3abcc;
    }
    .b {
      margin-top: 5%;
      margin-bottom: 8%;
    }
    .pro {
	  margin: 20px 20px;
	  margin-bottom: 4%;
      display: inline-block;
    }
    .mod {
      width: 120px;
      display:block;
      line-height:50px;
      text-align:center;
      background-color:#222;
      color:#fff;
      margin-right: 30px;
      text-decoration: none;
    }
    .mod :hover{
      color: white;
    }
    
    .key{
    	width: 40px;
    	height: 40px;
    	margin-bottom: 30px;
    }
    h3 {
    	margin-top: 20px;
    }
    h2 {
    	margin-bottom: 30px;
    }
</style>

<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
      </div>
    </div>
    <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.mvo.email" var="authEmail"/>
    <a class="mod" href="/profile/login?email=${authEmail}">취소</a>
    </sec:authorize>
</nav>
<div class="container my-5 contents-wrap">

	<div class="pro">
	   <img src="<spring:url value='${profile.icon}'/>"><br>
	   <h3>${profile.profileName}</h3>
	</div>

	<div>
		<img class="key" src="/resources/img/key.png">
	</div>
	
	<div class="input-container ic2">
	  <h2>프로필 PIN을 입력하세요</h2>
      <input type="password" name="pin" id="pin" maxlength="4" class="input"/>
      <button class="w-10 btn btn-primary btn-lg my-0" id="pinBtn" type="button">확인</button>
      <form action="/profile/login" method="post" id="pinForm">
	    <input type="hidden" name="pno" value="${profile.pno}">
	  </form>
    </div>

</div>

<script>
const pnoVal = document.querySelector('input[name=pno]').value;
</script>
<script src="/resources/js/profile.loginPin.js"></script>
</body>
</html>
