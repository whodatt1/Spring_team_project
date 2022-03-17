<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="register my-5 contents-wrap">
<h1 class="py-3">구매 목록</h1>
<table class="table table-hover">
	<thead>
		<tr>
			<th style="color: white;"></th>
			<th style="color: white;">상품 이름</th>
			<th style="color: white;">주소</th>
			<th style="color: white;">주문 개수</th>
			<th style="color: white;">가격</th>
			<th style="color: white;">주문 취소</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list }" var="cvo">
		<tr>
			<td style="color: white;"><a href="/goods/detail?gno=${cvo.gno }&company=${cvo.company}&kinds=${cvo.kinds}"><img src="../../../../fileUpload/${cvo.goodsImg }" style="width: 80px; height: 96px;"></a></td>
			<td style="color: white; vertical-align: center;"><a style="text-decoration: none; color:white;" href="/goods/detail?gno=${cvo.gno }&company=${cvo.company}&kinds=${cvo.kinds}">${cvo.gname }</a></td>
			<td style="color: white; vertical-align: center;">${cvo.address }</td>
			<td style="color: white; vertical-align: center;">${cvo.purchaseCount }</td>
			<td style="color: white; vertical-align: center;">${cvo.totalPrice }</td>
			<td style="color: white; vertical-align: center;"><a class="my-btn" data-cno=${cvo.cno } style="text-decoration: none; color:white;" id="delBtn">주문 취소</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<sec:authentication property="principal.mvo.email" var="authEmail"/>
<ul class="pagination justify-content-center py-5">
			<c:if test="${pgn.prev }">
		    <li class="page-item">
		      <a href="/goods/cart?pageNo=${pgn.startPage -1 }&qty=${pgn.pgvo.qty}&email=${authEmail}&profileName=${profile.profileName}" class="page-link">Prev</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
		    <li class="page-item ${pgn.pgvo.pageNo eq i ? 'active' : ''}"
		     aria-current="page">
		      <a class="page-link" href="/cart/list?pageNo=${i }&qty=${pgn.pgvo.qty}&email=${authEmail}&profileName=${profile.profileName}">${i }</a>
		    </li>
		    </c:forEach>
		    <c:if test="${pgn.next }">
		    <li class="page-item">
		      <a class="page-link" href="/cart/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&email=${authEmail}&profileName=${profile.profileName}">Next</a>
		    </li>
		    </c:if>
		</ul>
		
<form action="/cart/remove" method="post" id="delForm">
	<input type="hidden" name="cno" value="">
	<input type="hidden" name="pageNo" value="${pgn.pgvo.pageNo }">
	<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
	<input type="hidden" name="email" value="${authEmail} ">
	<input type="hidden" name="profileName" value="${profile.profileName }">
</form>
<script src="/resources/js/cart.list.js"></script>
<script>
let isMod = '<c:out value="${isReg}"/>';
let isDel = '<c:out value="${isDel}"/>';
if (parseInt(isMod)) {
	alert('구매가 완료되었습니다');
} else if (parseInt(isDel)) {
	alert('구매가 취소되었습니다');
}
</script>
<jsp:include page="../common/footer.jsp" />