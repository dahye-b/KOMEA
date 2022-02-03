<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
//일정등록 화면으로 이동
function fn_InputResultFile(obj1, obj2, obj3){
	document.ListForm.mberCd.value = obj1;
	document.ListForm.registNo.value = obj2;
	document.ListForm.bbscttNo.value = obj3;
	document.ListForm.action = "<c:url value='/show/ReqBiddingResultFile.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/ReqBiddingList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/ReqBiddingList.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value=""/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
	<form:input type="hidden" path="bbscttNo" name="bbscttNo" id="bbscttNo" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>참여입찰관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
					<div class="card search-tabs rounded-0 mb-30">
						<div class="card-block bg-light">
				
							<div class="form-inline justify-content-end bo-search px-15 py-15" >
								<div class="form-group" >
									<form:radiobutton path="gb" value="9" label="전체" OnClick="javascript:fn_Search('');"/>
									<form:radiobutton path="gb" value="0" label="전시" OnClick="javascript:fn_Search('');"/>
									<form:radiobutton path="gb" value="1" label="상담" OnClick="javascript:fn_Search('');"/>
								</div>
								<div class="form-group">
									<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="입찰내용" size="30" value=""/>
								</div>
								<div class="form-group">
									<form:input path="fromDate" class="form-control form-control-sm datepicker" onChange="formatDate('fromDate');" placeholder="기간시작일자" size="10" value=""/>
									<form:input path="closeDate" class="form-control form-control-sm datepicker" onChange="formatDate('closeDate');" placeholder="기간마감일자" size="10" value=""/>
								</div>
								<div class="form-group">
									<a href="javascript:fn_Search('');" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
								</div>
							</div>

						</div>
					</div>
					<!-- /form -->
					<!-- ##### Search Area End ##### -->

					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="상담문의 게시판 입니다." >
					 		<caption class="d-none" >상담문의</caption>
							<thead>
								<tr>
									<th width="5%" class="td-hide-md"><strong>구분</strong></th>
									<th width="*%" class="td-b-hide-sm"><strong>입찰내용</strong></th>
									<th width="13%" class="td-hide-md"><strong>신청일</strong></th>
									<th width="13%" class="td-hide-md"><strong>참가지원기관</strong></th>
									<th width="13%" class="td-hide-md"><strong>진행사항</strong></th>
									<th width="13%" class="td-hide-md"><strong>일정등록</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md">
													<c:choose>
													<c:when test="${resultList.eventGb eq '0'}">
													[전시]
													</c:when>
													<c:otherwise>
													[상담]
													</c:otherwise>
													</c:choose>
												</td>
												<td class="td-b-hide-sm">
													<fmt:parseDate value="${resultList.etc4}" var="toDate" pattern="yyyyMMdd"/>
													<c:out value="${resultList.sj}" /><br/>
													<c:out value="${resultList.fromDate}" /> ~ <fmt:formatDate value="${toDate}" pattern="yyyy-MM-dd"/>
												</td>
												<td class="text-center td-hide-md"><c:out value="${resultList.registDate}" /></td>
												<td class="text-center td-hide-md"><c:out value="${resultList.insttNm}" /></td>
												<td class="text-center td-hide-md ">
													<c:choose>
													<c:when test="${resultList.biddingStatusNm eq '선정'}">
														<span class="btn btn-xs btn-primary rounded-1" style="cursor:default;">${resultList.biddingStatusNm}</span>
													</c:when>
													<c:otherwise>
														<span class="btn btn-xs btn-secondary rounded-1" style="cursor:default;">${resultList.biddingStatusNm}</span>
													</c:otherwise>
													</c:choose>
												</td>
												<td class="text-center td-hide-md">
													<c:if test="${resultList.biddingStatusNm eq '선정'}">
														<a href="javascript:fn_InputResultFile('${resultList.mberCd}','${resultList.registNo}','${resultList.bbscttNo}');" class="btn btn-xs btn-info rounded-1" >일정등록</a>
													</c:if>
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

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>