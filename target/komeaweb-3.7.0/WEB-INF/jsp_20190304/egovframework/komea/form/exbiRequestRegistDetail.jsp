<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 전시행사 참가신청내역</h5>
	<div class="container mb-10">

		<div class="bo-v-row border-top-3 row">
			<div class="col-md-2 fth">제조업 여부<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.mfcrtrYn}" /></div>
			<div class="col-md-2 fth">중소기업 여부<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.smlpzYn}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">회사명<span class="required"></span></div>
			<div class="col-md-10"><c:out value="${mberInfo.cmpnyNm}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">대표자<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.rprsntv}" /></div>
			<div class="col-md-2 fth">사업자등록번호<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.bizNum}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">소재지<span class="required"></span></div>
			<div class="col-md-4">
				<c:out value="${mberInfo.locplc}" />
			</div>
			<div class="col-md-2 fth">설립일자<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.fondDe}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">종업원수<span class="required"></span></div>
			<div class="col-md-4"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/> 명</div>
			<div class="col-md-2 fth">홈페이지<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.hmpg}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">담당자 성명<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.chargerNm}" /></div>
			<div class="col-md-2 fth">담당자 부서/직위<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.chargerDept}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">담당자 직통전화<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.chargerTlphon}" /></div>
			<div class="col-md-2 fth">팩스<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.fax}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">담당자 이메일<span class="required"></span></div>
			<div class="col-md-4"><c:out value="${mberInfo.chargerEmail}" /></div>
			<div class="col-md-2 fth">자본금<span class="required"></span></div>
			<div class="col-md-4"><fmt:formatNumber value="${ExbiCompReqInfo.capl}" type="number"/></div>
		</div>

		<div class="bo-v-row row">
			<div class="col-md-2 fth">최근2년간 매출액<span class="required"></span></div>
			<div class="col-md-10">
				<c:out value="${ExbiCompReqInfo.salamtStdyy1}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.salamt1}" type="number"/> (백만원)<br/>
				<c:out value="${ExbiCompReqInfo.salamtStdyy2}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.salamt2}" type="number"/> (백만원)
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">수출실적</div>
			<div class="col-md-10">
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy1}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount1}" type="number"/> (백만원)<br/>
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy2}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount2}" type="number"/> (백만원)<br/>
				<c:out value="${ExbiCompReqInfo.xportAcmsltStdyy3}" />년 : <fmt:formatNumber value="${ExbiCompReqInfo.xportAcmsltAmount3}" type="number"/> (백만원)<br/>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">신청부스 수</div>
			<div class="col-md-10">
				<fmt:formatNumber  value="${ExbiCompReqInfo.reqstSpceCo}" type="number"/> 부스 / 1부스 : <fmt:formatNumber value="${ExbiCompReqInfo.spceByMg}" type="number"/> / 총면적 : <fmt:formatNumber value="${ExbiCompReqInfo.spceByUnit}" type="number"/>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">목표실적</div>
			<div class="col-md-10">
				현장상담목표 : <fmt:formatNumber  value="${ExbiCompReqInfo.sptCnsltGoalCo}" type="number"/> 건, <fmt:formatNumber value="${ExbiCompReqInfo.sptCnsltGoalAmount}" type="number"/> 천불<br/>
				현장계약목표 : <fmt:formatNumber  value="${ExbiCompReqInfo.sptPlanGoalCo}" type="number"/> 건, <fmt:formatNumber value="${ExbiCompReqInfo.sptPlanGoalAmount}" type="number"/> 천불<br/>
				향후계약가능목표 : <fmt:formatNumber  value="${ExbiCompReqInfo.afterCntrctPosblGoalCo}" type="number"/> 건, <fmt:formatNumber value="${ExbiCompReqInfo.afterCntrctPosblGoalAmount}" type="number"/> 천불<br/>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">동 전시회 참여 횟수<span class="required"></span></div>
			<div class="col-md-10"><fmt:formatNumber value="${ExbiCompReqInfo.samenssExbiPartcptnCo}" type="number"/></div>
		</div>

		<div class="bo-v-row row">
			<div class="col-md-2 fth">주력전시제품<span class="required"></span></div>
			<div class="col-md-10"><c:out value="${MfrcDspyPrduct}" />
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">사업자등록증사본<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${ExbiCompReqInfo.bsnmRsctftFilePath}','${ExbiCompReqInfo.bsnmRsctftFileNm}');" title="<c:out value="${ExbiCompReqInfo.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${ExbiCompReqInfo.bsnmRsctftFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">수출실적증빙서류<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${ExbiCompReqInfo.xportAcmsltFilePath}','${ExbiCompReqInfo.xportAcmsltFileNm}');" title="<c:out value="${ExbiCompReqInfo.xportAcmsltFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${ExbiCompReqInfo.xportAcmsltFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">1차 참가비 입금증<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${ExbiCompReqInfo.partcptAmountFilePath}','${ExbiCompReqInfo.partcptAmountFileNm}');" title="<c:out value="${ExbiCompReqInfo.partcptAmountFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${ExbiCompReqInfo.partcptAmountFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">선택첨부<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${ExbiCompReqInfo.etcAtchFilePath}','${ExbiCompReqInfo.etcAtchFileNm}');" title="<c:out value="${ExbiCompReqInfo.etcAtchFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${ExbiCompReqInfo.etcAtchFileNm}" /></a>
			</div>
		</div>
</div>