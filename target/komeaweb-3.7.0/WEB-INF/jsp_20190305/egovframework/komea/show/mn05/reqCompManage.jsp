<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/ReqCompManage.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/ReqCompManage.do'/>";
	document.ListForm.submit();
}
//상세정보
function detail(obj1, obj2, obj3){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	document.ListForm.entrprsMberCd.value=obj3;
	document.ListForm.action = "<c:url value='/show/ReqCompManageView.do'/>";
	document.ListForm.submit();
}
//진행사항 업데이트
function fn_ChangeStatus(obj1, obj2, obj3){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	document.ListForm.progrsSttus.value = obj3;
	document.ListForm.action = "<c:url value='/show/UpdateProgressStatus.do'/>";
	document.ListForm.submit();
}
//선정완료
function fn_WinCmpl() {
	if(document.ListForm.gubun.value == ""){
		alert("행사구분을 선택해주세요!");
		return;
	}
	if(document.ListForm.code.value == ""){
		alert("행사명을 선택해주세요!");
		return;
	}
	document.ListForm.action = "<c:url value='/show/UpdateWinCmpl.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" path="entrprsMberCd" name="entrprsMberCd" id="entrprsMberCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>참가신청업체</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
						<div class="form-inline justify-content-end bo-search" >
							<div class="form-group" >
								<form:radiobutton path="gubun" value="0" label="전시" OnClick="javascript:fn_Search();"/>
								<form:radiobutton path="gubun" value="1" label="상담" OnClick="javascript:fn_Search();"/>
							</div>
							<div class="form-group" >
								<form:select class="form-control form-control-sm" path="code" id="code" name="code" OnChange="javascript:fn_Search();">
									<form:option value=""><c:out value="----- 행사내용 선택 -----" /></form:option>
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
							<!--
							<div class="form-group">
								<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="행사명" size="30" value=""/>
							</div>
							-->
							<div class="form-group">
								<a href="javascript:fn_Search('');" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
							</div>
						</div>
					<!-- /form -->
					<!-- ##### Search Area End ##### -->
					
					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="참가신청업체 게시판 입니다." >
					 		<caption class="d-none" >참가신청업체</caption>
							<thead>
								<tr>
									<th width="10%" class="td-hide-md"><strong>순번</strong></th>
									<th width="*%" class=""><strong>업체명</strong></th>
									<th width="15%" class="td-hide-sm"><strong>주소</strong></th>
									<th width="15%" class="td-hide-md"><strong>연락처</strong></th>
									<th width="15%" class="td-hide-md"><strong>홈페이지</strong></th>
									<th width="10%" class=""><strong>승인여부</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
												<td class=""><a href="javascript:detail('${resultList.gubun}','${resultList.code}','${resultList.entrprsMberCd}');" class="text-16"><c:out value="${resultList.cmpnyNm}" /></a></td>
												<td class="text-left td-hide-sm"><c:out value="${resultList.locplc}" /></td>
												<td class="text-center td-hide-md"><c:out value="${resultList.telno}" /></td>
												<td class="td-hide-md"><a href="${resultList.hmpgUrl}" class="text-16" target="_blank"><c:out value="${resultList.hmpgUrl}" /></a></td>
												<td class="text-center">
													<c:choose>
														<c:when test="${resultList.progrsSttus == '4'}">
															<a href="javascript:showReportResult('');" class="text-16">사업 결과 보고</a>
														</c:when>
														<c:when test="${resultList.progrsSttus == '5'}">
															<a href="javascript:showScoreResult('');" class="text-16">사후 성과 보고</a>
														</c:when>
														<c:when test="${resultList.winnerStatus == '3'}">
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${resultList.slctnYn == 'Y'}">
																	<input type="radio" id="slctnYn" value="Y" checked OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','Y');"/> 선정
																	<input type="radio" id="slctnYn" value="N" OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','N');"/> 탈락
																</select>
																</c:when>
																<c:when test="${resultList.slctnYn == 'N'}">
																	<input type="radio" id="slctnYn" value="Y" OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','Y');"/> 선정
																	<input type="radio" id="slctnYn" value="N" checked OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','N');"/> 탈락
																</c:when>
																<c:otherwise>
																	<input type="radio" id="slctnYn" value="Y" OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','Y');"/> 선정
																	<input type="radio" id="slctnYn" value="N" OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}','N');"/> 탈락
																</c:otherwise>
															</c:choose>
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
<!--
btn-warning : 노랑
btn-primary : 파랑
btn-success : 초록
btn-secondary : 회색
btn-danger : 빨강
btn-info : 에메랄드
-->
					<!-- ##### Paging Area Start ##### -->
					<div class="mb-1" >
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
									<!-- 
										<a href="javascript:showResultResearch();" class="btn btn-sm btn-secondary" role="button">사업결과분석</a>
										<a href="javascript:showAfterResultResearch();" class="btn btn-sm btn-secondary" role="button">사후성과분석</a>
									 -->
									</div>
							</div>
							<div class="col-sm-6 text-right" >
								<!--<a href="/sub.4.5.4.view.jsp" class="btn btn-sm btn-danger" role="button">신청(예시)</a>-->
								<a href="javascript:fn_WinCmpl();" class="btn btn-sm btn-primary" role="button">선정완료</a>
								<!--
								<a href="javascript:showResultResearch();" class="btn btn-sm btn-secondary" role="button">매칭확인</a>
								<a href="javascript:showAfterResultResearch();" class="btn btn-sm btn-secondary" role="button">바이어매칭</a>
								-->
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
