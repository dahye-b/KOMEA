<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setContentType("application/vnd.ms-excel;charset=EUC-KR");
	String fileNm = "회원관리 목록";
	String fileEncode = java.net.URLEncoder.encode(fileNm, "UTF8");
	response.setHeader("Content-Disposition", "attachment; filename="+fileEncode+".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
	<title>회원관리</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
		<tr>
			<td align="center" colspan="13" style="background:#F0F0F0;"><h3>회원관리 목록</h3></td>
		</tr>
		<tr>
			<td align="center" width="100" style="background:#F0F0F0;">아이디</td>
			<td align="center" width="100" style="background:#F0F0F0;">구분</td>
			<td align="center" width="250" style="background:#F0F0F0;">회사/기관명</td>
			<td align="center" width="150" style="background:#F0F0F0;">대표성명</td>
			<td align="center" width="150" style="background:#F0F0F0;">전화번호</td>
			<td align="center" width="200" style="background:#F0F0F0;">담당자</td>
			<td align="center" width="200" style="background:#F0F0F0;">담당자부서</td>
			<td align="center" width="200" style="background:#F0F0F0;">담당자직급</td>
			<td align="center" width="200" style="background:#F0F0F0;">담당자연락처</td>
			<td align="center" width="250" style="background:#F0F0F0;">담당자이메일</td>
			<td align="center" width="100" style="background:#F0F0F0;">승인여부</td>
			<td align="center" width="150" style="background:#F0F0F0;">등급현황</td>
			<td align="center" width="100" style="background:#F0F0F0;">조합원사여부</td>
		</tr>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="resultList" items="${resultList}" varStatus="status">
					<tr>
						<td align="center"><c:out value="${resultList.id}" /></td>
						<td align="center"><c:out value="${resultList.ssbypNm}" /></td>
						<td align="center"><c:out value="${resultList.cmpnyNm}" /></td>
						<td align="center"><c:out value="${resultList.rprsntv}" /></td>
						<td align="center"><c:out value="${resultList.telno}" /></td>
						<td align="center"><c:out value="${resultList.chargerNm}" /></td>
						<td align="center"><c:out value="${resultList.chargerDept}" /></td>
						<td align="center"><c:out value="${resultList.chargerOfcps}" /></td>
						<td align="center"><c:out value="${resultList.chargerTlphon}" /></td>
						<td align="center"><c:out value="${resultList.chargerEmail}" /></td>
						<td align="center"><c:out value="${resultList.sbscrbConfmYn}" /></td>
						<td align="center"><c:out value="${resultList.compLevelNm}" /></td>
						<td align="center"><c:out value="${resultList.unionCompYn}" /></td>
					</tr>
					</c:forEach>    
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="13">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

	</table>
</body>
</html>