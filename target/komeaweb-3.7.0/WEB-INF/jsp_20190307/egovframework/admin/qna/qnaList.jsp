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
function detail(obj1, obj2, obj3, obj4, obj5){
	document.ListForm.bCode.value = obj1;
	document.ListForm.idx.value = obj2;
	document.ListForm.block.value = obj3;
	document.ListForm.rlevel.value = obj4;
	document.ListForm.boss.value = obj5;
	document.ListForm.action = "<c:url value='/admin/bbsView.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/admin/bbsList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/admin/bbsList.do'/>";
	document.ListForm.submit();
}
</script>
<form:form name="ListForm" commandName="bbs" method="post">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>게시판관리 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select class="form-control form-control-sm mr-1" path="bCode" OnChange="javascript:fn_Search();">
					<form:option value="" label="--- 선택 ---"/>
					<form:option value="B001" label="공지사항"/>
					<form:option value="B002" label="간행물"/>
					<form:option value="B007" label="Komea뉴스레터"/>
					<form:option value="B008" label="Komea영문뉴스레터"/>
					<form:option value="B009" label="보도자료"/>
					<form:option value="B010" label="사업공고"/>
					<form:option value="B011" label="열린제안"/>
				</form:select>
				<form:input type="text" path="searchKeyword" class="form-control form-control-sm" placeholder="검색어" size="30" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-sm btn-secondary text-white" >목록</a>
					<a href="<c:url value='/admin/bbsInput.do'/>" class="btn btn-sm btn-primary text-white">신규등록</a>
				</div>
			</div>
		</form>

	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<!-- 게시물 읽기 시작 { -->
	<div class="table-responsive text-nowrap">
		<div class="table-responsive">
			<table class="table table-bordered" summary="게시판관리 자료">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:55%;" />
					<col style="width:15%;" />
					<col style="width:7%;" />
					<col style="width:7%;" />
					<col style="width:11%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="td-no" >No.</th>
						<th scope="col" class="td-subject">제목</th>
						<th scope="col" class="td-writer" >작성자</th>
						<th scope="col" class="td-hit" >조회수</th>
						<th scope="col" class="td-date" >작성일</th>
					</tr>
				</thead>
				<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="resultList" items="${resultList}" varStatus="status">
								<tr>
									<td class="text-center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
									<td class="td-subject"><a href="javascript:detail('${resultList.bCode}',${resultList.idx},${resultList.block},${resultList.rlevel},${resultList.boss});"><c:out value="${resultList.title}" /></a></td>
									<td class="text-center"><c:out value="${resultList.uName}" /></td>
									<td class="text-center"><c:out value="${resultList.cnt}" /> </td>
									<td class="text-center"><c:out value="${resultList.indate}" /></td>
								</tr>
								</c:forEach>    
							</c:when>
							<c:otherwise>
								<tr>
									<td class="text-center" colspan="5">조회된 결과가 없습니다.</td>
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
