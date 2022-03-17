<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disney +</title>
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/mystyle.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <script src="/resources/dist/js/bootstrap.bundle.js"></script>
    <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
  </head>
<body>

<style>
    * {
        margin-top: 100px;
        text-align: center;
        margin: 5px;
        padding: 10px;
    }
    .logo {
        width: 150px;
        height: 100px;
        text-align: center;
    }
    .my-form{
		display:inline;
		backdrop-filter: blur(50px);
	    background-color: rgb(49, 52, 62);
	    border: 1px solid transparent;
	    border-radius: 4px;
	    caret-color: rgb(2, 231, 245);
	    height: 48px;
	    margin: 0px;
	    outline: none;
	    color:white;
	    padding: 7px 12px;
	    transition: all 0.1s ease 0s;
	    width: 50%;
	}
</style>

<div>
    <a href="/"><img class="logo" src="/resources/img/disneypluslogo.png"></a>
</div>

<sec:authorize access="isAnonymous()">
<form class="form" action="/member/register" method="post">

    <div class="">
      <input type="text" name="email" id="email" class="my-form" placeholder="이메일을 입력하세요" />
    </div>
    <button type="button" class="btn btn-success" id="dupleCheck">아이디 중복확인</button>

    <div class="input-container ic2">
      <input type="password" name="pwd" id="pwd" class="my-form" maxlength="20" placeholder="비밀번호를 입력하세요" />
    </div>

    <div class="input-container ic2">
      <input type="password" id="rpwd" class="my-form" maxlength="20" placeholder="비밀번호를 입력하세요" />
      <div class="cut cut-short"></div>
      <button type="button" class="btn btn-success" id="pwdCheck">비밀번호 중복확인</button>
    </div>
    <button type="submit" class="w-50 btn btn-primary btn-lg my-5" id="regBtn" disabled>가입 완료</button>
</form>
</sec:authorize>

<script src="/resources/js/member.register.js"></script>
<jsp:include page="../common/footer.jsp" />