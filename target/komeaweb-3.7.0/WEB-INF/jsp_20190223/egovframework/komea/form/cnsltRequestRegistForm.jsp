<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	//상시근로자 수
	$('#capl').val('<fmt:formatNumber value="${LoginUser.workCnt}" type="number"/>');
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
<form:input type="text" path="insttMberCd" name="insttMberCd" id="insttMberCd" value=""/>

<h5 class="mb-10" >회사소개</h5>
        <div class="container">
	<div class="bo-w-row border-top-3 row">
		<div class="col-md-2 fth">
			<label for="cmpnyNm" class="col-form-label required">회사명</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" value="${LoginUser.cmpnyNm}" required="required" />
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
			<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control input-sm" value="${LoginUser.rprsntv}" required="required" />
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
			<label for="locplc" class="col-form-label required">상시근로자 수</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="workCnt" id="workCnt" name="workCnt" class="form-control input-sm" value="0"/>
		</div>
		<div class="col-md-2 fth">
			<label for="rprsntvEng" class="col-form-label">설립일</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control input-sm" value="${LoginUser.fondDe}" maxlength="8"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">대표전화</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="telno" id="telno" name="telno" class="form-control input-sm" value="${LoginUser.telno}" required="required" />
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
			<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control input-sm" value="${LoginUser.hmpg}" required="required" />
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
						<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" value="${LoginUser.chargerNm}" required="required" />
					</div>
					<div class="form-group text-center no-margin pl-15 w-50">
						<form:input type="text" path="chargerNmEng" id="chargerNmEng" name="chargerNmEng" class="form-control input-sm" value="${LoginUser.chargerNmEng}" required="required" />
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
			<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" value="${LoginUser.chargerTlphon}" required="required" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerEmail" class="col-form-label required">사업담당자 이메일</label>
		</div>
		<div class="col-md-10">
			<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" value="${LoginUser.chargerEmail}" required="required" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerOfcps" class="col-form-label required">전년도 매출액(￦)</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="beforeYearSalamt" id="beforeYearSalamt" name="beforeYearSalamt" class="form-control input-sm" value="0"/>
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
			<form:input type="text" path="beforeYearXportAcmslt" id="beforeYearXportAcmslt" name="beforeYearXportAcmslt" class="form-control input-sm" value="0" required="required" />
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
						<form:input type="text" path="buyerCd" id="buyerCd" name="buyerCd" value="" class="form-control wd-150" />
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
			<input type="file" name="file1" id="bsnmRsctftFileNm" required="required" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">기본제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file2" id="basicProductFileNm" required="required" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">추가제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file3" id="addProductFileNm" required="required" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">제품카탈로그</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file4" id="prductCatlFileNm1" required="required" />
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">기타첨부</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file5" id="etcFileNm" required="required" />
		</div>
	</div>
</div><!-- div class="container" -->	


<div class="section-text col-12 mt-20">
	<div class="form-group text-center">
		<button type="submit" class="btn btn-primary" name="signup" onclick="javascript:fn_Insert();">신청하기</button>
		<button type="button" class="btn btn-secondary" name="nosignup" onclick="javascript:cancel();">취소</button>
	</div>
</div>

