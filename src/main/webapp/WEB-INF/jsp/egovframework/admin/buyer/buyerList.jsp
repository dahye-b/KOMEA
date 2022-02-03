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
		document.ListForm.buyerCd.value = obj1;
		document.ListForm.action = "<c:url value='/admin/buyerView.do'/>";
		document.ListForm.submit();
	}

	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/admin/buyerList.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/admin/buyerList.do'/>";
		document.ListForm.submit();
	}

	function fn_Excel(){
		document.ListForm.action = "<c:url value='/admin/buyerListExcel.do'/>";
		document.ListForm.submit();
	}
</script>
<form:form name="ListForm" commandName="buyer" method="post">
	<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value=""/>
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>바이어관리 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select path="gb" class="form-control form-control-sm" OnChange="javascript:fn_Search('');">
					<form:option value="" label="구분"/>
					<form:option value="Association" label="Association"/>
					<form:option value="Ship Owner" label="Ship Owner"/>
					<form:option value="Shipyard" label="Shipyard"/>
					<form:option value="Trading" label="Trading"/>
				</form:select>
				<form:input path="entrpsNm" class="form-control form-control-sm" placeholder="바이어명" size="30" value="" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary mr-1">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<a href="javascript:fn_Excel();" class="btn btn-sm btn-secondary text-white" >엑셀저장</a>
					<a href="<c:url value='/admin/buyerInput.do'/>" class="btn btn-sm btn-primary text-white" >신규등록</a>
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
					<col style="width:9%;" />
					<col style="width:5%;" />
					<col style="width:13%;" />
					<col style="width:12%;" />
					<col style="width:13%;" />
					<col style="width:10%;" />
					<col style="width:13%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">바이어코드</th>
						<th scope="col">업체명</th>
						<th scope="col">국가</th>
						<th scope="col">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">홈페이지</th>
						<th scope="col">대표자</th>
					</tr>
				</thead>
				<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="buyer" items="${resultList}" varStatus="status">
								<tr>
									<td class="text-center"><c:out value="${buyer.buyerCd}" /></td>
									<td class="text-center"><a href="javascript:detail(${buyer.buyerCd})"><c:out value="${buyer.entrpsNm}" /></a></td>
									<td class="text-center"><c:out value="${buyer.nationNm}" /></td>
									<td class="text-center"><c:out value="${buyer.cttpc}" /></td>
									<td class="text-center"><c:out value="${buyer.email}" /></td>
									<td class="text-center"><c:out value="${buyer.hmpg}" /></td>
									<td class="text-center"><c:out value="${buyer.rprsntv}" /></td>
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
</div>
</div><!-- div class="content" -->
<!-- //######################################## } content 영역 끝 -->

</form:form>
		</div>
</div>
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>
