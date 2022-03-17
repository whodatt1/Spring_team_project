<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<style>
	* {
		color: white;
	}
</style>
<div class="container my-3">
	<h2>사용자 가입 현황</h2>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">순번</th>
	      <th scope="col">아이디</th>
	      <th scope="col">등급</th>
	      <th scope="col">가입 날짜</th>
	      <th scope="col">마지막 로그인</th>
	      <th scope="col">프로필 갯수</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${list}" var="mvo" varStatus="status">
		    <tr>
		      <td>${status.count}</td>
		      <th scope="row">${mvo.email}</th>
		      <td>${mvo.grade > 100 ? '관리자' : '일반회원'} </td>
		      <td>${mvo.regAt}</td>
		      <td>${mvo.lastLogin}</td>
		      <td>${mvo.profileLimit}</td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>
<jsp:include page="../common/footer.jsp" />
