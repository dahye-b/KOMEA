<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
	function detail(obj1, obj2, obj3, obj4, obj5){
		document.ListForm.bCode.value = obj1;
		document.ListForm.idx.value = obj2;
		document.ListForm.block.value = obj3;
		document.ListForm.rlevel.value = obj4;
		document.ListForm.boss.value = obj5;
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
	<form:input type="text" path="bCode" name="bCode" id="bCode" value=""/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>

    <!-- ##### SUB-TITLE Area Start ##### -->
    <section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center">
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section>
    <!-- ##### SUB-TITLE Area End ##### -->

		<!-- ##### Section-nav Area Start ##### -->
		<div class="section-nav sub-nav-line">
				<div class="container">
						<div class="row">
								<div class="col-12">
										<ul class="dropdown-line">
											<li class="dropdown-home">
												<button type="button" href="#" class="btn btn-home" ></button>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">게시판<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0101.do">KOMEA<small>(KOMEC)</small></a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0201.do">조합원사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.3.1.jsp">사업소개</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/show/WorkList.do">전시행사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >수출 및 A/S시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.7.1.jsp">자료실</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bbsTy=0">게시판</a></li>
												</ul>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">신제품소개<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B001">공지사항</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B002">영문공지</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B003">전시회자료</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B004">서식다운로드</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B005">기타자료실</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B006">조합원사동정</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B007">Komea뉴스레터</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B008">신제품소개</a></li>
												</ul>
											</li>
										</ul>
								</div>
						</div>
				</div>
		</div>
		<!-- ##### Section-nav Area End ##### -->

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
					<input type="hidden" name="mode" value="1" />
					<input type="hidden" name="menucode" value="0404040000" />
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="no" value="" />
					<input type="hidden" name="hd" value="" />

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
									<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary" >검색</a>
								</div>
								<div class="form-group" >
									<a href="/komea/bbs/Write.do?bCode=B008" class="btn btn-sm btn-danger" >글쓰기(임시)</a>
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
												<td class="td-subject"><a href="javascript:detail('${komea.bCode}',${komea.idx},${komea.block},${komea.rlevel},${komea.boss});"><c:out value="${komea.title}" /></a></td>
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
