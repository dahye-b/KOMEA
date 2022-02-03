<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/BestCompManage.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	document.ListForm.action = "<c:url value='/show/BestCompManage.do'/>";
	document.ListForm.submit();
}
//상세정보
function detail(obj1, obj2){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	document.ListForm.action = "<c:url value='/show/BestCompManage.do'/>";
	document.ListForm.submit();
}
//선정 업데이트
function fn_ChangeStatus(obj1, obj2, obj3, obj4){
	document.ListForm.registNo.value = obj1;
	document.ListForm.bbscttNo.value = obj2;
	document.ListForm.mberCd.value = obj3;
	document.ListForm.winnerStatus.value = obj4;
	document.ListForm.action = "<c:url value='/show/UpdateWinnerStatus.do'/>";
	document.ListForm.submit();
}
//삭제
function fn_Delete(obj1, obj2, obj3){
	document.ListForm.registNo.value = obj1;
	document.ListForm.bbscttNo.value = obj2;
	document.ListForm.mberCd.value = obj3;
	if(confirm("삭제 하시겠습니까? \n삭제 시 모든 내용이 삭제됩니다.")) {
		document.ListForm.action = "<c:url value='/show/DeleteBestCompanyRequest.do'/>";
		document.ListForm.submit();
	}
}
//우수기업선정 결과확인
function fn_BestCompResultComplete(){

	var val = document.ListForm.registNo.value;

	$.ajax({
		url : "/show/SelectBestCompStatus.do",
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
//우수기업선정결과 완료 처리
function fn_FixBestComp(val){
	$.ajax({
		url : "/show/UpdateBestCompResultComplete.do", 
		type : "POST",  
		data : "registNo="+val,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("우수기업선정을 완료 하였습니다.");
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
<form:input type="hidden" name="bbsTy" path="bbsTy" id="bbsTy" value="6"/>
<form:input type="hidden" name="bbscttNo" path="bbscttNo" id="bbscttNo" value=""/>
<form:input type="hidden" name="mberCd" path="mberCd" id="mberCd" value=""/>
<form:input type="hidden" name="winnerStatus" path="winnerStatus" id="winnerStatus" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>우수기업선정관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-30 bo-l">

					<!-- ##### Search Area Start ##### -->
					<div class="form-inline justify-content-end bo-search" >
						<div class="form-group" >
							<!-- form:select class="dpi sel136 mgR4" path="code" id="code" name="code" OnChange="javascript:fn_Search();" -->
							<form:select class="form-control form-control-sm" path="registNo" id="registNo" name="registNo" OnChange="javascript:fn_Search();">
										<form:option value=""><c:out value="----- 우수기업선정내용 선택 -----" /></form:option>
								<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
									<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
								</c:forEach>
							</form:select>
						</div>
						<div class="form-group">
							<form:input path="searchKeyword" class="form-control form-control-sm" placeholder="행사명" size="15" value=""/>
						</div>
						<div class="form-group">
							<a href="javascript:fn_Search('');" class="btn btn-sm btn-secondary btn-block text-white" >검색</a>
						</div>
					</div>
					<!-- ##### Search Area End ##### -->

					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="우수기업선정관리 게시판 입니다." >
					 		<caption class="d-none" >우수기업선정관리</caption>
							<thead>
								<tr>
									<th width="10%" class="td-hide-md">순번</th>
									<th width="*%" class="">업체명</th>
									<th width="15%" class="td-hide-sm">대표자</th>
									<th width="15%" class="td-hide-md">연락처</th>
									<th width="15%" class="">선정여부</th>
									<th width="10%" class="">&nbsp;</th>
								</tr>
							</thead>
						<tbody>
						<c:choose>
							<c:when test="${fn:length(resultList) > 0}">
								<c:forEach var="resultList" items="${resultList}" varStatus="status">
									<tr>
										<td class="text-center td-hide-md"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
										<td class=""><a href="javascript:detail();" class="text-16"><c:out value="${resultList.cmpnyNm}" /></a></td>
										<td class="text-center td-hide-sm"><c:out value="${resultList.rprsntv}" /></td>
										<td class="text-center td-hide-sm"><c:out value="${resultList.telno}" /></td>
										<td class="text-center">
											<c:choose>
												<c:when test="${resultList.winnerStatus == '1'}">
													<input type="radio" id="slctnYn" value="1" checked OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 선정
													<input type="radio" id="slctnYn" value="2" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
												</c:when>
												<c:when test="${resultList.winnerStatus == '2'}">
													<input type="radio" id="slctnYn" value="1" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 선정
													<input type="radio" id="slctnYn" value="2" checked OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
												</c:when>
												<c:otherwise>
													<input type="radio" id="slctnYn" value="1" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '1');"/> 선정
													<input type="radio" id="slctnYn" value="2" OnChange="javascript:fn_ChangeStatus('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}', '2');"/> 탈락
												</c:otherwise>
											</c:choose>
										</td>											
										<td class="text-center">
											<a href="javascript:fn_Delete('${resultList.registNo}','${resultList.bbscttNo}','${resultList.mberCd}');" class="btn btn-xs btn-warning wd-60" >삭제</a>
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
			<div class="mb-1 clearfix" >
				<nav>
					<ul class="pagination flex-wrap justify-content-center" >
						<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
					</ul>
					<form:hidden path="pageIndex"/>
				</nav>
			</div>
			<!-- ##### Paging Area End ##### -->

		</div>
		
		<div class="section-text col-12 mb-100 bo-v">
			
			<!-- 버튼 시작 { -->
			<div class="clearfix text-right mb-1" >
					<a href="javascript:fn_BestCompResultComplete();" class="btn btn-sm btn-primary" role="button">우수기업선정결과완료</a>
			</div>
			<!-- } 버튼 끝 -->

            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
