<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setContentType("application/vnd.ms-excel;charset=EUC-KR");
	String fileNm = "전시행사 참가신청서";
	String fileEncode = java.net.URLEncoder.encode(fileNm, "UTF8");
	response.setHeader("Content-Disposition", "attachment; filename="+fileEncode+".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
	<title>전시행사 참가신청서</title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>전시행사 참가신청서</h3></td>
		</tr>
		<tr height="30">
			<td align="center" width="200" style="background:#F0F0F0;">제조업여부</td>
			<td align="left" width="500"><c:out value="${mberInfo.mfcrtrYn}" /></td>
			<td align="center" width="200" style="background:#F0F0F0;">중소기업 여부</td>
			<td align="left" width="500"><c:out value="${mberInfo.mfcrtrYn}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">회사명</td>
			<td align="left" colspan="3"><c:out value="${mberInfo.cmpnyNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">대표자</td>
			<td align="left"><c:out value="${mberInfo.rprsntv}" /></td>
			<td align="center" style="background:#F0F0F0;">사업자등록번호</td>
			<td align="left"><c:out value="${mberInfo.bizNum}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">소재지</td>
			<td align="left"><c:out value="${mberInfo.locplc}" /></td>
			<td align="center" style="background:#F0F0F0;">설립일자</td>
			<td align="left">
				<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">종업원수</td>
			<td align="left"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/> 명</td>
			<td align="center" style="background:#F0F0F0;">홈페이지</td>
			<td align="left"><c:out value="${mberInfo.hmpg}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">담당자 성명</td>
			<td align="left"><c:out value="${mberInfo.chargerNm}" /></td>
			<td align="center" style="background:#F0F0F0;">담당자 부서/직위</td>
			<td align="left"><c:out value="${mberInfo.chargerDept}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">담당자 직통전화</td>
			<td align="left"><c:out value="${mberInfo.chargerTlphon}" /></td>
			<td align="center" style="background:#F0F0F0;">팩스</td>
			<td align="left"><c:out value="${mberInfo.fax}" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background:#F0F0F0;">담당자 이메일</td>
			<td align="left"><c:out value="${mberInfo.chargerEmail}" /></td>
			<td align="center" style="background:#F0F0F0;">자본금</td>
			<td align="left"><fmt:formatNumber value="${ExbiCompReqInfo.capl}" type="number"/> 백만원</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">최근2년간 매출액</td>
			<td align="left" colspan="3">
				<c:out value="${ExbiCompReqInfo.salamtStdyy1}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.salamt1}" type="number"/> 백만원<br/>
				<c:out value="${ExbiCompReqInfo.salamtStdyy2}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.salamt2}" type="number"/> 백만원
			</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">수출실적</td>
			<td align="left" colspan="3">
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy1}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount1}" type="number"/> 천불<br/>
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy2}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount2}" type="number"/> 천불<br/>
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy3}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount3}" type="number"/> 천불
			</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">신청부스 수</td>
			<td align="left" colspan="3">
				<fmt:formatNumber  value="${ExbiCompReqInfo.reqstSpceCo}" type="number"/> 부스&nbsp;(1부스 : <fmt:formatNumber value="${ExbiCompReqInfo.spceByMg}" type="number"/>,&nbsp;총면적 : <fmt:formatNumber value="${ExbiCompReqInfo.spceByUnit}" type="number"/>)
			</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">목표실적</td>
			<td align="left" colspan="3">
				<strong>현장상담목표</strong> : <fmt:formatNumber  value="${ExbiCompReqInfo.sptCnsltGoalCo}" type="number"/> 건&nbsp; <fmt:formatNumber value="${ExbiCompReqInfo.sptCnsltGoalAmount}" type="number"/> 천불<br/>
				<strong>현장계약목표</strong> : <fmt:formatNumber  value="${ExbiCompReqInfo.sptPlanGoalCo}" type="number"/> 건&nbsp; <fmt:formatNumber value="${ExbiCompReqInfo.sptPlanGoalAmount}" type="number"/> 천불<br/>
				<strong>향후계약가능목표</strong> : <fmt:formatNumber  value="${ExbiCompReqInfo.afterCntrctPosblGoalCo}" type="number"/> 건&nbsp; <fmt:formatNumber value="${ExbiCompReqInfo.afterCntrctPosblGoalAmount}" type="number"/> 천불<br/>
			</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">동 전시회 참여횟수</td>
			<td align="left" colspan="3">
				금번 참가시 <strong><fmt:formatNumber value="${ExbiCompReqInfo.samenssExbiPartcptnCo}" type="number"/></strong>회째 참가임
			</td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">주력전시제품</td>
			<td align="left" colspan="3"><c:out value="${MfrcDspyPrduct}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">사업자등록증 사본</td>
			<td align="left" colspan="3"><c:out value="${ExbiCompReqInfo.xportAcmsltFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">수출실적증빙서류</td>
			<td align="left" colspan="3"><c:out value="${ExbiCompReqInfo.xportAcmsltFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">1차 참가비 입금증</td>
			<td align="left" colspan="3"><c:out value="${ExbiCompReqInfo.partcptAmountFileNm}" /></td>
		</tr>
		<tr height="30">
			<td align="center"style="background:#F0F0F0;">선택첨부</td>
			<td align="left" colspan="3"><c:out value="${ExbiCompReqInfo.etcAtchFileNm}" /></td>
		</tr>
		<tr></tr>
		<tr>
			<td align="center" colspan="4" style="background:#F0F0F0;"><h3>참가 규정 확인서</h3></td>
		</tr>
		<tr>
			<td align="left" colspan="4">
<strong>제 1조 : 참가신청 및 참가비 납부</strong><br />
1. 참가신청 최소면적은 1부스이다 . <br />
2. 참가신청금은 소정의 참가 신청서 제출 후 조합에서 지정하는 날짜까지 납부 하여야 한다.<br /><br />

<strong>제 2조 : 부스배정</strong><br />
1. 부스배정은 참가비 선금을 납부한 회사만 참여할 수 있으며, 조합이 지정한 기한 내 미납시 참가신청에서 제외될 수 있다.<br />
2. 조합은 효율적인 전시관 구성을 위해서 기 배정된 부스의 위치, 규모 등을 임의로 변경시킬 수 있으며, 참가회사는 변경 결과에 대한 이의제기나 보상을 요구할 수 없다.<br />
3. 1개의 부스를 2개 이상의 회사가 동시에 사용할 수 없으며, 조합의 사전 승인 없이 배정받은 전시면적의 일부 또는 전부를 타 회사에게 일체 전대 또는 참가회사 간에 상호 교환 할 수 없다.(이 사항을 준수치 않을 경우 조합은 참가 회사를 즉시 부스에서 철수 시킨다 또한 조합에서 주최하는 향후 타 전시회에 참가를 불허함)<br /><br />

<strong>제 3조 : 전시실 관리</strong><br />
1. 참가회사는 참가신청서에 명시한 전시품을 전시하고 상주요원을 배치하여야 한다.<br />
2. 전시물품 또는 관련 장비의 최종적인 관리 책임은 참가회사에 있으며, 조합은 이의 도난, 화재, 파손 등 전시장내에서 예상되는 각종 사고로 인한 일체의 재산상의 손실에 대해서 보상하지 않는다.<br />
※ 전시물품에 대한 보험 가입은 참가업체 임의로 한다.<br /><br />

<strong>제 4조 : 해약</strong><br />
1. 조합은 다음의 경우에 일방적으로 참가신청을 해지 할 수 있다.<br />
○ 참가회사가 참가비를 기한 내에 완납하지 않은 경우<br />
○ 참가회사가 일방적 의사로 참가를 취소할 경우<br />
○ 배정된 부스의 전부 또는 일부의 사용을 거부할 경우<br />
○ 참가회사가 참가규정을 준수하지 아니하거나, 한국관 추진에 저해를 하는 경우<br />
2. 위 1의 참가신청 해지시 참가회사가 납부한 참가비는 환불하지 아니한다. 또한 참가비 전액을 납부하여야 한다.<br />
3. 천재지변 등 부득이한 사정으로 전시회가 취소되거나 연기되었을 경우에는 조합의 결정에 따른다.<br />
4. 참가회사가 일방적 의사로 참가를 취소할 경우 향후 조합 및 정부관련 사업에 참여가 제한됨을 인지하고 다음과 같은 위약 규정에 따른다.<br />
○ 한국관 참여업체로 선정된 이후 참여업체의 일방적 취소 시: 참여업체는 부스비, 설치비등 전시 비용 일체를 조합에 납부하여야하고, 모든 비용을 기 납부 하였을 경우 반환되지 않는다.<br /><br />

<strong>제 5조 : 세부운영요강, 보충규정, 규정의 준수</strong><br />
1. 참가회사는 전시 주관사의 제반규정을 준수하여야 한다.<br />
2. (중소기업청-중소기업중앙회 지원 전시회의 경우) 참여 업체는 중소기업의 범주에 속하여야 하고, 중소기업자가 아님이 확인될 경우, 동전시회서 지원된 국비를 모두 반환하여야 한다. (신청시 중소기업이었다가, 사업기간(전시회 개최년도 3월~전시회 개최년도 다음해 2월)중 중소기업의 범주에서 벗어나게 될 경우 포함)<br /><br />

<strong>제 6조 : 규정의 해석</strong><br />
1. 본 규정의 해석에 관하여 조합과 참가회사 간에 이견이 있을 경우 조합의 해석과 결정에 우선적으로 따라야 한다. <br /><br />


위 규정을 준수할 것이며, 신청서 상 기재된 내용에 대하여는<br />
관련 지원사업 및 신용정보 제공에 활용하여도 이의가 없음을 확인합니다.    <br /><br />

<strong>한국조선해양기자재공업협동조합 이사장 귀하</strong><br />  <br />
<strong>참가규정 확인서에 동의합니다.</strong><br />  <br />
			</td>
		</tr>
	</table>
</body>
</html>