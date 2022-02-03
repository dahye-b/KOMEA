<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1){
	document.ListForm.idx.value = obj1;
	document.ListForm.action = "<c:url value='/komea/mn020201.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/komea/mn0202.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/komea/mn0202.do'/>";
	document.ListForm.submit();
}
function fn_Excel(){
	document.ListForm.action = "<c:url value='/komea/mn0202Excel.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="comp" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>회원사</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
					<div class="form-inline justify-content-end bo-search mb-10" >
						<div class="form-group" >
							<!--
								<form:select path="category" class="form-control form-control-sm"  OnChange="javascript:fn_Search();">
									<form:option value="" label="카테고리선택"/>
									<form:option value="Hul" label="Hull & ship General"/>
									<form:option value="Out" label="Outfitting"/>
									<form:option value="Eng" label="Engine & Machinery"/>
									<form:option value="Ele" label="Electric & Electronics"/>
								</form:select>
							-->
						</div>
						<div class="form-group">
								<form:select path="area" class="form-control form-control-sm"  OnChange="javascript:fn_Search();">
									<form:option value="" label="국내지역선택"/>
									<form:option value="SU" label="서울"/>
									<form:option value="SJ" label="세종"/>
									<form:option value="IN" label="인천"/>
									<form:option value="GN" label="경기도"/>
									<form:option value="GG" label="강원도"/>
									<form:option value="CB" label="층청북도"/>
									<form:option value="CN" label="충청남도"/>
									<form:option value="GW" label="대전"/>
									<form:option value="DE" label="대구"/>
									<form:option value="JB" label="전라북도"/>
									<form:option value="JN" label="전라남도"/>
									<form:option value="GZ" label="광주"/>
									<form:option value="KP" label="경상북도"/>
									<form:option value="KN" label="경상남도"/>
									<form:option value="BS" label="부산"/>
									<form:option value="JJ" label="제주도"/>
									<form:option value="US" label="울산"/>
								</form:select>
						</div>
						<div class="form-group">
								<form:input path="company" class="form-control form-control-sm" placeholder="업체명 입력" size="30" value="" />
						</div>
						<div class="form-group">
								<a href="javascript:fn_Search();" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
						</div>
						<c:if test="${authYn == 'Y'}">
						<div class="form-group">
								<a href="javascript:fn_Excel();" class="btn btn-sm btn-secondary btn-block text-white" >엑셀저장</a>
						</div>
						</c:if >
					</div>
					<!-- ##### Search Area End ##### -->

					<!-- 게시물 목록 시작 { -->
					<div class="table-responsive" >
						 <table class="table table-bordered border-top-3 table-hover text-nowrap" summary="조합원사 안내 게시판 입니다." >
					 		<caption class="d-none" >조합원사</caption>
							<thead>
								<tr>
									<th width="5%" class="td-no">No</th>
									<th width="*%" class="td-subject">업체</th>
									<th width="15%" class="td-file" >대표</th>
									<th width="20%" class="td-date td-b-hide-md" >연락처</th>
									<th width="25%" class="td-date td-b-hide-md" >홈페이지</th>
									<th width="10%" class="td-hit" >지역</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="comp" items="${resultList}" varStatus="status">
											<tr>
												<td class="td-no text-center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
												<td class="td-subject" ><c:out value="${comp.company}" /></td>
												<td class="td-file text-center"><c:out value="${comp.ceo}" /></td>
												<td class="td-date td-b-hide-md text-center"><c:out value="${comp.tel}" /> </td>
												<td class="td-date td-b-hide-md text-left"><a href="${comp.homepage}" target="_blank">${comp.homepage}</a></td>
												<td class="td-hit text-center"><c:out value="${comp.area}" /> </td>
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
					<!-- 게시물 목록 시작 { -->

					<!-- ##### Paging Area Start ##### -->
					<div class="mt-10 clearfix" >
						<nav class="table-responsive" >
							<ul class="pagination flex-wrap justify-content-center">
								<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
							</ul>
							<form:hidden path="pageIndex"/>
						</nav>
					</div>
					<!-- ##### Paging Area End ##### -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
