<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <style>
    *{
        text-align: center;
    }
    .loginlogo {
        width: 150px;
        height: 100px;
        margin-bottom: 50px;
    }
    input{
        width: 400px;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
    }
    .btn {
    	width: 400px;
    	margin-top: 50px;
    }
    .bot {
    	margin-bottom: 12%;
    }
	</style>
</head>
  
<body>

<main class="form-signin">

<a href="/"><img class="loginlogo" src="/resources/img/disneypluslogo.png" style="margin-top: 5%;"></a>

  <form action="/member/login" method="post">
    
    <h1 class="h3 mb-3">이메일 주소로 로그인하세요</h1>

    <div class="form-floating">
        <input type="email" class="" name="email" id="" placeholder="이메일" value="">
    </div>
    <br>
    <div class="form-floating mb-3">
      <label for="floatingPassword"></label>
      <input type="password" class="" name="pwd" id="floatingPassword" maxlength="20" placeholder="비밀번호">
    </div>
	<c:if test="${not empty errMsg}">
	    <div class="text-danger">
	      <c:choose>
	      	<c:when test="${errMsg eq 'Bad credentials'}">
	      		<c:set var="errText" value="이메일 혹은 비밀번호가 일치하지 않습니다"/>
	      	</c:when>
	      	<c:otherwise>
	      		<c:set var="errText" value="관리자에게 문의하세요"/>
	      	</c:otherwise>
	      </c:choose>
	      ${errText}
	    </div>
    </c:if>
    <button class="w-20 btn btn-lg btn-primary" style="margin-bottom: 1%;" type="submit">로그인</button>
    <div class="bot">
    	<span>디즈니+에 처음이신가요? </span><a href="/member/register">가입하기</a>
    </div>	
  </form>
</main>

  <div class="my-bg">
  <footer class="py-3 my-4">
      <div class="text-center">
        <img class="logo" src="/resources/img/disneypluslogo.png">
        <div class="mt-3 my-i">&copy 2021 Company 3, Inc</div>
        <div class="mt-3 my-i">Spring Project | DisneyPlus Reference | # 3 | codingman875@gmail.com</div>
      </div>
  </footer>
  </div>
<script>
let reg = '<c:out value="${reg}"/>';
if (parseInt(reg)) {
	alert('회원 가입 완료');
}
</script>
</body>
</html>