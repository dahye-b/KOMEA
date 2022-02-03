<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
	function detail(obj1, obj2, obj3, obj4){
		document.ListForm.idx.value = obj1;
		document.ListForm.block.value = obj2;
		document.ListForm.rlevel.value = obj3;
		document.ListForm.boss.value = obj4;
		document.ListForm.action = "<c:url value='/komea/bbs/View.do'/>";
		document.ListForm.submit();
	}

	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/komea/bbs/List.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/komea/bbs/List.do'/>";
		document.ListForm.submit();
	}
</script>
<body>
<form:form name="ListForm" commandName="bbs" method="post">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value="B009"/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>

    <!-- ##### Board List Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>${BoardName}</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
				<div class="section-text col-12 mb-100 bo-l">

					<!-- ##### Search Area Start ##### -->
					<!-- form role="form" name="sel3_form" method="get" action="Board.asp" onsubmit="return search(this);" -->
						<div class="form-inline justify-content-end bo-search" >
							<div class="form-group" >
									<form:select path="searchCondition" class="form-control form-control-sm" >
										<form:option value="9" label="전체"/>
										<form:option value="0" label="작성자"/>
										<form:option value="1" label="제목"/>
										<form:option value="2" label="내용"/>
									</form:select>
							</div>
							<div class="form-group">
								<form:input path="searchKeyword" class="form-control form-control-sm" value="" placeholder="검색어" size="30" />
							</div>
							<div class="form-group">
									<a href="javascript:fn_Search();" class="btn btn-sm btn-primary btn-block text-white">검색</a>
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
									<th scope="col" class="td-hit" >조회수</th>
									<th scope="col" class="td-file" >파일</th>
									<th scope="col" class="td-date" >작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="komea" items="${resultList}" varStatus="status">
											<tr>
												<td class="td-no"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
												<td class="td-subject"><a href="javascript:detail(${komea.idx},${komea.block},${komea.rlevel},${komea.boss});"><c:out value="${komea.title}" /></a></td>
												<td class="td-writer"><c:out value="${komea.uName}" /></td>
												<td class="td-hit"><c:out value="${komea.cnt}" /> </td>
												<td class="td-file"></td>
												<td class="td-date"><c:out value="${komea.indate}" /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center w-100" colspan="6">조회된 결과가 없습니다.</td>
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

			</div>
		</div>
   	</section>
    <!-- ##### Board List Section End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
