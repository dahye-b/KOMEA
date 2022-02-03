<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1, obj2){
	document.ListForm.code.value = obj1;
	document.ListForm.cnsltexhbGb.value = obj2;
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
	document.ListForm.gubun.value="1";//탭구분자
	document.ListForm.action = "<c:url value='/show/ConsultList.do'/>";
	document.ListForm.submit();
}
function fn_SearchKomec(){
	document.ListForm.gubun.value="2";//탭구분자
	document.ListForm.action = "<c:url value='/show/ConsultList.do'/>";
	document.ListForm.submit();
}
</script>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="code" path="code" id="code" value=""/>
<form:input type="hidden" name="gb" path="gb" id="gb" value=""/>
<form:input type="hidden" name="gubun" path="gubun" id="gubun" value=""/>
<form:input type="hidden" name="cnsltexhbGb" path="cnsltexhbGb" id="cnsltexhbGb" value=""/>

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
				<div class="card search-tabs rounded-0 mb-30">
					<div class="card-header">
						<ul class="nav nav-tabs">
							<c:choose>
								<c:when test="${show.gubun == 2}">
									<li class="nav-item"><a class="nav-link rounded-0 text-18" data-toggle="tab" href="#tab-1" role="tab" onclick="javascript:fn_Search();">전체보기</a></li>
									<li class="nav-item"><a class="nav-link rounded-0 text-18 active" data-toggle="tab" href="#tab-2" role="tab" onclick="javascript:fn_SearchKomec();">KOMEC주관</a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link rounded-0 text-18 active" data-toggle="tab" href="#tab-1" role="tab" onclick="javascript:fn_Search();">전체보기</a></li>
									<li class="nav-item"><a class="nav-link rounded-0 text-18" data-toggle="tab" href="#tab-2" role="tab" onclick="javascript:fn_SearchKomec();">KOMEC주관</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div class="form-inline justify-content-end bo-search mb-10 mt-10 mr-10" >
						<div class="form-group" >
							<form:input type="text" class="form-control form-control-sm wd-200" placeholder="행사명" name="searchKeyword" path="searchKeyword" id="searchKeyword" value="" />
						</div>
						<div class="form-group" >
							<form:input type="text" class="form-control form-control-sm" placeholder="주최" name="insttNm" path="insttNm" id="insttNm" value="" />
						</div>
						<div class="form-group" >
							<form:input type="text" class="form-control form-control-sm datepicker wd-100" placeholder="행사시작일" maxlength="10" name="eventBeginDe" path="eventBeginDe" id="eventBeginDe" value="" onChange="formatDate('eventBeginDe');"/>
						</div>
						<div class="form-group" >
							<form:input type="text" class="form-control form-control-sm datepicker wd-100" placeholder="행사종료일" maxlength="10" name="eventClosDe" path="eventClosDe" id="eventClosDe" value="" onChange="formatDate('eventClosDe');"/>
						</div>
						<div class="form-group" >
							<div class="btn-group float-right" role="group" >
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
													<div class="col-md-5 div-img">
													<c:choose>
														<c:when test="${resultList.cnsltexhbPhotoFileNm1 != null}">
															<img src="<c:out value='${resultList.cnsltexhbPhotoFileCours1}' />" alt="<c:out value='${resultList.cnsltexhbPhotoFileNm1}' />" />
														</c:when>
														<c:otherwise>
															<img src="/img/core-img/noimg.jpg" alt="<c:out value="${resultList.exbiNm}" />" />
														</c:otherwise>
													</c:choose>
													</div>
													<div class="col-md-7 div-content" >
														<h6 class="text-info"><a href="javascript:detail('${resultList.cnsltexhbCd}','${resultList.cnsltexhbGb}');" class="text-16 text-info"><c:out value="${resultList.eventNm}" /></a></h6>
														<p>
															<fmt:parseDate value="${resultList.eventBeginDe}" var="eventBeginDe" pattern="yyyyMMdd"/>
															<fmt:parseDate value="${resultList.eventClosDe}" var="eventClosDe" pattern="yyyyMMdd"/>
															<span class="text-dark">주 최 :</span> <c:out value="${resultList.insttNm}" /><br />
															<span class="text-dark">기 간 :</span> <fmt:formatDate value="${eventBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventClosDe}" pattern="yyyy.MM.dd"/><br />
															<span class="text-dark">장 소 :</span> <c:out value="${resultList.place}" /><br />
														</p>
														<p class="text-right mt-10">
															<c:choose>
															<c:when test="${resultList.progrsSttusNm == '예정'}">
																<a href="#" class="btn btn-xs btn-warning rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:when test="${resultList.progrsSttusNm == '모집중'}">
																<a href="#" class="btn btn-xs btn-primary rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:when test="${resultList.progrsSttusNm == '사업진행'}">
																<a href="#" class="btn btn-xs btn-success rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:when test="${resultList.progrsSttusNm == '사업종료'}">
																<a href="#" class="btn btn-xs btn-secondary rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:when test="${resultList.progrsSttusNm == '사업결과'}">
																<a href="#" class="btn btn-xs btn-danger rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:when test="${resultList.progrsSttusNm == '사업성과'}">
																<a href="#" class="btn btn-xs btn-info rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
															</c:when>
															<c:otherwise>
																<a href="#" class="btn btn-xs btn-info rounded-1 wd-66" style="cursor:default;"><c:out value="${resultList.progrsSttusNm}" /></a>
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
