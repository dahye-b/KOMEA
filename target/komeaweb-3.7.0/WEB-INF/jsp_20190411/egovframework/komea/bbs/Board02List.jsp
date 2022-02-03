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
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value="B002"/>
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

					<!-- ##### Pills Area Start ##### -->
					<!--
					<nav class="pills-arrow mb-50">
						<ul class="nav nav-pills nav-fill" id="nav-tab" role="tablist">
							<li class="nav-item" ><a class="nav-link active" href="#" role="tab" >All List</a></li>
							<li class="nav-item" ><a class="nav-link" href="#" role="tab" >조합보</a></li>
							<li class="nav-item" ><a class="nav-link" href="#" role="tab" >영문가이드북</a></li>
							<li class="nav-item" ><a class="nav-link" href="#" role="tab" >KOMEA FORUM</a></li>
							<li class="nav-item" ><a class="nav-link" href="#" role="tab" >기타</a></li>
						</ul>
					</nav>
					-->
					<!-- ##### Pills Area End ##### -->
					<!-- ##### Align Area Start ##### -->
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
							</div>
						</div>
					</div>
					<!-- ##### Align Area End ##### -->

					<!-- ##### Gallery Area Start ##### -->
					<h6>전체 ${paginationInfo.totalRecordCount}건 <small>(${paginationInfo.currentPageNo} 페이지)</small></h6>
					<div class="container gallery-block cards-gallery bg-light pt-20">
						<div class="row">
							<c:choose>
								<c:when test="${fn:length(resultList) > 0}">
									<c:forEach var="komea" items="${resultList}" varStatus="status">
										<div class="col-md-4 col-lg-3">
											<div class="card border-0 transform-on-hover">
												<a class="lightbox" href="javascript:detail(${komea.idx},${komea.block},${komea.rlevel},${komea.boss});">
													<img src="${komea.fNm}" alt="Card Image" >
												</a>
												<div class="card-body text-center">
													<h6 class="text-primary">[카테고리]</h6>
													<a class="lightbox" href="javascript:detail(${komea.idx},${komea.block},${komea.rlevel},${komea.boss});"><h5><c:out value="${komea.title}" /></h5></a>
													<p class=" text-14card-text text-14">작성일 : <c:out value="${komea.indate}" /></p>
													<p class=" text-14card-text text-14">조회 : <c:out value="${komea.cnt}" /></p>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- ##### Gallery Area End ##### -->

					<!-- ##### Paging Area Start ##### -->
					<div class="mt-20">
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
