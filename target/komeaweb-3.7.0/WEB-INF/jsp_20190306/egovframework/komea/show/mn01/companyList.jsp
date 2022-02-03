<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1){
	var auth_yn = "${authYn}";
	
	if(auth_yn == "Y"){
		document.ListForm.mberCd.value = obj1;
		document.ListForm.action = "<c:url value='/show/CompanyView.do'/>";
		document.ListForm.submit();
	}else{
		alert("권한이 없습니다.");
		return;
	}
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/CompanyList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/show/CompanyList.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="mberCd" path="mberCd" id="mberCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading col-12">
						<h2>회원사목록</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-l">

				    <!-- ##### Search Area Start ##### -->
			    	<div class="form-inline justify-content-end bo-search mb-10" >
			    			<div class="form-group" >
								<form:select class="form-control form-control-sm" path="locplc" id="locplc" name="locplc" OnChange="javascript:fn_Search();">
									<form:option value="" label="지역별"/>
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
				    		<div class="form-group" >
				        		<form:input path="cmpnyNm" class="form-control form-control-sm" placeholder="회원사이름" size="30" value="" />
				        	</div>
				        	<div class="form-group" >
				            	<a href="javascript:fn_Search();" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
				            </div>
					</div>
				    <!-- ##### Search Area End ##### -->

					<!-- ##### Table Area Start ##### -->
					<div class="table-responsive" >
						 <table class="table table-bordered border-top-3 text-nowrap table-hover" summary="회원사목록 안내 게시판 입니다." >
					 		<caption class="d-none" >회원사목록</caption>
							<thead>
								<tr>
									<th width="5%" class="td-no"><strong>No</strong></th>
									<th width="25%" class="td-subject"><strong>업체명</strong></th>
									<th width="20%" class="td-writer" ><strong>주소</strong></th>
									<th width="20%" class="td-file"><strong>연락처</strong></th>
									<th width="25%" class="td-date"><strong>홈페이지</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-no"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
												<td class="td-subject"><a href="javascript:detail('${resultList.mberCd}');" class="text-16"><c:out value="${resultList.cmpnyNm}" /></a></td>
												<td class="text-left td-writer"><c:out value="${resultList.locplc}" /></td>
												<td class="text-center td-file"><c:out value="${resultList.telno}" /> </td>
												<td class="text-left td-date"><c:out value="${resultList.hmpg}" /></td>
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
					<!-- ##### Table Area End ##### -->

					<!-- ##### Paging Area Start ##### -->
					<div class="mb-1 clearfix" >
						<nav class="table-responsive" >
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
