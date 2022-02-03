<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="printArea">
	<div class="section-text col-12 mb-30 bo-v show" >

		<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 상담행사 참가신청서</h5>
		<div class="container mb-10">

			<div class="bo-v-row border-top-3 row bg-light">
				<div class="col-md-2 fth">회사명</div>
				<div class="col-md-4"><c:out value="${mberInfo.cmpnyNm}" /></div>
				<div class="col-md-2 fth">회사명 영문</div>
				<div class="col-md-4"><c:out value="${mberInfo.cmpnyNmEng}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">대표자</div>
				<div class="col-md-4"><c:out value="${mberInfo.rprsntv}" /></div>
				<div class="col-md-2 fth">대표자 영문</div>
				<div class="col-md-4"><c:out value="${mberInfo.rprsntvEng}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">소재지</div>
				<div class="col-md-10">
					<c:out value="${mberInfo.locplc}" /><br/>
					<c:out value="${mberInfo.locplcEng}" />
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">종업원수</div>
				<div class="col-md-4"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/> 명</div>
				<div class="col-md-2 fth">설립일</div>
				<div class="col-md-4">
					<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">대표전화</div>
				<div class="col-md-4"><c:out value="${mberInfo.telno}" /></div>
				<div class="col-md-2 fth">팩스</div>
				<div class="col-md-4"><c:out value="${mberInfo.fax}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">홈페이지</div>
				<div class="col-md-4"><c:out value="${mberInfo.hmpg}" /></div>
				<div class="col-md-2 fth">이메일</div>
				<div class="col-md-4"><c:out value="${mberInfo.reprsntEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">사업담당자 성명</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerNm}" />
					<c:out value="${mberInfo.chargerNmEng}" />
				</div>
				<div class="col-md-2 fth">사업담당자 부서</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerDept}" />
					<c:out value="${mberInfo.chargerDeptEng}" />
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">담당자이름</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerOfcps}" />
					<c:out value="${mberInfo.chargerOfcpsEng}" />
				</div>
				<div class="col-md-2 fth">담당자부서</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerTlphon}" />
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">사업담당자 이메일</div>
				<div class="col-md-10"><c:out value="${mberInfo.chargerEmail}" />
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">전년도 매출액(￦)</div>
				<div class="col-md-4">
					<fmt:formatNumber value="${mberInfo.beforeYearSalamt}" type="number"/> 백만원
				</div>
				<div class="col-md-2 fth">전년도 수출액($)</div>
				<div class="col-md-4">
					<fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/> $
				</div>
			</div>
		</div>

		<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 제품소개</h5>
		<div class="container mb-10">

			<div class="bo-v-row border-top-3 row">
				<div class="col-md-2 fth">제품세부분류</div>
				<div class="col-md-10"><c:out value="${CnsltCompReqInfo.productDetailGb}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기본제품(국문)<span class="required"></span></div>
				<div class="col-md-10">${MainPrduct}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기본제품(영문)<span class="required"></span></div>
				<div class="col-md-10">${MainPrductEng}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">추가제품(국문)<span class="required"></span></div>
				<div class="col-md-10">${AddPrduct}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">추가제품(국문)<span class="required"></span></div>
				<div class="col-md-10">${AddPrductEng}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">특허/인증(국문)<span class="required"></span></div>
				<div class="col-md-10">${PatentCrtfc}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">특허/인증(영문)<span class="required"></span></div>
				<div class="col-md-10">${PatentCrtfcEng}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">주요거래처(국문)<span class="required"></span></div>
				<div class="col-md-10">${MainBcnc}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">주요거래처(영문)<span class="required"></span></div>
				<div class="col-md-10">${MainBcncEng}</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">상담신청 바이어 선택<span class="required"></span><br/><small>(업체당 5개사 선택가능)</small></div>
				<div class="col-md-10"></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">사업자등록증<span class="required"></span></div>
				<div class="col-md-10">
					<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.bsnmRsctftFileCours}','${CnsltCompReqInfo.bsnmRsctftFileNm}');" title="<c:out value="${CnsltCompReqInfo.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.bsnmRsctftFileNm}" /></a>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기본제품이미지<span class="required"></span></div>
				<div class="col-md-10">
					<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.basicProductFileCours}','${CnsltCompReqInfo.basicProductFileNm}');" title="<c:out value="${CnsltCompReqInfo.basicProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.basicProductFileNm}" /></a>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">추가제품이미지<span class="required"></span></div>
				<div class="col-md-10">
					<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.addProductFileCours}','${CnsltCompReqInfo.addProductFileNm}');" title="<c:out value="${CnsltCompReqInfo.addProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.addProductFileNm}" /></a>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">제품카탈로그<span class="required"></span></div>
				<div class="col-md-10">
					<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.prductCatlFileCours1}','${CnsltCompReqInfo.prductCatlFileNm1}');" title="<c:out value="${CnsltCompReqInfo.prductCatlFileNm1}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.prductCatlFileNm1}" /></a>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기타첨부<span class="required"></span></div>
				<div class="col-md-10">
					<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.etcFileCours}','${CnsltCompReqInfo.etcFileNm}');" title="<c:out value="${CnsltCompReqInfo.etcFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.etcFileNm}" /></a>
				</div>
			</div>
		</div>

		<!-- 가입약관 { -->
		<!-- h3 class="card-title mt-50 mb-10"><i class="fas fa-check"></i> 참가 규정 확인서</h3 -->
		<h5 class="mt-50 mb-10"><i class="fas fa-check"></i> 서약서</h5>
		<div class="card bg-light" >
			<div class="card-body terms1" >
	<!-- h5>참가 규정 확인서</h5>
	<br / -->
	<strong>당사는 본 상담회에 한국조선해양기자재글로벌지원센터(KOMEC)의 지원으로 참가함에 있어 다음 사항을 준수할 것을 서약합니다. </strong><br />
	- 다음 -<br />

	1. 당사는 상담회의 원활한 운영을 위하여 글로벌지원센터에서 국내 및 해외 현지에서 요구하는 제반 요청사항에 대해 성실히 협조하며 상담회 기간 중, 현지의 법을 준수하고 국위를 손상하는 행위를 하지 않는다.<br />
	2. 당사는 상담회 기간 중, 상담 및 계약 등과 관련하여 부도덕한 상행위를 함으로써 참가 업체들에게 직․간접적 피해를 주는 행위를 하지 않는다.<br />
	3. 당사는 상담회 기간 중, 상담실적 및 설문 조사서를 글로벌지원센터의 소정 양식에 의거 작성하여 제출하며, 추후 계약실적 문의 및 사후관리에 대해서도 성실히 협조한다.<br /><br />
	4. 당사는 상담회 기간 중, 사고 또는 문제가 발생한 경우 이를 즉시 글로벌지원센터 담당자에게 통보하며 이의 해결을 위하여 적극 노력한다.<br />
	5. 당사는 상담회 참가에 있어 철저한 사전준비, 우수인력의 파견, 효과적인 상담진행 등 소기의 성과를 달성하기 위해 적극 노력한다.<br />
	6. 당사는 참가업체로 선정된 이후 정당한 사유 없이 상담회에 불참한 경우, 동 사업 참가를 위해 사전에 납부한 제반 경비(항공료 50% 등)의 반환을 요구하지 않고, 사후 글로벌지원센터 차년도 지원 사업에 참가제한 등 불이익을 감수한다.<br /><br />

	<h5 class="text-center">한국조선해양기자재글로벌지원센터장 귀중</h5>


			</div>
		</div>
		<!-- } 가입약관 -->

	</div>		
</div>
