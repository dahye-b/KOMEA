<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setContentType("application/vnd.ms-excel;charset=EUC-KR");
	String fileNm = "바이어관리 목록";
	String fileEncode = java.net.URLEncoder.encode(fileNm, "UTF8");
	response.setHeader("Content-Disposition", "attachment; filename="+fileEncode+".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
	<title>바이어관리</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
		<tr>
			<td align="center" colspan="7" style="background:#F0F0F0;"><h3>바이어관리 목록</h3></td>
		</tr>
		<tr>
			<td align="center" width="100" style="background:#F0F0F0;">바이어코드</td>
			<td align="center" width="200" style="background:#F0F0F0;">업체명</td>
			<td align="center" width="150" style="background:#F0F0F0;">국가</td>
			<td align="center" width="150" style="background:#F0F0F0;">연락처</td>
			<td align="center" width="150" style="background:#F0F0F0;">이메일</td>
			<td align="center" width="200" style="background:#F0F0F0;">홈페이지</td>
			<td align="center" width="150" style="background:#F0F0F0;">대표자</td>
		</tr>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="resultList" items="${resultList}" varStatus="status">
					<tr>
						<td align="center"><c:out value="${resultList.buyerCd}" /></td>
						<td align="center"><c:out value="${resultList.entrpsNm}" /></td>
						<td align="center"><c:out value="${resultList.nationNm}" /></td>
						<td align="center"><c:out value="${resultList.cttpc}" /></td>
						<td align="center"><c:out value="${resultList.email}" /></td>
						<td align="center"><c:out value="${resultList.hmpg}" /></td>
						<td align="center"><c:out value="${resultList.rprsntv}" /></td>
					</tr>
					</c:forEach>    
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

	</table>
</body>
</html>