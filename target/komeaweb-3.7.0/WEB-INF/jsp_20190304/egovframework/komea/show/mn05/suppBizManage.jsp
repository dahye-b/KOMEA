<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/SuppBizManage.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	if(obj != ""){
		document.ListForm.progrsSttus.value=obj;
	}else{
		document.ListForm.progrsSttus.value="";
	}
	document.ListForm.pageIndex.value = "1";
	document.ListForm.action = "<c:url value='/show/SuppBizManage.do'/>";
	document.ListForm.submit();
}
//상세정보
function detail(obj1, obj2){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	document.ListForm.action = "<c:url value='/show/SuppBizManageView.do'/>";
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
//삭제
function fn_Delete(obj1, obj2){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	if(confirm("삭제 하시겠습니까? \n삭제 시 모든 내용이 삭제됩니다.")) {
		document.ListForm.action = "<c:url value='/show/DeleteBusiness.do'/>";
		document.ListForm.submit();
	}
}
//입력화면이동
function fn_Write(obj){
	if(obj == "0"){
		document.ListForm.action = "<c:url value='/show/suppBizManageExbiWrite.do'/>";
	}else{
		document.ListForm.action = "<c:url value='/show/suppBizManageCnsltWrite.do'/>";
	}
	document.ListForm.submit();
}
//수정화면이동
function fn_Modify(obj1, obj2){
	document.ListForm.code.value = obj1;
	document.ListForm.gubun.value = obj2;
	
	if(obj2 == "0"){
		document.ListForm.action = "<c:url value='/show/suppBizManageExbiEdit.do'/>";
	}else{
		document.ListForm.action = "<c:url value='/show/suppBizManageCnsltEdit.do'/>";
	}
	document.ListForm.submit();
}
//지난행사이동
function fn_Move(obj1, obj2){
	document.ListForm.gubun.value = obj2;
	
	if(obj2 == "0"){
		document.ListForm.action = "<c:url value='/show/suppBizManageExbiMove.do'/>";
		document.ListForm.exbiCd.value = obj1;
	}else{
		document.ListForm.action = "<c:url value='/show/suppBizManageCnsltMove.do'/>";
		document.ListForm.cnsltexhbCd.value = obj1;
	}
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="code" path="code" id="code" value=""/>
<form:input type="hidden" name="gubun" path="gubun" id="gubun" value=""/>
<form:input type="hidden" name="progrsSttus" path="progrsSttus" id="progrsSttus" value=""/>
<form:input type="hidden" name="insttMberCd" path="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" name="exbiCd" path="exbiCd" id="exbiCd" value=""/>
<form:input type="hidden" name="cnsltexhbCd" path="cnsltexhbCd" id="cnsltexhbCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>지원사업관리</h2>
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
							
					<div class="bo-category mb-10" >
						<ul class="nav">
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == null || progrsSttus == ''}"><a class="nav-link active" href="javascript:fn_Search('')">전체</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search()">전체</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '0'}"><a class="nav-link active" href="javascript:fn_Search('0')">예정</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('0')">예정</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '1'}"><a class="nav-link active" href="javascript:fn_Search('1')">모집중</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('1')">모집중</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '2'}"><a class="nav-link active" href="javascript:fn_Search('2')">사업진행</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('2')">사업진행</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '4'}"><a class="nav-link active" href="javascript:fn_Search('4')">사업결과</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('4')">사업결과</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '5'}"><a class="nav-link active" href="javascript:fn_Search('5')">사후성과</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('5')">사후성과</a></c:otherwise>
								</c:choose>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${progrsSttus == '3'}"><a class="nav-link active" href="javascript:fn_Search('3')">사업완료</a></c:when>
									<c:otherwise><a class="nav-link" href="javascript:fn_Search('3')">사업완료</a></c:otherwise>
								</c:choose>
							</li>
						</ul>
					</div>							
					<!-- /form -->
					<!-- ##### Search Area End ##### -->

					<div class="table-responsive text-nowrap">
						 <table class="table table-bordered border-top-3 table-hover" summary="지원사업관리 게시판 입니다." >
					 		<caption class="d-none" >지원사업관리</caption>
							<thead>
								<tr>
									<th width="10%" class="td-hide-md"><strong>구분</strong></th>
									<th width="*%" class="td-b-hide-sm"><strong>행사명 및 기간</strong></th>
									<th width="15%" class="td-hide-md"><strong>등록일</strong></th>
									<th width="15%" class="td-hide-sm td-b-hide-md"><strong>참가지원기관</strong></th>
									<th width="15%" class="td-hide-md"><strong>진행사항</strong></th>
									<th width="15%" class="td-hide-md"><strong>수정</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md">
													<c:choose>
														<c:when test="${resultList.gubun == '0'}">전시</c:when>
														<c:when test="${resultList.gubun == '1'}">상담</c:when>
														<c:otherwise>-</c:otherwise>
													</c:choose>
												</td>
												<td class="td-b-hide-sm">
													<fmt:parseDate value="${resultList.fromDate}" var="fromDate" pattern="yyyyMMdd"/>
													<fmt:parseDate value="${resultList.closeDate}" var="closeDate" pattern="yyyyMMdd"/>
													<a href="javascript:detail('${resultList.gubun}','${resultList.code}');" class="text-16"><c:out value="${resultList.name}" /></a><br/>
													[ <fmt:formatDate value="${fromDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${closeDate}" pattern="yyyy.MM.dd"/> ]
												</td>
												<td class="text-center td-hide-md"><c:out value="${resultList.registDate}" /></td>
												<td class="text-center td-hide-sm"><c:out value="${resultList.insttNm}" /></td>
												<td class="text-center td-hide-md">
													<c:choose>
														<c:when test="${resultList.progrsSttusNm == '신청'}">
															<span class="btn btn-xs btn-primary rounded-1" style="cursor:default;" >${resultList.progrsSttusNm}</span>
															<!-- <a OnClick="javascript:fn_Delete('${resultList.gubun}','${resultList.code}');">삭제</a> -->
														</c:when>
														<c:when test="${resultList.progrsSttusNm == '탈락'}">
															<span class="btn btn-xs btn-secondary rounded-1" style="cursor:default;" >${resultList.progrsSttusNm}</span>
														</c:when>
														<c:otherwise>
															<select class="form-control form-control-sm" id="status" name="status" OnChange="javascript:fn_ChangeStatus('${resultList.gubun}','${resultList.code}', this.value);">
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '0'}">
																		<option value="0" selected >예정</option>
																	</c:when>
																	<c:otherwise>
																		<option value="0" >예정</option>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '1'}">
																		<option value="1" selected >모집중</option>
																	</c:when>
																	<c:otherwise>
																		<option value="1" >모집중</option>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '2'}">
																		<option value="2" selected >사업진행</option>
																	</c:when>
																	<c:otherwise>
																		<option value="2" >사업진행</option>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '4'}">
																		<option value="4" selected >사업결과</option>
																	</c:when>
																	<c:otherwise>
																		<option value="4" >사업결과</option>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '5'}">
																		<option value="5" selected >사후성과</option>
																	</c:when>
																	<c:otherwise>
																		<option value="5" >사후성과</option>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when test="${resultList.progrsSttus == '3'}">
																		<option value="3" selected >사업완료</option>
																	</c:when>
																	<c:otherwise>
																		<option value="3" >사업완료</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="text-center text-nonowrap td-hide-md">
													<c:choose>
														<c:when test="${resultList.progrsSttus != '3'}">
															<a href="javascript:fn_Modify('${resultList.code}','${resultList.gubun}');" class="btn btn-xs btn-warning rounded-1 wd-66" >수정</a>
															<c:if test="${resultList.progrsSttusNm == '신청'}">
																<a href="javascript:fn_Delete('${resultList.code}','${resultList.gubun}');" class="btn btn-xs btn-danger rounded-1 wd-66" >삭제</a>
															</c:if>
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${resultList.oldYn != 'Y'}">
																	<a href="javascript:fn_Move('${resultList.code}','${resultList.gubun}');" class="btn btn-xs btn-info wd-100" >지난행사이전</a>
																</c:when>
																<c:otherwise>
																	<!-- <a href="javascript:fn_Move('${resultList.code}','${resultList.gubun}');" class="btn btn-xs btn-success wd-70" >이전완료</a>-->
																	<span class="btn btn-xs btn-success rounded-1" style="cursor:default;" >이전완료</span>
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
								<a href="javascript:fn_Write('0');" class="btn btn-sm btn-primary" role="button">사업등록(전시)</a>
								<a href="javascript:fn_Write('1');" class="btn btn-sm btn-primary" role="button">사업등록(상담)</a>
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
