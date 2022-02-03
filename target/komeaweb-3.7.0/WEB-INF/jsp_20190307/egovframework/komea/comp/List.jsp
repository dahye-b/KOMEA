<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function detail(obj1){
	document.ListForm.idx.value = obj1;
	document.ListForm.action = "<c:url value='/komea/comp/View.do'/>";
	document.ListForm.submit();
}
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/komea/comp/List.do'/>";
	document.ListForm.submit();
}
function fn_Search(){
	document.ListForm.action = "<c:url value='/komea/comp/List.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="comp" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>

<div class="container" >
		<div class="table-responsive text-nowrap">
			<h5><i class="fas fa-list-ol"></i>조합원사 총 : ${paginationInfo.totalRecordCount}건 (${paginationInfo.currentPageNo} pages)</h5>
			<table class="table table-bordered" summary="게시판 자료">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:*%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:8%;" />
					<col style="width:10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">업체</th>
						<th scope="col">대표</th>
						<th scope="col">연락처</th>
						<th scope="col">지역</th>
						<th scope="col">홈페이지</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="comp" items="${resultList}" varStatus="status">
								<tr>
									<td class="text-center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
									<td><a href="javascript:detail(${comp.idx});"><c:out value="${comp.company}" /></a></td>
									<td class="text-center"><c:out value="${comp.ceo}" /></td>
									<td class="text-center"><c:out value="${comp.tel}" /> </td>
									<td class="text-center"><c:out value="${comp.tel}" /> </td>
									<td class="text-center"><c:out value="${comp.homepage}" /></td>    
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

	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_link_page"/>
	<form:hidden path="pageIndex"/>

	<form:select path="category">
		<form:option value="" label="카테고리선택"/>
        <form:option value="Hul" label="Hull & ship General"/>
        <form:option value="Out" label="Outfitting"/>
        <form:option value="Eng" label="Engine & Machinery"/>
        <form:option value="Ele" label="Electric & Electronics"/>
	</form:select>
	<form:select path="area">
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
업체명 : <form:input path="company" />
	<a href="javascript:fn_Search();" class="btn btn-warning" role="button">검색</a>
</form:form>
</body>
</html>