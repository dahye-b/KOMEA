<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
		<div class="wrapper ">
		<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
				<div class="main-panel">
			<jsp:include page="/WEB-INF/include/admin-menu.jsp" flush="true"></jsp:include>
						<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/admin/compList.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/admin/compList.do'/>";
	document.ListForm.submit();
}
function fn_Delete(obj) {
	$.ajax({
		url : "/admin/DeleteComp.do", 
		type : "POST",  
		data : "idx="+obj,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("조합원사를 삭제 하였습니다.");
				location.reload();
			}
		},
		error:function(request,status,er){
			var errorMsg= "요청 도중 오류가 발생하였습니다.\n";
			
			if(request.status == 0){errorMsg+="네트워크 연결을 확인해주십시오.";}
			else if(request.status == 401){errorMsg+="권한이 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 403){errorMsg+="접근이 거부되었습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 404){errorMsg+="요청한 페이지를 찾을 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 500){errorMsg+="서버 내 오류가 발생하였습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'parsererror'){errorMsg+="응답 본문을 정상적으로 가져올 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'timeout'){errorMsg+="응답 제한 시간을 초과하였습니다. 다시 조회해 주세요";}
			else {errorMsg+="관리자에게 문의해주세요.";}
			alert(errorMsg);
		}
	});
}
</script>
<form:form name="ListForm" commandName="comp" method="post">
<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>조합원사 <small>목록</small></h3>
	</div>

	<!-- 게시물 상단 버튼 시작 { -->
	<div class="clearfix mb-3" >
		<form class="form-horizontal">
			<div class="form-inline float-right border-0">
				<form:select path="area" class="form-control form-control-sm"  OnChange="javascript:fn_Search();">
					<form:option value="" label="국내지역선택"/>
					<form:option value="SU" label="서울"/>
					<form:option value="IN" label="인천"/>
					<form:option value="GN" label="경기도"/>
					<form:option value="GG" label="강원도"/>
					<form:option value="CB" label="층청북도"/>
					<form:option value="CN" label="충청남도"/>
					<form:option value="GW" label="대전"/>
					<form:option value="DE" label="대구"/>
					<form:option value="JB" label="전라북도"/>
					<form:option value="JN" label="전라남도"/>
					<form:option value="GZ" label="광주"/>
					<form:option value="KP" label="경상북도"/>
					<form:option value="KN" label="경상남도"/>
					<form:option value="BS" label="부산"/>
					<form:option value="JJ" label="제주도"/>
					<form:option value="US" label="울산"/>
				</form:select>
				<form:input path="company" class="form-control form-control-sm" placeholder="업체명 입력" size="30" value="" />
				<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary">검색</a>&nbsp;
				<div class="btn-group btn-group-justified">
					<a href="<c:url value='/admin/compInput.do'/>" class="btn btn-sm btn-primary text-white">신규등록</a>
				</div>
			</div>
		</form>

	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<!-- 게시물 읽기 시작 { -->
	<div class="table-responsive text-nowrap">
		<div class="table-responsive">
			<table class="table table-bordered" summary="게시판관리 자료">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:*%;" />
					<col style="width:15%;" />
					<col style="width:15%;" />
					<col style="width:15%;" />
					<col style="width:15%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="td-no" >No.</th>
						<th scope="col" class="td-subject">업체</th>
						<th scope="col" class="td-writer" >대표</th>
						<th scope="col" class="td-hit" >연락처</th>
						<th scope="col" class="td-date" >지역</th>
						<th scope="col" class="td-date" >삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<tr>
								<td class="text-center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
								<td class="td-subject"><c:out value="${resultList.company}" /></td>
								<td class="text-center"><c:out value="${resultList.ceo}" /></td>
								<td class="text-center"><c:out value="${resultList.tel}" /></td>
								<td class="text-center"><c:out value="${resultList.area}" /></td>
								<td class="text-center"><a href="javascript:fn_Delete(${resultList.idx})" class="btn btn-sm btn-primary text-white">삭제</a></td>
							</tr>
							</c:forEach>    
						</c:when>
						<c:otherwise>
							<tr>
								<td class="text-center" colspan="6">조회된 결과가 없습니다.</td>
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
			<form:hidden path="pageIndex"/>
			</ul>
		</nav>
	</div>
	<!-- 페이징 -->
</form:form>
	</div>
</div>
<!-- //######################################## } content 영역 끝 -->
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>
