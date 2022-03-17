<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />

 <style>
 	.form {
        margin-top: 100px;
        margin: 5px;
        padding: 10px;
    }
    input{
        color: white;
        width: 400px;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(49, 52, 62);
    }
    .w-btn-blue {
	    width: 400px;
	    background-color: #0072d2;
	    color: #d4dfe6;
	}
	img {
      width: 200px;
      border-radius: 70%;
    }
    .title {
    	margin-left: 150px;
    	font-size: 30px;
    }
    .king {
	    width: 1200px;
	    margin: 0 auto;
	    position: relative;
	    padding-top: 150px;
	}
    .king :after{
    	display: block;
    	content: '';
    	clear: both;
    }
    .first {
    	width: 600px;
    	text-align: right;
    	float: left;
    	padding-right: 30px;
    }
    .second {
	    width: 600px;
	    text-align:left;
    	float: right;
    }
    .input-container {
    	margin-bottom: 20px;
    }
   	.wd400 {
	    max-width: none;
	    height: 40px;
	    width: 400px;
	    color: #f9f9f9;
	    padding: 9px 12px;
	    font-size: 13px;
	    line-height: 15px;
	    font-weight: 400;
	    border-color: #f9f9f9;
	    background-color: rgba(0,0,0,.8);
	    border-radius: 4px;
	    cursor: pointer;
	    vertical-align: middle;
	    text-align: center;
	    display: inline-flex;
	    justify-content: center;
	    align-items: center;
	    transition: all .2s ease 0s;
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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown"></div>
    </div>
    <a class="mod" href="/profile/login?email=${authEmail}">취소</a>
</nav>

<div class="king">

<div class="protitle">프로필 추가</div>

<div class="first">

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.email" var="authEmail"/>

<form class="form" action="/profile/register" method="post">
	<input type="hidden" name="email" value="${authEmail}" />
	<input type="hidden" name="icon" value="${icon}">
	<div>
	    <div class="input-container ic1">
	      <input type="text" name="profileName" id="pName" class="input" placeholder="프로필 이름" />
	    </div>
	
	    <div class="input-container ic2">
	      <input type="text" name="kids" id="kids" class="input" placeholder="키즈 나이" />
	    </div>
	</div>
	   
    <button type="button" id="regBtn" class="w-btn w-btn-blue">저장</button>
</form>

</sec:authorize>	
</div>

<div class="second">
	<div class="input-container ic2">
       <img src="<spring:url value='${icon}'/>">
    </div>
</div> 
</div>
<script src="/resources/js/profile.register.js"></script>