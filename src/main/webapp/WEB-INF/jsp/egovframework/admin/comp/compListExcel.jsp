<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setContentType("application/vnd.ms-excel;charset=EUC-KR");
	String fileNm = "조합원사 목록";
	String fileEncode = java.net.URLEncoder.encode(fileNm, "UTF8");
	response.setHeader("Content-Disposition", "attachment; filename="+fileEncode+".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
	<title>조합원사</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
		<tr>
			<td align="center" colspan="5" style="background:#F0F0F0;"><h3>조합원사 목록</h3></td>
		</tr>
		<tr>
			<td align="center" width="50" style="background:#F0F0F0;">No.</td>
			<td align="center" width="200" style="background:#F0F0F0;">업체</td>
			<td align="center" width="200" style="background:#F0F0F0;">대표</td>
			<td align="center" width="150" style="background:#F0F0F0;">연락처</td>
			<td align="center" width="150" style="background:#F0F0F0;">지역</td>
		</tr>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="resultList" items="${resultList}" varStatus="status">
					<tr>
						<td align="center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
						<td align="center"><c:out value="${resultList.company}" /></td>
						<td align="center"><c:out value="${resultList.ceo}" /></td>
						<td align="center"><c:out value="${resultList.tel}" /></td>
						<td align="center"><c:out value="${resultList.area}" /></td>
					</tr>
					</c:forEach>    
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="5">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

	</table>
</body>
</html>