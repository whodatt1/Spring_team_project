<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />

<style>
   img {
      width: 200px;
      border-radius: 70%;
    }
    .icon :hover{
      border: 5px solid #a3abcc;
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
</style>
<sec:authentication property="principal.mvo.email" var="authEmail"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
      </div>
    </div>
    <a class="mod" href="/profile/login?email=${authEmail}">취소</a>
</nav>

<div>

   <div>
      <h1>아이콘 선택</h1>
      <br>
   </div>
   
   <div>
      <h2>디즈니</h2>
      <c:forEach var="i" begin="1" end="15">
      <a class="icon" href="/profile/register?icon=/resources/image/disney${i}.png">
      <img src="<spring:url value='/resources/image/disney${i}.png'/>"></a>
      </c:forEach>
   </div>
   
   <div>
      <h2>마블</h2>
      <c:forEach var="i" begin="1" end="15">
      <a class="icon" href="/profile/register?icon=/resources/image/marvel${i}.png">
      <img src="<spring:url value='/resources/image/marvel${i}.png'/>"></a>
      </c:forEach>
   </div>
   
   <div>
      <h2>심슨 가족</h2>
      <c:forEach var="i" begin="1" end="8">
      <a class="icon" href="/profile/register?icon=/resources/image/simpsons${i}.png">
      <img src="<spring:url value='/resources/image/simpsons${i}.png'/>"></a>
      </c:forEach>
   </div>
   
</div>   
<jsp:include page="../common/footer.jsp" />