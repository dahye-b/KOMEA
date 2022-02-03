<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1, obj2, obj3){
	document.ListForm.mberCd.value = obj1;
	document.ListForm.registNo.value = obj2;
	document.ListForm.bbscttNo.value = obj3;
	document.ListForm.action = "<c:url value='/show/BiddingAppManageView.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/BiddingAppManage.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	document.ListForm.action = "<c:url value='/show/BiddingAppManage.do'/>";
	document.ListForm.submit();
}
//선정 업데이트
function fn_ChangeStatus(obj1, obj2, obj3, obj4){
	document.ListForm.registNo.value = obj1;
	document.ListForm.bbscttNo.value = obj2;
	document.ListForm.mberCd.value = obj3;
	document.ListForm.biddingStatus.value = obj4;
	document.ListForm.action = "<c:url value='/show/UpdateBiddingStatus.do'/>";
	document.ListForm.submit();
}
//입찰선정 결과확인
function fn_BiddingResultComplete() {

	var val = document.ListForm.registNo.value;

	$.ajax({
		url : "/show/SelectBiddingStatus.do",
		type : "POST",
		data : "registNo="+val,
		success : function(data) {
		
			var totalCnt = data.reqCnt + data.winCnt + data.rejCnt;

			// 승인된 건이 한건도 없거나, 미승인건이 있는지 체크하여 처리
			if(totalCnt ==  0 ) {
				alert("신청된 건수가 하나도 없습니다. 신청 건수를 확인해 주세요.");
				return ;
			} else if(data.reqCnt > 0 ) {
				alert("선정 되지 않은 정보("+data.reqCnt+"건)가 있습니다. \n선정된 정보를 확인해 주세요.");
				return ;
			} else if(data.winCnt <= 0 ) {
				alert("선정된 정보가 없습니다. 선정정보를 확인해 주세요.");
				return ;
			}  else {
				// 우수기업선정결과 완료 처리
        		// 우수기업선정공고에 결과내용을 수정한다.
				fn_FixBestComp(val);
			}
		}
	});
}
//입찰선정결과 완료 처리
function fn_FixBestComp(val){
	$.ajax({
		url : "/show/UpdateResultComplete.do", 
		type : "POST",  
		data : "registNo="+val,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("입찰결과선정을 완료 하였습니다.");
				location.reload();
			}
		},
		error:function(request,status,er){
			var errorMsg= "요청 도중 오류가 발생하였습니다.\n";
			
			if(request.status == 0){errorMsg+="네트워크 연결을 확인해주십시오.";}
			else if(request.status == 401){errorMsg+="권한이 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 403){errorMsg+="접근이 거부되었습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 404){errorMsg+="요청한 페이지를 찾을 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 500){errorMsg+="서버 내 오류가 발생하였습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'parsererror'){errorMsg+="응답 본문을 정상적으로 가져올 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'timeout'){errorMsg+="응답 제한 시간을 초과하였습니다. 다시 조회해 주세요";}
			else {errorMsg+="관리자에게 문의해주세요.";}
			alert(errorMsg);
		}
	});
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="bbsTy" path="bbsTy" id="bbsTy" value="2"/>
<form:input type="hidden" name="bbscttNo" path="bbscttNo" id="bbscttNo" value=""/>
<form:input type="hidden" name="mberCd" path="mberCd" id="mberCd" value=""/>
<form:input type="hidden" name="biddingStatus" path="biddingStatus" id="biddingStatus" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>입찰신청관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
						<div class="form-inline justify-content-end bo-search mb-30" >
							<div class="form-group" >
								<form:select class="form-control form-control-sm" path="registNo" id="registNo" name="registNo" OnChange="javascript:fn_Search();">
										<form:option value=""><c:out value="----- 입찰내용 선택 -----" /></form:option>
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
							<div class="form-group">
								<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="행사명" size="30" value=""/>
							</div>
							<div class="form-group">
								<a href="javascript:fn_Search('');" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
							</div>
						</div>
					<!-- /form -->
					<!-- ##### Search Area End ##### -->
					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="입찰신청관리 게시판 입니다." >
					 		<caption class="d-none" >입찰신청관리</caption>
							<thead>
								<tr>
									<th width="10%" class="td-hide-md"><strong>순번</strong></th>
									<th width="15%" class="td-hide-md"><strong>구분</strong></th>
									<th width="*%" class="td-b-hide-sm"><strong>업체명</strong></th>
									<th width="15%" class="td-hide-md"><strong>대표자</strong></th>
									<th width="15%" class="td-hide-md"><strong>연락처</strong></th>
									<th width="15%" class="td-hide-md"><strong>승인여부</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
												<td class="text-center td-hide-sm">
													<c:if test="${resultList.eventGb eq '0'}">전시</c:if>
													<c:if test="${resultList.eventGb eq '1'}">상담</c:if>
												</td>
												<td class="td-b-hide-sm"><a href="javascript:detail('${resultList.mberCd}','${resultList.registNo}','${resultList.bbscttNo}');" class="text-16"><c:out value="${resultList.cmpnyNm}" /></a></td>
												<td class="text-center td-hide-sm"><c:out value="${resultList.rprsntv}" /></td>
												<td class="text-center td-hide-sm"><c:out value="${resultList.telno}" /></td>
												<td class="text-center td-hide-md">
													<c:choose>
														<c:when test="${resultList.biddingStatus == '1'}">
															<input type="radio" id="slctnYn" value="1" checked OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 승인
															<input type="radio" id="slctnYn" value="2" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
														</c:when>
														<c:when test="${resultList.biddingStatus == '2'}">
															<input type="radio" id="slctnYn" value="1" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 승인
															<input type="radio" id="slctnYn" value="2" checked OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
														</c:when>
														<c:otherwise>
															<input type="radio" id="slctnYn" value="1" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 승인
															<input type="radio" id="slctnYn" value="2" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
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
					<div class="mb-10">
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
								<a href="javascript:fn_BiddingResultComplete();" class="btn btn-sm btn-primary" role="button">입찰결과완료</a>
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
