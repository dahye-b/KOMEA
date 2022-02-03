<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	//종업원수
	$('#emplyCo').val('<fmt:formatNumber value="${LoginUser.emplyCo}" type="number"/>');
});
function checkedBuyerCd() {
	var checkedValue = "";
	var i = 0;
	$("input[name=checkBuyer]:checked").each(function() {
		if(i == 0) {
			checkedValue = $(this).val();
		}else{
			checkedValue = checkedValue + "," +$(this).val();
		}
		i ++;
	});
	$('#buyerCd').val(checkedValue);
}
</script>
<form:input type="hidden" path="cnsltexhbCd" id="cnsltexhbCd" name="cnsltexhbCd" value="${code}" />
<form:input type="hidden" path="entrprsMberCd" name="entrprsMberCd" id="entrprsMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value=""/>

<h5 class="mb-10" >회사소개</h5>
        <div class="container">
	<div class="bo-w-row border-top-3 row">
		<div class="col-md-2 fth">
			<label for="cmpnyNm" class="col-form-label required">회사명</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" value="${LoginUser.cmpnyNm}" />
		</div>
		<div class="col-md-2 fth">
			<label for="cmpnyNmEng" class="col-form-label">회사명 영문</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="cmpnyNmEng" id="cmpnyNmEng" name="cmpnyNmEng" class="form-control input-sm" value="${LoginUser.cmpnyNmEng}" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="rprsntv" class="col-form-label required">대표자</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control input-sm" value="${LoginUser.rprsntv}" />
		</div>
		<div class="col-md-2 fth">
			<label for="rprsntvEng" class="col-form-label">대표자 영문</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="rprsntvEng" id="rprsntvEng" name="rprsntvEng" class="form-control input-sm" value="${LoginUser.rprsntvEng}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="locplc" class="col-form-label required">소재지</label>
		</div>
		<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm mb-5" value="${LoginUser.locplc}"/>
					</div>
					<div class="form-group no-margin pl-15 w-50">
						<form:input type="text" path="locplcEng" id="locplcEng" name="locplcEng" class="form-control input-sm" value="${LoginUser.locplcEng}"/>
					</div>
				</div>				
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="locplc" class="col-form-label required">종업원수</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="emplyCo" id="emplyCo" name="emplyCo" class="form-control input-sm" value="0" onkeydown="invalidNumChk(this)"/>
		</div>
		<div class="col-md-2 fth">
			<label for="rprsntvEng" class="col-form-label">설립일</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control datepicker wd-120" value="${LoginUser.fondDe}" onChange="formatDate('fondDe');"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">대표전화</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="telno" id="telno" name="telno" class="form-control input-sm" value="${LoginUser.telno}" />
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">팩스</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="fax" id="fax" name="fax" class="form-control input-sm" value="${LoginUser.fax}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">홈페이지</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control input-sm" value="${LoginUser.hmpg}" />
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">이메일</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="reprsntEmail" id="reprsntEmail" name="reprsntEmail" class="form-control input-sm" value="${LoginUser.reprsntEmail}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">사업담당자 성명</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" value="${LoginUser.chargerNm}" />
					</div>
					<div class="form-group text-center no-margin pl-15 w-50">
						<form:input type="text" path="chargerNmEng" id="chargerNmEng" name="chargerNmEng" class="form-control input-sm" value="${LoginUser.chargerNmEng}" />
					</div>
				</div>			
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">사업담당자 부서</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" value="${LoginUser.chargerDept}" />
					</div>
					<div class="form-group text-center no-margin pl-15 w-50">
						<form:input type="text" path="chargerDeptEng" id="chargerDeptEng" name="chargerDeptEng" class="form-control input-sm" value="${LoginUser.chargerDeptEng}" />
					</div>
				</div>			
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerOfcps" class="col-form-label required">사업담당자 직위</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control input-sm" value="${LoginUser.chargerOfcps}"/>
					</div>
					<div class="form-group text-center pl-15 no-margin w-50">
						<form:input type="text" path="chargerOfcpsEng" id="chargerOfcpsEng" name="chargerOfcpsEng" class="form-control input-sm" value="${LoginUser.chargerOfcpsEng}"/>
					</div>
				</div>			
		</div>
		<div class="col-md-2 fth">
			<label for="chargerTlphon" class="col-form-label required">사업담당자 연락처</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" value="${LoginUser.chargerTlphon}" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerEmail" class="col-form-label required">사업담당자 이메일</label>
		</div>
		<div class="col-md-10">
			<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" value="${LoginUser.chargerEmail}" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerOfcps" class="col-form-label required">전년도 매출액(￦)</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="beforeYearSalamt" id="beforeYearSalamt" name="beforeYearSalamt" class="form-control input-sm" value="0" onkeydown="invalidNumChk(this)"/>
					</div>
					<div class="form-group no-margin pl-15 w-50">
						백만원
					</div>
				</div>
		</div>
		<div class="col-md-2 fth">
			<label for="chargerTlphon" class="col-form-label required">전년도 수출액($)</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="beforeYearXportAcmslt" id="beforeYearXportAcmslt" name="beforeYearXportAcmslt" class="form-control input-sm" value="0" onkeydown="invalidNumChk(this)" />
		</div>
	</div>
</div><!-- div class="container" -->


<h5 class="mt-30 mb-10" >제품소개</h5>

<div class="container">	
	<div class="bo-w-row border-top-3 row">
		<div class="col-md-2 fth">
			<label for="mainSkll" class="col-form-label required">제품세부분류</label>
		</div>
		<div class="col-md-10">
			<label class="form-check-label mr-20"><form:radiobutton path="productDetailGb" value="Machinery" /> Machinery</label>
			<label class="form-check-label mr-20"><form:radiobutton path="productDetailGb" value="Electric" /> Electric</label>
			<label class="form-check-label mr-20"><form:radiobutton path="productDetailGb" value="Hull" /> Hull</label>
			<label class="form-check-label mr-20"><form:radiobutton path="productDetailGb" value="Outfitting" /> Outfitting</label>
			<label class="form-check-label mr-20"><form:radiobutton path="productDetailGb" value="Etc" /> Etc</label>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">기본제품(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainPrduct" id="mainPrduct" rows="5">${MainPrduct}</textarea>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">기본제품(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainPrductEng" id="mainPrductEng" rows="5">${MainPrductEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">추가제품(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="addPrduct" id="addPrduct" rows="5">${AddPrduct}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">추가제품(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="addPrductEng" id="addPrductEng" rows="5">${AddPrductEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">특허/인증(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="patentCrtfc" id="patentCrtfc" rows="5">${PatentCrtfc}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">특허/인증(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="patentCrtfcEng" id="patentCrtfcEng" rows="5">${PatentCrtfcEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">주요거래처(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainBcnc" id="mainBcnc" rows="5">${MainBcnc}</textarea>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">주요거래처(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainBcncEng" id="mainBcncEng" rows="5">${MainBcncEng}</textarea>
		</div>
	</div>

	<!-- 바이어 리스트 체크박스 최대5개까지 선택가능. -->
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm" class="col-form-label required">상담신청 바이어 선택<br/>(업체당 5개사 선택가능)</label>
		</div>
		<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin pr-15">
						<form:input type="hidden" path="buyerCd" id="buyerCd" name="buyerCd" value="" class="form-control wd-150" />
					</div>
					<c:choose>
						<c:when test="${fn:length(buyerList) > 0}">
							<c:forEach var="buyerList" items="${buyerList}" varStatus="status">
							<div class="form-group no-margin pr-15">
								<input name="checkBuyer" class="input_check" type="checkbox" onclick="javascript:checkedBuyerCd();" value="${buyerList.buyerCd}" /> ${buyerList.entrpsNm}
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="form-group no-margin pr-15">
								선택가능한 바이어리스트가 없습니다.
							</div>
						</c:otherwise>
					</c:choose>
				</div>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm" class="col-form-label required">사업자등록증</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file1" id="bsnmRsctftFileNm" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">기본제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file2" id="basicProductFileNm" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">추가제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file3" id="addProductFileNm" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">제품카탈로그</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file4" id="prductCatlFileNm1" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">기타첨부</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file5" id="etcFileNm" />
		</div>
	</div>
</div><!-- div class="container" -->	

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

	<div class="section-text col-12 mt-20">
		<div class="form-group text-center">
			<div class="checkbox">
				<label>
					 본사업의 서약서에
					 <form:radiobutton path="agreYn" value="Y" class="ml-10" /> 동의합니다.
					 <form:radiobutton path="agreYn" value="N" class="ml-10" /> 동의하지 않습니다.
				</label>
			</div>
		</div>
		<div class="form-group text-center">
			<a class="btn btn-sm btn-primary" href="javascript:fn_Insert();" title="신청하기" >신청하기</a>
			<a class="btn btn-sm btn-secondary" href="javascript:fn_List();" title="취소" >취소</a>
		</div>
	</div>