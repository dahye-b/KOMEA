<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
<div class="wrapper wrapper-full-page">
	<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
	<div class="main-panel">
		<jsp:include page="/WEB-INF/include/admin-menu.jsp" flush="true"></jsp:include>
	<!-- jquery { -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- } jquery -->
<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
	function detail(obj1){
		document.ListForm.mberCd.value = obj1;
		document.ListForm.action = "<c:url value='/admin/mberView.do'/>";
		document.ListForm.submit();
	}

	function fn_egov_link_page(pageNo){
		document.ListForm.pageIndex.value = pageNo;
		document.ListForm.action = "<c:url value='/admin/mberList.do'/>";
		document.ListForm.submit();
	}

	function fn_Search(){
		document.ListForm.action = "<c:url value='/admin/mberList.do'/>";
		document.ListForm.submit();
	}
	
	function UpdateLevel(obj1, obj2){
		document.ListForm.mberCd.value = obj1;
		document.ListForm.sbscrbConfmYn.value = obj2;
		document.ListForm.action = "<c:url value='/admin/UpdateMberConfm.do'/>";
		document.ListForm.submit();
	}
	function UpdateUnionCompYn(obj1, obj2){
		document.ListForm.mberCd.value = obj1;
		document.ListForm.unionCompYn.value = obj2;
		document.ListForm.action = "<c:url value='/admin/UpdateUnionCompYn.do'/>";
		document.ListForm.submit();
	}
	function fn_point(obj1, obj2){
    	if (obj1 != "2") {
    		alert("기업 회원이 아닙니다.");
    		return;
    	} else {
    	    $.ajax({
    	        url : "/mber/SelectCompPoint.do",   
    	        type : "POST",  
    	        data : "mberCd="+obj2,
    	        success : function(data) {
    	        	//console.log(data);
    	        	var resultData = data.data;
    				//alert("조회성공"+resultData[0].title);
    				
					$("#totalCnt").empty();
					$("#totalSum").empty();
    				// $("#totalCnt").append(data.TotalCnt+"건이 검색되었습니다.");
    				// $("#totalSum").append("총"+data.TotalSum+"점");
    				$("#totalCnt").append(data.TotalCnt);
    				$("#totalSum").append(data.TotalSum);
    				
    				var contents = '';
    				 $("#pointTable").empty();
    				 contents += '<thead><tr><th scope="col">구분</th><th scope="col">행사</th><th scope="col">점수</th></tr></thead><tbody>';
    				
    				$.each(resultData, function(index, value){
    					contents += '<tr><td class="text-center">'+value.title+'</td><td>'+value.name+'</td><td class="text-center" >'+value.score+'</td></tr>';
    				});
    				contents += '</tbody>';
    				$("#pointTable").html(contents);

					$('#Modal2').modal('show');
    	        }
    	    });
    	}
	}
</script>

<div class="content">
<div class="container_fluid">

<form:form name="ListForm" commandName="mber" method="post">
	<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value=""/>
	<form:input type="hidden" path="sbscrbConfmYn" name="sbscrbConfmYn" id="sbscrbConfmYn" value=""/>
	<form:input type="hidden" path="unionCompYn" name="unionCompYn" id="unionCompYn" value=""/>
	<form:hidden path="pageIndex"/>

	<div class="page-header"> 
		<h3>회원관리 <small>목록</small></h3>
	</div>

	<!-- nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">홈</a></li>
			<li class="breadcrumb-item active" aria-current="page">자료실</li>
		</ol>
	</nav -->

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select class="form-control form-control-sm mr-1" path="searchCondition">
					<form:option value="" label="--- 선택 ---"/>
					<form:option value="0" label="아이디"/>
					<form:option value="1" label="회사/기관명"/>
					<form:option value="2" label="대표성명"/>
				</form:select>
				<form:input type="text" path="searchKeyword" class="form-control form-control-sm mr-1" placeholder="검색어" size="10" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<!--
					<a href="<c:url value='/admin/mberInput.do'/>" class="btn btn-sm btn-primary text-white" >회원등록</a>
					-->
				</div>
			</div>
		</form>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<!-- 게시물 읽기 시작 { -->
	<div>
		<div class="table-responsive text-nowrap">
			<table class="table table-bordered w-1600" summary="회원관리 자료">
				<colgroup>
					<col style="width:6%;" />
					<col style="width:3%;" />
					<col style="width:10%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:7%;" />
					<col style="width:4%;" />
					<col style="width:4%;" />
					<col style="width:4%;" />
					<col style="width:4%;" />
					<col style="width:4%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">구분</th>
						<th scope="col">회사/기관명</th>
						<th scope="col">대표성명</th>
						<th scope="col">전화번호</th>
						<th scope="col">담당자</th>
						<th scope="col">담당자부서</th>
						<th scope="col">담당자직급</th>
						<th scope="col">승인</th>
						<th scope="col">등급현황</th>
						<th scope="col">조합원사여부</th>
						<th scope="col">포인트이력</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="mber" items="${resultList}" varStatus="status">
							<tr>
								<td class="text-center"><c:out value="${mber.id}" /></td>
								<td class="text-center"><c:out value="${mber.ssbypNm}" /></td>
								<td class="text-center"><a href="javascript:detail('${mber.mberCd}')"><c:out value="${mber.cmpnyNm}" /></a></td>
								<td class="text-center"><c:out value="${mber.rprsntv}" /></td>
								<td class="text-center"><c:out value="${mber.telno}" /></td>
								<td class="text-center"><c:out value="${mber.chargerNm}" /></td>
								<td class="text-center"><c:out value="${mber.chargerDept}" /></td>
								<td class="text-center"><c:out value="${mber.chargerOfcps}" /></td>
								<td class="text-center">
									<c:choose>
										<c:when test="${mber.sbscrbConfmYn eq 'N'}">
											<a href="javascript:UpdateLevel(${mber.mberCd},'Y')" class="btn btn-sm btn-primary text-white">승인</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:UpdateLevel(${mber.mberCd},'N')" class="btn btn-sm btn-secondary text-white">승인취소</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-center"><c:out value="${mber.compLevelNm}" /></td>
								<td class="text-center">
									<c:choose>
										<c:when test="${mber.unionCompYn eq 'N'}">
											<a href="javascript:UpdateUnionCompYn(${mber.mberCd},'Y')" class="btn btn-sm btn-primary text-white">조합원사승인</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:UpdateUnionCompYn(${mber.mberCd},'N')" class="btn btn-sm btn-secondary text-white">조합원사승인취소</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-center"><button type="button" class="btn btn-sm btn-primary" onClick="javascript:fn_point('${mber.ssbyp}','${mber.mberCd}')">포인트이력</button>
								<!-- <a href="javascript:fn_point('${mber.ssbyp}','${mber.mberCd}')" class="btn btn-sm btn-secondary text-white" data-toggle="modal" data-target="#Modal2" >포인트이력</a>--></td>
							</tr>
							</c:forEach>    
						</c:when>
						<c:otherwise>
							<tr>
								<td class="text-center" colspan="12">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<!-- } 게시판 목록 끝 -->

	<!-- 페이징 -->
	<div class="my-3 clearfix" >
		<nav>
			<ul class="pagination justify-content-center">
			<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
			</ul>
		</nav>
	</div>
	<!-- 페이징 -->

</form:form>

</div><!-- div class="container_fluid" -->
</div><!-- div class="content" -->

<!-- //######################################## } content 영역 끝 -->
<!-- Modal2 - MD 시작 : 위치확인할 것 { -->
<div class="modal" id="Modal2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">기업회원 포인트 현황</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h5 class="text-center">
					<span id="totalCnt" class="text-primary"></span>건이 검색되었습니다. (총 <span id="totalSum" class="text-primary"></span>점)
				</h5>
				<div class="table-responsive text-nowrap table-wrapper-scroll-y" >
					<table class="table table-bordered border-top-2" summary="게시판 자료" id="pointTable" >
					</table>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- } Modal2 - MD 끝 -->
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>



