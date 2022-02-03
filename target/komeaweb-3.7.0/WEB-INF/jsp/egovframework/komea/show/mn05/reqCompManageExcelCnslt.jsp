<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setContentType("application/vnd.ms-excel;charset=EUC-KR");
	String fileNm = "상담행사 참가신청서";
	String fileEncode = java.net.URLEncoder.encode(fileNm, "UTF8");
	response.setHeader("Content-Disposition", "attachment; filename="+fileEncode+".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
	<title>상담행사 참가신청서</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>상담행사 참가신청서</h3></td>
		</tr>
		<tr height="30">
			<td align="center" width="200" style="background:#F0F0F0;">회사명</td>
			<td align="left" width="500"><c:out value="${mberInfo.cmpnyNm}" /></td>
			<td align="center" width="200" style="background:#F0F0F0;">회사명 영문</td>
			<td align="left" width="500"><c:out value="${mberInfo.cmpnyNmEng}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">대표자</td>
			<td align="left"><c:out value="${mberInfo.rprsntv}" /></td>
			<td align="center" style="background:#F0F0F0;">대표자 영문</td>
			<td align="left"><c:out value="${mberInfo.rprsntvEng}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">소재지</td>
			<td align="left" colspan="3">
				<c:out value="${mberInfo.locplc}" /><br/>
				<c:out value="${mberInfo.locplcEng}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">종업원수</td>
			<td align="left"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/> 명</td>
			<td align="center" style="background:#F0F0F0;">설립일</td>
			<td align="left">
				<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">대표전화</td>
			<td align="left"><c:out value="${mberInfo.telno}" /></td>
			<td align="center" style="background:#F0F0F0;">팩스</td>
			<td align="left"><c:out value="${mberInfo.fax}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">홈페이지</td>
			<td align="left"><c:out value="${mberInfo.hmpg}" /></td>
			<td align="center" style="background:#F0F0F0;">이메일</td>
			<td align="left"><c:out value="${mberInfo.reprsntEmail}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">사업담당자 성명</td>
			<td align="left">
				<c:out value="${mberInfo.chargerNm}" /> / 
				<c:out value="${mberInfo.chargerNmEng}" />
			</td>
			<td align="center" style="background:#F0F0F0;">사업담당자 부서</td>
			<td align="left">
				<c:out value="${mberInfo.chargerDept}" /> / 
				<c:out value="${mberInfo.chargerDeptEng}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">담당자이름</td>
			<td align="left">
				<c:out value="${mberInfo.chargerOfcps}" /> / 
				<c:out value="${mberInfo.chargerOfcpsEng}" />
			</td>
			<td align="center" style="background:#F0F0F0;">담당자연락처</td>
			<td align="left">
				<c:out value="${mberInfo.chargerTlphon}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">사업담당자 이메일</td>
			<td align="left" colspan="3">
				<c:out value="${mberInfo.chargerEmail}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">전년도 매출액(￦)</td>
			<td align="left">
				<fmt:formatNumber value="${mberInfo.beforeYearSalamt}" type="number"/> 백만원
			</td>
			<td align="center" style="background:#F0F0F0;">전년도 수출액($)</td>
			<td align="left">
				<fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/> $
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>제품소개</h3></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">제품세부분류</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.productDetailGb}" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">기본제품(국문)</td>
			<td align="left" colspan="3"><c:out value="${MainPrduct}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">기본제품(영문)</td>
			<td align="left" colspan="3"><c:out value="${MainPrductEng}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">추가제품(국문)</td>
			<td align="left" colspan="3"><c:out value="${AddPrduct}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">추가제품(영문)</td>
			<td align="left" colspan="3"><c:out value="${AddPrductEng}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">특허/인증(국문)</td>
			<td align="left" colspan="3"><c:out value="${PatentCrtfc}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">특허/인증(영문)</td>
			<td align="left" colspan="3"><c:out value="${PatentCrtfcEng}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">주요거래처(국문)</td>
			<td align="left" colspan="3"><c:out value="${MainBcnc}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">주요거래처(영문)</td>
			<td align="left" colspan="3"><c:out value="${MainBcncEng}" escapeXml="false" /></td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">상담신청 바이어</td>
			<td align="left" colspan="3">
			<c:choose>
				<c:when test="${fn:length(buyerList) > 0}">
					<c:forEach var="buyerList" items="${buyerList}" varStatus="status">
						<c:out value="${buyerList.entrpsNm}" /><br/>
					</c:forEach>
				</c:when>
				<c:otherwise>
						-
				</c:otherwise>
			</c:choose>
			</td>
		</tr>

		<tr height="30">
			<td align="center"style="background:#F0F0F0;">사업자등록증 사본</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.bsnmRsctftFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">기본제품이미지</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.basicProductFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">추가제품이미지</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.addProductFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">제품카탈로그</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.prductCatlFileNm1}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">기타첨부</td>
			<td align="left" colspan="3"><c:out value="${CnsltCompReqInfo.etcFileNm}" /></td>
		</tr>
		<tr></tr>
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>서약서</h3></td>
		</tr>
		<tr>
			<td align="left" colspan="4">
<strong>당사는 본 상담회에 한국조선해양기자재글로벌지원센터(KOMEC)의 지원으로 참가함에 있어 다음 사항을 준수할 것을 서약합니다. </strong><br />
- 다음 -<br />

1. 당사는 상담회의 원활한 운영을 위하여 글로벌지원센터에서 국내 및 해외 현지에서 요구하는 제반 요청사항에 대해 성실히 협조하며 상담회 기간 중, 현지의 법을 준수하고 국위를 손상하는 행위를 하지 않는다.<br />
2. 당사는 상담회 기간 중, 상담 및 계약 등과 관련하여 부도덕한 상행위를 함으로써 참가 업체들에게 직․간접적 피해를 주는 행위를 하지 않는다.<br />
3. 당사는 상담회 기간 중, 상담실적 및 설문 조사서를 글로벌지원센터의 소정 양식에 의거 작성하여 제출하며, 추후 계약실적 문의 및 사후관리에 대해서도 성실히 협조한다.<br /><br />
4. 당사는 상담회 기간 중, 사고 또는 문제가 발생한 경우 이를 즉시 글로벌지원센터 담당자에게 통보하며 이의 해결을 위하여 적극 노력한다.<br />
5. 당사는 상담회 참가에 있어 철저한 사전준비, 우수인력의 파견, 효과적인 상담진행 등 소기의 성과를 달성하기 위해 적극 노력한다.<br />
6. 당사는 참가업체로 선정된 이후 정당한 사유 없이 상담회에 불참한 경우, 동 사업 참가를 위해 사전에 납부한 제반 경비(항공료 50% 등)의 반환을 요구하지 않고, 사후 글로벌지원센터 차년도 지원 사업에 참가제한 등 불이익을 감수한다.<br /><br />

<strong>한국조선해양기자재글로벌지원센터장 귀중</strong>
			</td>
		</tr>
		<tr></tr>
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>신청서</h3></td>
		</tr>
		<tr height="30">
			<td align="left" colspan="4">
			* 본 자료는 바이어 제출용이므로 최종 확인 후 제출해주시면 감사하겠습니다.
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">TITLE</td>
			<td align="left" colspan="3">
				<c:out value="${CnsltCompReqInfo.eventNm}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Company Name</td>
			<td align="left">
				<c:out value="${mberInfo.cmpnyNm}" />
			</td>
			<td align="center" style="background:#F0F0F0;">President</td>
			<td align="left">
				<c:out value="${mberInfo.rprsntvEng}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Address</td>
			<td align="left" colspan="3">
				<c:out value="${CnsltCompReqInfo.locplcEng}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Establishment</td>
			<td align="left">
				<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
			</td>
			<td align="center" style="background:#F0F0F0;">Employees</td>
			<td align="left">
				<fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/>
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Tel</td>
			<td align="left">
				<c:out value="${mberInfo.telno}" />
			</td>
			<td align="center" style="background:#F0F0F0;">Fax</td>
			<td align="left">
				<c:out value="${mberInfo.fax}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Website</td>
			<td align="left">
				<c:out value="${mberInfo.hmpg}" />
			</td>
			<td align="center" style="background:#F0F0F0;">E-mail</td>
			<td align="left">
				<c:out value="${mberInfo.reprsntEmail}" />
			</td>
		</tr>

		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Contact Name</td>
			<td align="left">
				<c:out value="${mberInfo.chargerNmEng}" />
			</td>
			<td align="center" style="background:#F0F0F0;">Contact Dept./Position</td>
			<td align="left">
				<c:out value="${mberInfo.chargerDeptEng}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Contact Tel.</td>
			<td align="left">
				<c:out value="${mberInfo.chargerTlphon}" />
			</td>
			<td align="center" style="background:#F0F0F0;">Contact E-mail</td>
			<td align="left">
				<c:out value="${mberInfo.chargerEmail}" />
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">Annual Exports(3 Years)</td>
			<td align="left" colspan="3">
				<fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/> $
			</td>
		</tr>


		<tr height="150">
			<td align="center" style="background:#F0F0F0;">Main Product</td>
			<td align="left" colspan="3">
				<c:out value="${CnsltCompReqInfo.basicProductFileNm}" /><br/><br/>
				<c:out value="${MainPrductEng}" escapeXml="false" />
			</td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">Sub Product</td>
			<td align="left" colspan="3">
				<c:out value="${CnsltCompReqInfo.addProductFileNm}" /><br/><br/>
				<c:out value="${AddPrductEng}" escapeXml="false" />
			</td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">Certificate&License</td>
			<td align="left" colspan="3">
				<c:out value="${PatentCrtfcEng}" escapeXml="false" />
			</td>
		</tr>
		<tr height="150">
			<td align="center" style="background:#F0F0F0;">Major Customer</td>
			<td align="left" colspan="3">
				<c:out value="${MainBcncEng}" escapeXml="false" />
			</td>
		</tr>
	</table>
</body>
</html>