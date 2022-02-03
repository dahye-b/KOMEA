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
			<jsp:include page="/WEB-INF/include/admin-menu.html" flush="true"></jsp:include>
						<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/admin/popupList.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/admin/popupList.do'/>";
		document.ListForm.submit();
	}
	function fn_Delete(){
		document.ListForm.action = "<c:url value='/admin/DeletePopup.do'/>";
		document.ListForm.submit();
	}
</script>
<form:form name="ListForm" commandName="popup" method="post">
	<form:input type="hidden" path="popupNo" name="popupNo" id="popupNo" value=""/>
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>팝업관리 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select class="form-control form-control-sm mr-1" path="searchCondition">
					<form:option value="" label="--- 선택 ---"/>
					<form:option value="0" label="제목"/>
					<form:option value="1" label="내용"/>
				</form:select>
				<form:input type="text" path="searchKeyword" class="form-control form-control-sm mr-1" placeholder="검색어" size="10" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary mr-1">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<a href="<c:url value='/admin/popupInput.do'/>" class="btn btn-sm btn-primary text-white" >신규등록</a>
				</div>
			</div>
		</form>

	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<!-- 게시물 읽기 시작 { -->
	<div class="table-responsive text-nowrap">
		<div class="table-responsive">
			<table class="table table-bordered" summary="회원관리 자료">
				<colgroup>
					<col style="width:*%;" />
					<col style="width:13%;" />
					<col style="width:13%;" />
					<col style="width:13%;" />
					<col style="width:13%;" />
					<col style="width:5%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">시작일</th>
						<th scope="col">종료일</th>
						<!--<th scope="col">가로</th>
						<th scope="col">세로</th>
						<th scope="col">내용</th>-->
						<th scope="col">설명</th>
						<th scope="col">게시여부</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="popup" items="${resultList}" varStatus="status">
								<tr>
									<td class="text-center"><c:out value="${popup.subject}" /></td>
									<td class="text-center"><c:out value="${popup.startDt}" /></td>
									<td class="text-center"><c:out value="${popup.endDt}" /></td>
									<td class="text-center"><c:out value="${popup.description}" /></td>
									<td class="text-center"><c:out value="${popup.openYn}" /></td>
									<td class="text-center">
										<c:choose>
											<c:when test="${popup.deleteYn eq 'N'}">
												<a href="javascript:fn_Delete(${popup.popupNo})" class="btn btn-sm btn-primary text-white">삭제</a>
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
									<td class="text-center" colspan="6">조회된 결과가 없습니다.</td>
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
