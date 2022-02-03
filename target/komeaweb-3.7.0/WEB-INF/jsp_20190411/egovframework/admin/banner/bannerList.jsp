<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
		<div class="wrapper ">
		<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
				<div class="main-panel">
			<jsp:include page="/WEB-INF/include/admin-menu.jsp" flush="true"></jsp:include>
						<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
	function detail(obj1){
		document.ListForm.bannerNo.value = obj1;
		document.ListForm.action = "<c:url value='/admin/bannerView.do'/>";
		document.ListForm.submit();
	}

	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/admin/bannerList.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/admin/bannerList.do'/>";
		document.ListForm.submit();
	}

	function fn_Delete(obj1){
		document.ListForm.bannerNo.value = obj1;
		document.ListForm.action = "<c:url value='/admin/DeleteBanner.do'/>";
		document.ListForm.submit();
	}
</script>
<form:form name="ListForm" commandName="banner" method="post">
	<form:input type="hidden" path="bannerNo" name="bannerNo" id="bannerNo" value=""/>
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>배너관리 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:input type="text" path="searchKeyword" class="form-control form-control-sm mr-1" placeholder="배너명" size="10" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary mr-1">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<a href="<c:url value='/admin/bannerInput.do'/>" class="btn btn-sm btn-primary text-white" >신규등록</a>
				</div>
			</div>
		</form>

	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<!-- 게시물 읽기 시작 { -->
	<div>
		<div class="table-responsive text-nowrap">
			<table class="table table-bordered" summary="회원관리 자료">
				<colgroup>
					<col style="width:13%;" />
					<col style="width:13%;" />
					<col style="width:15%;" />
					<col style="width:5%;" />
					<col style="width:5%;" />
					<col style="width:*%;" />
					<col style="width:5%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">배너구분</th>
						<th scope="col">배너</th>
						<th scope="col">배너설명</th>
						<th scope="col">배너순서</th>
						<th scope="col">사용여부</th>
						<th scope="col">링크</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="banner" items="${resultList}" varStatus="status">
							<tr>
								<td class="text-center"><c:out value="${banner.bannerGb}" /></td>
								<td class="text-center"><img src="${banner.bannerFilePath}" /></td>
								<td class="text-center"><c:out value="${banner.bannerDesc}" /></td>
								<td class="text-center"><c:out value="${banner.bannerSort}" /></td>
								<td class="text-center"><c:out value="${banner.bannerUseYn}" /></td>
								<td class="text-center"><a href="${banner.bannerLink}" target="_blank"><c:out value="${banner.bannerLink}" /></a></td>
								<td class="text-center">
									<c:choose>
										<c:when test="${banner.bannerUseYn eq 'Y'}">
											<a href="javascript:fn_Delete(${banner.bannerNo})" class="btn btn-sm btn-primary text-white">삭제</a>
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>    
						</c:when>
						<c:otherwise>
							<tr>
								<td class="text-center" colspan="7">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<!-- } 게시판 목록 끝 -->
	<!-- 페이징 -->
	<div class="my-3 clearfix" >
		<nav>
			<ul class="pagination justify-content-center">
			<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
			<form:hidden path="pageIndex"/>
			</ul>
		</nav>
	</div>
	<!-- 페이징 -->
</form:form>
	</div>
</div>
<!-- //######################################## } content 영역 끝 -->
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>
