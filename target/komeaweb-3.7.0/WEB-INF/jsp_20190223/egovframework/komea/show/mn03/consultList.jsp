<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1){
	document.ListForm.code.value = obj1;
	document.ListForm.action = "<c:url value='/show/ConsultView.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/ConsultList.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	if(obj != null){
		document.ListForm.gb.value=obj;
	}
	document.ListForm.action = "<c:url value='/show/ConsultList.do'/>";
	document.ListForm.submit();
}
</script>

<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="code" path="code" id="code" value=""/>
<form:input type="hidden" name="gb" path="gb" id="gb" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading col-12">
					<h2>상담행사</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100">


							<!-- ##### Search Tabs Area Start ##### -->
							<div class="card search-tabs rounded-0 mb-1">
								<div class="card-header">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link rounded-0 text-18 active" data-toggle="tab" href="#tab-1" role="tab">전체보기</a></li>
										<li class="nav-item"><a class="nav-link rounded-0 text-18" data-toggle="tab" href="#tab-2" role="tab">KOMEC주관</a></li>
									</ul>
								</div>
								<div class="card-block">
									<div class="tab-content">
										<div class="tab-pane px-30 py-30 active" id="tab-1">

											<div class="form-inline tab-search">
												<div class="form-row">
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm" placeholder="행사명" maxlength="20" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm" placeholder="주최" maxlength="20" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" id="sdatetiem" class="form-control form-control-sm datepicker" placeholder="행사시작일" maxlength="10" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" id="edatetiem" class="form-control form-control-sm datepicker" placeholder="행사종료일" maxlength="10" size="8" value="" />
													</div>
													<div class="form-group" >
														<div class="btn-group" role="group" >
																<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_Search('all');" >전체</button>
																<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_Search('week');" >일주일</button>
																<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_Search('month');" >한달</button>
														</div>
													</div>
													<div class="form-group" >
														<a href="javascript:fn_Search('all');" class="btn btn-sm btn-primary" >검색</a>
													</div>
												</div>
											</div>

										</div>
										<div class="tab-pane px-30 py-30" id="tab-2">

											<div class="form-inline tab-search">
												<div class="form-row">
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm" placeholder="행사명" maxlength="20" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm" placeholder="주최" maxlength="20" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm datepicker" placeholder="행사시작일" maxlength="10" size="8" value="" />
													</div>
													<div class="form-group" >
														<input type="text" class="form-control form-control-sm datepicker" placeholder="행사종료일" maxlength="10" size="8" value="" />
													</div>
													<div class="form-group" >
														<a href="#" class="btn btn-sm btn-primary" >검색</a>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
							<!-- ##### Search Tabs Area End ##### -->

							<div class="clearfix mt-10 mb-30 text-right">
								<!-- 
								<a href="#" class="btn btn-sm btn-info" ><i class="far fa-list-alt text-white"></i> 리스트로보기</a>
								<a href="#" class="btn btn-sm btn-info" ><i class="far fa-calendar-alt text-white"></i> 달력으로보기</a>
								 -->
							</div>

							<div class="container">
								<div class="row div-gallerys">
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<div class="col-md-6 no-padding" >

														<div class="div-gallery row" >
															<div class="col-md-5 div-img"><img src="/img/core-img/noimg.jpg" alt="<c:out value="${resultList.eventNm}" />" /></div>
															<div class="col-md-7 div-content" >
																<h6 class="text-info"><a href="javascript:detail('${resultList.cnsltexhbCd}');" class="text-16"><c:out value="${resultList.eventNm}" /></a></h6>
																<p>
																	<span class="text-dark">주 최 :</span> <c:out value="${resultList.insttNm}" /><br />
																	<span class="text-dark">기 간 :</span> <c:out value="${resultList.eventBeginDe}" /> ~ <c:out value="${resultList.eventBeginDe}" /><br />
																	<span class="text-dark">장 소 :</span> <c:out value="${resultList.place}" /><br />
																</p>
																<p class="text-right mt-10">
																	<c:choose>
																	<c:when test="${resultList.progrsSttusNm == '예정'}">
																		<a href="#" class="btn btn-xs btn-warning rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:when test="${resultList.progrsSttusNm == '모집중'}">
																		<a href="#" class="btn btn-xs btn-primary rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:when test="${resultList.progrsSttusNm == '사업진행'}">
																		<a href="#" class="btn btn-xs btn-success rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:when test="${resultList.progrsSttusNm == '사업종료'}">
																		<a href="#" class="btn btn-xs btn-secondary rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:when test="${resultList.progrsSttusNm == '사업결과'}">
																		<a href="#" class="btn btn-xs btn-danger rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:when test="${resultList.progrsSttusNm == '사업성과'}">
																		<a href="#" class="btn btn-xs btn-info rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:when>
																	<c:otherwise>
																		<a href="#" class="btn btn-xs btn-info rounded-1 wd-66" ><c:out value="${resultList.progrsSttusNm}" /></a>
																	</c:otherwise>
																	</c:choose>
																</p>
															</div>
														</div>

											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
											<div class="col-md-12 text-center py-30" >
												조회된 결과가 없습니다.
											</div>
									</c:otherwise>
								</c:choose>
								</div><!-- div class="row" -->
							</div><!-- div class="container" -->

		          			<hr class="mb-30">

							<!-- ##### Paging Area Start ##### -->
							<div class="clearfix" >
								<nav class="table-responsive" >
									<ul class="pagination flex-wrap justify-content-center">
									<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
									<form:hidden path="pageIndex"/>
									</ul>
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
