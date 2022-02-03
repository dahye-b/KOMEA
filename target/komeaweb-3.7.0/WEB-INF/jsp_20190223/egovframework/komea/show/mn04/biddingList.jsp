<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj){
	document.ListForm.registNo.value = obj;
	document.ListForm.action = "<c:url value='/show/InfoCenter/View.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/InfoCenter/List.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/InfoCenter/List.do'/>";
	document.ListForm.submit();
}
function fn_Write(){
	document.ListForm.action = "<c:url value='/show/InfoCenter/Write.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="now"/>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="2"/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>입찰공고</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
						<div class="form-inline justify-content-end bo-search mb-10" >
							<div class="form-group" >
								<form:select path="searchCondition" class="form-control form-control-sm" >
									<form:option value="9" label="전체"/>
									<form:option value="0" label="작성자"/>
									<form:option value="1" label="제목"/>
									<form:option value="2" label="내용"/>
								</form:select>
							</div>
							<div class="form-group">
								<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="검색어 입력" size="30" value="" />
							</div>
							<div class="form-group">
								<a href="javascript:fn_Search();" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
							</div>
						</div>
					<!-- /form -->
					<!-- ##### Search Area End ##### -->

					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="입찰공고 게시판 입니다." >
					 		<caption class="d-none" >입찰공고</caption>
							<thead>
								<tr>
									<th width="5%" class="td-hide-md"><strong>번호</strong></th>
									<th width="20%" class="td-b-hide-sm"><strong>행사내용</strong></th>
									<th width="20%" class="td-hide-md"><strong>작성자</strong></th>
									<th width="20%" class="td-hide-md"><strong>상태</strong></th>
									<th width="15%" class="td-hide-md"><strong>등록일</strong></th>
									<th width="10%" class="td-hide-md"><strong>조회</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">

										<c:choose>
											<c:when test="${resultList.etc1 eq '0'}">
												<c:set var="statCls" value="ing state"/>
												<c:set var="etc1Str" value="진행"/>
											</c:when>
											<c:otherwise>
												<c:set var="statCls" value="end state"/>
												<c:set var="etc1Str" value="완료"/>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${now > resultList.etc4}">
												<c:set var="statCls" value="end state"/>
												<c:set var="etc1Str" value="완료"/>
											</c:when>
											<c:otherwise>
												<c:set var="statCls" value="ing state"/>
												<c:set var="etc1Str" value="진행"/>
											</c:otherwise>
										</c:choose>

											<tr>
												<td class="text-center td-hide-md"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
												<td class="td-b-hide-sm"><a href="javascript:detail('${resultList.registNo}');" class="text-16"><c:out value="${resultList.sj}" /></a></td>
												<td class="text-center td-hide-md"><c:out value="${resultList.wrterNm}" /></td>
												<td class="text-center td-hide-md"><c:out value="${statCls}" /><c:out value="${etc1Str}" /></td>
												<td class="text-center text-nonowrap td-hide-md">
													<fmt:parseDate value="${resultList.writngDe}" var="writngDe" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${writngDe}" pattern="yyyy.MM.dd"/>
												</td>
												<td class="text-center text-nonowrap td-hide-md">
													<fmt:formatNumber value="${resultList.rdcnt}" type="number"/>
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

					<!-- ##### Paging Area Start ##### -->
					<div>
						<nav>
							<ul class="pagination flex-wrap justify-content-center">
								<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
							</ul>
							<form:hidden path="pageIndex"/>
						</nav>
					</div>
					<!-- ##### Paging Area End ##### -->
					<div class="row" >
							<!-- 버튼 시작 { -->
							<div class="col-sm-6" >
							<div class="btn-group btn-group-justified">
							</div>
							</div>
							<div class="col-sm-6 text-right" >
								<a href="javascript:fn_Write();" class="btn btn-sm btn-primary" role="button">글쓰기</a>
							</div>
							<!-- } 버튼 끝 -->
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
