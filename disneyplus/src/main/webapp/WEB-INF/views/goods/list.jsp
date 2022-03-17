<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="container my-5 contents-wrap">
<h1 class="py-3">굿즈 
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.authList" var="auths"/>
<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
<a href="/goods/register" class="my-btn" style="text-decoration:none;">굿즈 등록</a>
</c:if>
</sec:authorize>
</h1>
<div class="row">
<div class="col-md-2 p-3 my-bg">
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#disney-collapse" aria-expanded="true">
        	디즈니 <span class="my-goods-company">Disney</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="disney-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=disney">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=disney&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=disney&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=disney&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=disney&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=disney&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
      	
    	<li class="border-top my-3"></li>
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#pixar-collapse" aria-expanded="false">
          	픽사 <span class="my-goods-company">Pixar</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="pixar-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=pixar">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=pixar&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=pixar&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=pixar&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=pixar&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=pixar&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
    	<li class="border-top my-3"></li>
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#marvel-collapse" aria-expanded="false">
          	마블 <span class="my-goods-company">Marvel</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="marvel-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=marvel">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=marvel&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=marvel&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=marvel&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=marvel&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=marvel&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
    	<li class="border-top my-3"></li>
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#starwars-collapse" aria-expanded="false">
          	스타워즈 <span class="my-goods-company">Starwars</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="starwars-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=starwars">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=starwars&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=starwars&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=starwars&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=starwars&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=starwars&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
    	<li class="border-top my-3"></li>
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#national-collapse" aria-expanded="false">
          	내셔널지오그래픽 <span class="my-goods-company">National Geographic</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="national-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=national">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=national&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=national&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=national&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=national&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=national&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
    	<li class="border-top my-3"></li>
      <li class="mb-1">
        <h5 style="cursor: pointer;" data-bs-toggle="collapse" data-bs-target="#star-collapse" aria-expanded="false">
          	스타 <span class="my-goods-company">Star</span><span id="my-more" class="my-more"><i class="fas fa-chevron-down"></i></span>
        </h5>
        	<div class="collapse" id="star-collapse">
	        	<ul class="list-unstyled pb-1">
            		<li><a class="my-a" href="/goods/list?company=star">전체</a></li>
            		<li><a class="my-a" href="/goods/list?company=star&kinds=tshirt">티셔츠</a></li>
	            	<li><a class="my-a" href="/goods/list?company=star&kinds=cap">캡</a></li>
            		<li><a class="my-a" href="/goods/list?company=star&kinds=tumbler">텀블러</a></li>
            		<li><a class="my-a" href="/goods/list?company=star&kinds=sticker">스티커</a></li>
            		<li><a class="my-a" href="/goods/list?company=star&kinds=poster">포스터</a></li>
          		</ul>
        	</div>
      	</li>
    	<li class="border-top my-3"></li>
    </ul>
  </div>
  <div class="col-md-10">
  	<div class="row">
  		<div class="text-center mb-3" id="goodsLogo" style="background-color: white; line-height: 150px; vertical-align: middle;"></div>
  		<c:forEach items="${list }" var="gvo">
  		<div class="col-md-3">
  			<div class="card my-bg" style="width: 13rem;">
  				<a href="/goods/detail?gno=${gvo.gno }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&company=${gvo.company}&kinds=${gvo.kinds}"><img src="../../../../fileUpload/${gvo.goodsImg }" class="card-img-top"></a>
  				<div class="card-body">
  					<div class="py-1" style="font-weight: bold;">${gvo.company eq 'disney' ? '디즈니' : gvo.company eq 'pixar' ? '픽사' : gvo.company eq 'marvel' ? '마블' : gvo.company eq 'starwars' ? '스타워즈' : gvo.company eq 'national' ? '내셔널지오그래픽' : '스타'} > ${gvo.kinds eq 'tshirt' ? '티셔츠' : gvo.kinds eq 'cap' ? '캡' : gvo.kinds eq 'tumbler' ? '텀블러' : gvo.kinds eq 'sticker' ? '스티커' : '포스터' }</div>
    				<div><a class="my-a" href="/goods/detail?gno=${gvo.gno }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&company=${gvo.company}&kinds=${gvo.kinds}">${gvo.gname } [${gvo.cmtQty }]</a></div>
    				<div style="font-weight: bold;">${gvo.price }원</div>
  				</div>
			</div>
  		</div>
  		</c:forEach>
  		<ul class="pagination justify-content-center py-5">
			<c:if test="${pgn.prev }">
		    <li class="page-item">
		      <a href="/goods/list?pageNo=${pgn.startPage -1 }&qty=${pgn.pgvo.qty}&company=${pgn.pgvo.company}${pgn.pgvo.kinds eq '' || pgn.pgvo.kinds eq null ? '' : '&kinds='}${pgn.pgvo.kinds}" class="page-link">Prev</a>
		    </li>
		    </c:if>
		    <c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
		    <li class="page-item ${pgn.pgvo.pageNo eq i ? 'active' : ''}"
		     aria-current="page">
		      <a class="page-link" href="/goods/list?pageNo=${i }&qty=${pgn.pgvo.qty}&company=${pgn.pgvo.company}${pgn.pgvo.kinds eq '' || pgn.pgvo.kinds eq null ? '' : '&kinds='}${pgn.pgvo.kinds}">${i }</a>
		    </li>
		    </c:forEach>
		    <c:if test="${pgn.next }">
		    <li class="page-item">
		      <a class="page-link" href="/goods/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&company=${pgn.pgvo.company}${pgn.pgvo.kinds eq '' || pgn.pgvo.kinds eq null ? '' : '&kinds='}${pgn.pgvo.kinds}">Next</a>
		    </li>
		    </c:if>
		</ul>
  	</div>
  </div>
</div>
<script>
let isUp = '<c:out value="${isUp}"/>';
let isDel = '<c:out value="${isDel}"/>';
if (parseInt(isUp)) {
	alert('굿즈 등록 성공');
}
if (parseInt(isDel)) {
	alert('굿즈 삭제 성공');
}
</script>
<script src="/resources/js/goods.list.js"></script>
<jsp:include page="../common/footer.jsp" />