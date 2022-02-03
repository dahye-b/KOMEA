<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
<div class="wrapper wrapper-full-page">
	<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
	<div class="main-panel">
		<jsp:include page="/WEB-INF/include/admin-menu.jsp" flush="true"></jsp:include>
	
<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
function fn_Save(){
	document.Form.action = "<c:url value='/admin/InsertMber.do'/>";
	document.Form.submit();
}
function fn_IdCheck(){
	if(document.Form.id.value == ""){
		alert("아이디를 입력하세요.");
		return;
	}
	document.Form.action = "<c:url value='/admin/mberInput.do'/>";
	document.Form.submit();
}
</script>

<div class="content">
<div class="container_fluid">

	<form:form name="Form" commandName="mber" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
		<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>

		<c:set var="ssbyp" value="${ssbyp}"/>

		<c:choose>
			<c:when test="${ssbyp eq '1'}"><!-- 기관회원 -->
				<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/admin/mber/orgRegistForm.jsp" />
			</c:when>
			<c:when test="${ssbyp eq '2'}"><!-- 기업회원 -->
				<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/admin/mber/compRegistForm.jsp" />
			</c:when>
			<c:otherwise><!-- 기타 -->
				<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/admin/mber/othersRegistForm.jsp" />
			</c:otherwise>
		</c:choose>

	    <!-- 게시물 상단 버튼 시작 { -->
	    <div class="clearfix mb-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/mberList.do'/>" class="btn btn-sm btn-secondary text-white">목록</a>
	            <a href="javascript:fn_Save();" class="btn btn-sm btn-primary text-white">저장</a>
	        </div>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->

		<!-- } 게시판 쓰기 끝 -->

	</form:form>
						
</div><!-- div class="container_fluid" -->
</div><!-- div class="content" -->

<!-- //######################################## } content 영역 끝 -->

<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>