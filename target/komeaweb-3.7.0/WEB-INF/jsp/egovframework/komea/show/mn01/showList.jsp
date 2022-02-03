<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1, obj2){
	document.ListForm.code.value = obj1;
	document.ListForm.gubun.value = obj2;
	document.ListForm.action = "<c:url value='/show/ShowView.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/ShowList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/ShowList.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="code" name="code" id="code" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>행사보기</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
						<div class="form-inline justify-content-end bo-search mb-10" >
							<div class="form-group" >
								<form:select class="form-control form-control-sm" path="year" id="year" name="year" OnChange="javascript:fn_Search();">
									<form:option value="" label="년도별"/>
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
							<div class="form-group" >
								<form:select path="gubun" class="form-control form-control-sm" onChange="javascript:fn_Search();">
									<form:option value="9" label="사업내용"/>
									<form:option value="0" label="전시회"/>
									<form:option value="1" label="상담회"/>
									<form:option value="2" label="코멕주관"/>
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
						 <table class="table table-bordered border-top-3 table-hover" summary="행사보기 게시판 입니다." >
					 		<caption class="d-none" >행사보기</caption>
							<thead>
								<tr>
									<th width="5%" class="td-hide-md"><strong>구분</strong></th>
									<th width="*%" class="td-b-hide-sm"><strong>행사내용</strong></th>
									<th width="15%" class="td-hide-md"><strong>장소</strong></th>
									<th width="15%" class="td-hide-sm td-b-hide-md"><strong>행사기간</strong></th>
									<th width="15%" class="td-hide-md"><strong>지원기관</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md">
													<c:choose>
														<c:when test="${resultList.gubun eq '1'}">
															<strong>상담</strong>
														</c:when>
														<c:otherwise>
															<strong>전시</strong>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="td-b-hide-sm"><a href="javascript:detail('${resultList.code}','${resultList.gubun}');" class="text-16"><c:out value="${resultList.name}" /></a></td>
												<td class="text-left td-hide-md"><c:out value="${resultList.place}" /></td>
												<td class="text-center td-hide-sm td-b-hide-md"><c:out value="${resultList.fromDate}" /> ~ <c:out value="${resultList.closeDate}" /></td>
												<td class="text-left text-nonowrap td-hide-md"><c:out value="${resultList.insttNm}" /> </td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center" colspan="5">조회된 결과가 없습니다.</td>
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
