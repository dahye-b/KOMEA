<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
	function detail(obj1, obj2, obj3){
		var auth = "${loginInfo.compLevel}";
		
		document.ListForm.idx.value = obj1;
		document.ListForm.gulIdx.value = obj2;
		document.ListForm.srsn.value = obj3;
		if(auth == "A"){//관리자는 바로 뷰 화면으로 이동
			document.ListForm.action = "<c:url value='/komea/bbs/QnaView.do'/>";
		}else{
			document.ListForm.action = "<c:url value='/komea/bbs/QnaPwCheck.do'/>";
		}
		document.ListForm.submit();
	}
	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/komea/bbs/QnaList.do'/>";
		document.ListForm.submit();
	}
	function fn_Search(){
		document.ListForm.action = "<c:url value='/komea/bbs/QnaList.do'/>";
		document.ListForm.submit();
	}
</script>
<body>
<form:form name="ListForm" commandName="bbs" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="gulIdx" name="gulIdx" id="gulIdx" value=""/>
	<form:input type="hidden" path="srsn" name="srsn" id="srsn" value=""/>

    <!-- ##### Board List Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>열린제안</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
				<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
					<!-- form role="form" name="sel3_form" method="get" action="Board.asp" onsubmit="return search(this);" -->
						<div class="form-inline bo-search">
							<div class="form-row">
								<div class="form-group" >
										<form:select path="searchCondition" class="form-control form-control-sm" >
											<form:option value="9" label="전체"/>
											<form:option value="0" label="작성자"/>
											<form:option value="1" label="제목"/>
											<form:option value="2" label="내용"/>
										</form:select>
								</div>
								<div class="form-group" >
									<form:input path="searchKeyword" class="form-control form-control-sm" value="" placeholder="검색어" size="15" />
								</div>
								<div class="form-group" >
								<a href="javascript:fn_Search();" class="btn btn-sm btn-primary btn-block text-white">검색</a>
									<a href="<c:url value='/komea/bbs/QnaWrite.do'/>" class="btn btn-sm btn-warning" >글쓰기</a>
								</div>
							</div>
						</div>
					<!-- /form -->
					<!-- ##### Search Area End ##### -->

					<!-- 게시물 목록 시작 { -->
					<div class="table-responsive text-nowrap">
						<h6>전체 ${paginationInfo.totalRecordCount}건 <small>(${paginationInfo.currentPageNo} 페이지)</small></h6>
						<table class="table table-bordered border-top-3 table-hover" summary="게시판 자료">
							<colgroup>
								<col style="width:5%;" />
								<col style="width:55%;" />
								<col style="width:15%;" />
								<col style="width:7%;" />
								<col style="width:7%;" />
								<col style="width:11%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="td-no" >No.</th>
									<th scope="col" class="td-subject">제목</th>
									<th scope="col" class="td-writer" >작성자</th>
									<th scope="col" class="td-date" >작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="resultList" items="${resultList}" varStatus="status">
											<tr>
												<td class="td-no"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
												<td class="td-subject"><a href="javascript:detail(${resultList.idx},${resultList.gulIdx},${resultList.srsn});"><c:out value="${resultList.title}" /></a></td>
												<td class="td-writer"><c:out value="${resultList.name}" /></td>
												<td class="td-date">
													<c:out value="${resultList.insertDt}" />
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center w-100" colspan="4">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- } 게시물 목록 끝 -->

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
					
				</div><!-- div class="section-text col-12 mb-100 bo-l" -->

			</div>
		</div>
   	</section>
    <!-- ##### Board List Section End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
