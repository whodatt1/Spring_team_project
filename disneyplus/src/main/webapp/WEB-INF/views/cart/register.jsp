<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="register my-5 contents-wrap">
<h1 class="py-3">굿즈 구매</h1>
<form action="/cart/register" method="post" accept-charset="utf-8">
<input type="hidden" name="gno" value="${gdto.gvo.gno }">
<input type="hidden" name="goodsImg" value="${gdto.gvo.goodsImg }">
<input type="hidden" name="company" value="${gdto.gvo.company }">
<input type="hidden" name="kinds" value="${gdto.gvo.kinds }">
<span style="position: relative; display: block;" class="mb-3">
	<label for="gname" class="mb-3">굿즈 이름</label>
	<input type="text" id="gname" class="my-form" name="gname" value="${gdto.gvo.gname }" readonly>
</span>
<span style="position: relative; display: block;" class="mb-3">
<sec:authentication property="principal.mvo.email" var="authEmail"/>
	<label for="email" class="mb-3">이메일</label>
	<input type="text" id="email" class="my-form" name="email" value="${authEmail }" readonly>
</span>
<span style="position: relative; display: block;" class="mb-3">
	<label for="profileName" class="mb-3">프로필 이름</label>
	<input type="text" id="profileName" class="my-form" name="profileName" value="${profile.profileName }" readonly>
</span>
<div class="row">
<span style="position: relative; display: inline-block;" class="mb-3 col-md-6">
	<label for="purCount" class="mb-3">구입 개수</label>
	<input class="my-form" id="purCount" name="purchaseCount" value="${purchaseCount }" readonly>
</span>
<span style="position: relative; display: inline-block;" class="mb-3 col-md-6">
	<label for="toPrice" class="mb-3">총 가격</label>
	<input class="my-form" id="toPrice" name="totalPrice" value="${totalPrice }" readonly>
</span>
</div>
<span style="position: relative;" class="mb-3 col-md-6">
	<label for="sample3_address" class="mb-3">주소</label>
	<input class="my-form mb-3" type="text" id="sample5_address" name="address" placeholder="주소" required>
	<input type="button" class="my-btn" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
</span>
<button class="my-btn my-5 w-100" id="regBtn"
			type="submit">등록하기</button>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6223ffceeffbe85538c17cbf79ea364d&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476),
            level: 5
        };

    var map = new daum.maps.Map(mapContainer, mapOption);
    var geocoder = new daum.maps.services.Geocoder();
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address;

                document.getElementById("sample5_address").value = addr;
                geocoder.addressSearch(data.address, function(results, status) {
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0];

                        var coords = new daum.maps.LatLng(result.y, result.x);
                        mapContainer.style.display = "block";
                        map.relayout();
                        map.setCenter(coords);
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<jsp:include page="../common/footer.jsp" />