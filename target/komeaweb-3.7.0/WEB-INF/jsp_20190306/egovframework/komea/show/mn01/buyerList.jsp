<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1){
	document.ListForm.buyerCd.value=obj1;
	document.ListForm.action = "<c:url value='/show/BuyerView.do'/>";
	document.ListForm.submit();
	return;
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/BuyerList.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	if(obj != null){
		document.ListForm.entrpsNmIndex.value = obj;
	}
	document.ListForm.action = "<c:url value='/show/BuyerList.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value=""/>
	<form:input type="hidden" path="entrpsNmIndex" name="entrpsNmIndex" id="entrpsNmIndex" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>해외 바이어 소개</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-l">

				    <!-- ##### Search Area Start ##### -->
					<div>${entrpsNmIndex}
						<nav class="tab-alphabet nav nav-pills nav-justified">
							<a class="nav-link active" href="javascript:fn_Search('');">All</a>
							<a class="${entrpsNmIndex == 'A' ? 'nav-link active' : 'nav-link'}" href="javascript:fn_Search('A');">A</a>
							<a class="nav-link" href="javascript:fn_Search('B');">B</a>
							<a class="nav-link" href="javascript:fn_Search('C');">C</a>
							<a class="nav-link" href="javascript:fn_Search('D');">D</a>
							<a class="nav-link" href="javascript:fn_Search('E');">E</a>
							<a class="nav-link" href="javascript:fn_Search('F');">F</a>
							<a class="nav-link" href="javascript:fn_Search('G');">G</a>
							<a class="nav-link" href="javascript:fn_Search('H');">H</a>
							<a class="nav-link" href="javascript:fn_Search('I');">I</a>
							<a class="nav-link" href="javascript:fn_Search('J');">J</a>
							<a class="nav-link" href="javascript:fn_Search('K');">K</a>
							<a class="nav-link" href="javascript:fn_Search('L');">L</a>
							<a class="nav-link" href="javascript:fn_Search('M');">M</a>
							<a class="nav-link" href="javascript:fn_Search('N');">N</a>
							<a class="nav-link" href="javascript:fn_Search('O');">O</a>
							<a class="nav-link" href="javascript:fn_Search('P');">P</a>
							<a class="nav-link" href="javascript:fn_Search('Q');">Q</a>
							<a class="nav-link" href="javascript:fn_Search('R');">R</a>
							<a class="nav-link" href="javascript:fn_Search('S');">S</a>
							<a class="nav-link" href="javascript:fn_Search('T');">T</a>
							<a class="nav-link" href="javascript:fn_Search('U');">U</a>
							<a class="nav-link" href="javascript:fn_Search('V');">V</a>
							<a class="nav-link" href="javascript:fn_Search('W');">W</a>
							<a class="nav-link" href="javascript:fn_Search('X');">X</a>
							<a class="nav-link" href="javascript:fn_Search('Y');">Y</a>
							<a class="nav-link" href="javascript:fn_Search('Z');">Z</a>
						</nav>
					</div>
				    
					<div class="form-inline justify-content-end bo-search mb-1" >
						<div class="form-group mb-10" >
								<form:select path="gb" class="form-control form-control-sm" OnChange="javascript:fn_Search('');">
									<form:option value="" label="구분"/>
									<form:option value="Association" label="Association"/>
									<form:option value="Ship Owner" label="Ship Owner"/>
									<form:option value="Shipyard" label="Shipyard"/>
									<form:option value="Trading" label="Trading"/>
								</form:select>
						</div>
						<div class="form-group mb-10">
								<a href="javascript:fn_Search('');" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
						</div>
					</div>
				    <!-- ##### Search Area End ##### -->

					<div class="table-responsive" >
						 <table class="table table-bordered border-top-3 text-nowrap table-hover" summary="해외바이어소개 게시판 입니다." >
					 		<caption class="d-none" >해외바이어소개</caption>
							<thead>
								<tr>
									<th width="5%" class="td-hide-md"><strong>No</strong></th>
									<th width="25%"><strong>국가</strong></th>
									<th width="20%" class="td-b-hide-sm" ><strong>업체명</strong></th>
									<th width="20%" class="td-hide-md"><strong>구분</strong></th>
									<th width="25%" class="td-hide-sm"><strong>홈페이지</strong></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="text-center td-hide-md"><strong><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></strong></td>
												<td class="text-left"><c:out value="${resultList.nationNm}" /></td>
												<td class="td-b-hide-sm"><a href="javascript:detail('${resultList.buyerCd}');" class="text-16"><c:out value="${resultList.entrpsNm}" /></a></td>
												<td class="text-center td-hide-md"><c:out value="${resultList.gb}" /></td>
												<td class="text-left td-hide-sm"><c:out value="${resultList.hmpg}" /></td>
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
