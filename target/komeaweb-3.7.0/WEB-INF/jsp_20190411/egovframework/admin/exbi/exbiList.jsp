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
		var pop_title = "ExbiView";
		var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=no,width=1000,height=800";
		window.open("", pop_title, status);

		document.ListForm.code.value = obj1;
		document.ListForm.target = pop_title;
		document.ListForm.action = "<c:url value='/show/DisplayView.do'/>";
		document.ListForm.submit();
	}

	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/admin/exbiList.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/admin/exbiList.do'/>";
		document.ListForm.submit();
	}
	
	function UpdateSlctn(obj1, obj2, obj3, obj4){
		document.ListForm.gubun.value = obj1;
		document.ListForm.insttMberCd.value = obj2;
		document.ListForm.code.value = obj3;
		document.ListForm.slctnYn.value = obj4;
		document.ListForm.action = "<c:url value='/admin/UpdateExbi.do'/>";
		document.ListForm.submit();		
	}
</script>
<form:form name="ListForm" commandName="exbi" method="post">
	<form:input type="hidden" path="gubun" name="gubun" id="gubun" value=""/>
	<form:input type="hidden" path="code" name="code" id="code" value=""/>
	<form:input type="hidden" path="exbiCd" name="exbiCd" id="exbiCd" value=""/>
	<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value=""/>
	<form:input type="hidden" path="slctnYn" name="slctnYn" id="slctnYn" value=""/>
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>사업관리 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select class="form-control form-control-sm mr-1" path="searchCondition">
					<form:option value="" label="--- 선택 ---"/>
					<form:option value="0" label="아이디"/>
					<form:option value="1" label="회사/기관명"/>
					<form:option value="2" label="대표성명"/>
				</form:select>
				<form:input type="text" path="searchKeyword" class="form-control form-control-sm mr-1" placeholder="검색어" size="10" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary mr-1">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
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
					<col style="width:5%;" />
					<col style="width:5%;" />
					<col style="width:15%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:15%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:12%;" />
					<col style="width:12%;" />
					<col style="width:12%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상태</th>
						<th scope="col">승인</th>
						<th scope="col">전시회명</th>
						<th scope="col">시작일</th>
						<th scope="col">종료일</th>
						<th scope="col">장소</th>
						<th scope="col">접수시작</th>
						<th scope="col">접수종료</th>
						<th scope="col">담당자</th>
						<th scope="col">연락처</th>
						<th scope="col">이메일</th>
					</tr>
				</thead>
				<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="exbi" items="${resultList}" varStatus="status">
								<tr>
									<td class="text-center"><c:out value="${exbi.progrsSttus}" /></td>
									<td class="text-center">
									<c:choose>
										<c:when test="${exbi.slctnYn eq 'N'}">
											<a href="javascript:UpdateSlctn('${exbi.gubun}','${exbi.insttMberCd}','${exbi.exbiCd}','Y')" class="btn btn-sm btn-primary text-white">승인</a>
										</c:when>
										<c:when test="${exbi.slctnYn eq 'Y'}">
											<a href="javascript:UpdateSlctn('${exbi.gubun}','${exbi.insttMberCd}','${exbi.exbiCd}','N')" class="btn btn-sm btn-secondary text-white">승인취소</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:UpdateSlctn('${exbi.gubun}','${exbi.insttMberCd}','${exbi.exbiCd}','Y')" class="btn btn-sm btn-primary text-white">승인</a>
										</c:otherwise>
									</c:choose>
									</td>
									<td class="text-center">
										<a href="javascript:detail('${exbi.exbiCd}');" class="text-16"><c:out value="${exbi.exbiNm}" /></a>
									</td>
									<td class="text-center">
										<fmt:parseDate value="${exbi.opmtBeginDe}" var="opmtBeginDe" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${opmtBeginDe}" pattern="yyyy.MM.dd"/>
									</td>
									<td class="text-center">
										<fmt:parseDate value="${exbi.opmtClosDe}" var="opmtClosDe" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${opmtClosDe}" pattern="yyyy.MM.dd"/>
									</td>
									<td class="text-center"><c:out value="${exbi.opmtPlace}" /></td>
									<td class="text-center">
										<fmt:parseDate value="${exbi.rceptBeginDe}" var="rceptBeginDe" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${rceptBeginDe}" pattern="yyyy.MM.dd"/>
									</td>
									<td class="text-center">
										<fmt:parseDate value="${exbi.rceptClosDe}" var="rceptClosDe" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${rceptClosDe}" pattern="yyyy.MM.dd"/>
									</td>
									<td class="text-center"><c:out value="${exbi.chargerNm}" /></td>
									<td class="text-center"><c:out value="${exbi.chargerTlphon}" /></td>
									<td class="text-center"><c:out value="${exbi.chargerEmail}" /></td>
								</tr>
								</c:forEach>    
							</c:when>
							<c:otherwise>
								<tr>
									<td class="text-center" colspan="11">조회된 결과가 없습니다.</td>
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
