<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Workdetail(obj1, obj2){
	document.ListForm.code.value = obj1;
	document.ListForm.gubun.value = obj2;
	document.ListForm.action = "<c:url value='/show/ReqBizWorkView.do'/>";
	document.ListForm.submit();
}
function fn_Detail(obj1, obj2){
	document.ListForm.code.value = obj1;
	document.ListForm.gubun.value = obj2;
	document.ListForm.action = "<c:url value='/show/ReqBizFormView.do'/>";
	document.ListForm.submit();
}
function fn_Edit(obj1, obj2){
	var actionUrl;
	
	if(obj2 == "0"){
		actionUrl = "<c:url value='/show/ReqBizExbiEdit.do'/>";
	}else{
		actionUrl = "<c:url value='/show/ReqBizCnsltEdit.do'/>";
	}
	document.ListForm.code.value = obj1;
	document.ListForm.gubun.value = obj2;
	document.ListForm.action = actionUrl;
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/ReqBizList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/ReqBizList.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="code" name="code" id="code" value=""/>
	<form:input type="hidden" path="gubun" name="gubun" id="gubun" value=""/>
	<form:input type="hidden" path="entrprsMberCd" name="entrprsMberCd" id="entrprsMberCd" value="${loginInfo.mberCd}"/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>사업참여관리</h2>
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
									<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="행사명" size="30" value=""/>
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
						 <table class="table table-bordered border-top-3 table-hover" summary="사업참여관리 게시판 입니다." >
					 		<caption class="d-none" >사업참여관리</caption>
							<thead>
								<tr>
									<th width="5%" class="td-hide-md"><strong>구분</strong></th>
									<th width="*%" class="td-b-hide-sm"><strong>전시회명 및 개최기간</strong></th>
									<th width="13%" class="td-hide-md"><strong>등록일</strong></th>
									<th width="13%" class="td-hide-md"><strong>참가지원기관</strong></th>
									<th width="10%" class="td-hide-md"><strong>선정여부</strong></th>
									<th width="10%" class="td-hide-md"><strong>신청서</strong></th>
									<th width="5%" class="td-hide-md"><strong>진행현황</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md">
													<c:choose>
													<c:when test="${resultList.gubun eq '0'}">
													[전시]
													</c:when>
													<c:otherwise>
													[상담]
													</c:otherwise>
													</c:choose>
												</td>
												<td class="td-b-hide-sm">
													<fmt:parseDate value="${resultList.fromDate}" var="fromDate" pattern="yyyyMMdd"/>
													<fmt:parseDate value="${resultList.closeDate}" var="closeDate" pattern="yyyyMMdd"/>
													<a href="javascript:fn_Workdetail('${resultList.code}','${resultList.gubun}');" class="text-16"><c:out value="${resultList.name}" /></a><br/>
														[ <fmt:formatDate value="${fromDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${closeDate}" pattern="yyyy.MM.dd"/> ] 
												</td>
												<td class="text-center td-hide-md"><c:out value="${resultList.registDate}" /></td>
												<td class="text-center td-hide-md"><c:out value="${resultList.insttNm}" /></td>
												<td class="text-center td-hide-md ">
													<c:choose>
													<c:when test="${resultList.slctnTypeNm eq '완료'}">
														<span class="btn btn-xs btn-primary rounded-1">${resultList.slctnTypeNm}</span>
													</c:when>
													<c:when test="${resultList.slctnTypeNm eq '진행'}">
														<span class="btn btn-xs btn-success rounded-1">${resultList.slctnTypeNm}</span>
													</c:when>
													<c:when test="${resultList.slctnTypeNm eq '선정'}">
														<span class="btn btn-xs btn-info rounded-1">${resultList.slctnTypeNm}</span>
													</c:when>
													<c:otherwise>
														<span class="btn btn-xs btn-secondary rounded-1">${resultList.slctnTypeNm}</span>
													</c:otherwise>
													</c:choose>
												</td>
												<td class="text-center td-hide-md">
													<c:choose>
													<c:when test="${resultList.slctnTypeNm eq '진행'}">
														<a href="javascript:fn_Edit('${resultList.code}','${resultList.gubun}')" class="btn btn-sm btn-warning text-white">수정</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:fn_Detail('${resultList.code}','${resultList.gubun}')" class="btn btn-sm btn-success text-white">보기</a>
													</c:otherwise>
													</c:choose>
												</td>
												<td class="text-center td-hide-md">
													<c:choose>
													<c:when test="${resultList.eventGb eq '1' && resultList.progrsSttus eq '3' && resultList.buttonStat eq 'ER' && resultList.slctnType eq 'Y'}">
														<span class="btn btn-xs btn-warning rounded-1">사업결과</span>
													</c:when>
													<c:when test="${resultList.eventGb eq '1' && resultList.progrsSttus eq '3' && resultList.buttonStat eq 'AR' && resultList.slctnType eq 'Y'}">
														<span class="btn btn-xs btn-warning rounded-1">사후성과</span><br/> 
														<span class="btn btn-xs btn-info rounded-1">스케줄</span>
													</c:when>
													<c:otherwise>
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