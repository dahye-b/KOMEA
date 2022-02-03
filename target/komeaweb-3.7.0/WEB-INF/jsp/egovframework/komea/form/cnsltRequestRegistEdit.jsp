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
	$('#emplyCo').val('<fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/>');
	//전년도 매출액(￦)
	$('#beforeYearSalamt').val('<fmt:formatNumber value="${mberInfo.beforeYearSalamt}" type="number"/>');
	//전년도 수출액($)
	$('#beforeYearXportAcmslt').val('<fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/>');
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
<form:input type="hidden" path="agreYn" name="agreYn" id="agreYn" value="Y"/>
<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value=""/>

<h5 class="mb-10" >회사소개</h5>

<div class="container bo-w">
	<div class="bo-w-row border-top-3 row">
		<div class="col-md-2 fth">
			<label for="cmpnyNm" class="col-form-label required">회사명</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" value="${mberInfo.cmpnyNm}" />
		</div>
		<div class="col-md-2 fth">
			<label for="cmpnyNmEng" class="col-form-label">회사명 영문</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="cmpnyNmEng" id="cmpnyNmEng" name="cmpnyNmEng" class="form-control input-sm" value="${mberInfo.cmpnyNmEng}" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="rprsntv" class="col-form-label required">대표자</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control input-sm" value="${mberInfo.rprsntv}" />
		</div>
		<div class="col-md-2 fth">
			<label for="rprsntvEng" class="col-form-label">대표자 영문</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="rprsntvEng" id="rprsntvEng" name="rprsntvEng" class="form-control input-sm" value="${mberInfo.rprsntvEng}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="locplc" class="col-form-label required">소재지</label>
		</div>
		<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm mb-5" value="${mberInfo.locplc}"/>
					</div>
					<div class="form-group no-margin pl-15 w-50">
						<form:input type="text" path="locplcEng" id="locplcEng" name="locplcEng" class="form-control input-sm" value="${mberInfo.locplcEng}"/>
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
			<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control datepicker wd-120" value="${mberInfo.fondDe}" onChange="formatDate('fondDe');"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">대표전화</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="telno" id="telno" name="telno" class="form-control input-sm" value="${mberInfo.telno}" />
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">팩스</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="fax" id="fax" name="fax" class="form-control input-sm" value="${mberInfo.fax}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">홈페이지</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control input-sm" value="${mberInfo.hmpg}" />
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">이메일</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="reprsntEmail" id="reprsntEmail" name="reprsntEmail" class="form-control input-sm" value="${mberInfo.reprsntEmail}"/>
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerNm" class="col-form-label required">사업담당자 성명</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" value="${mberInfo.chargerNm}" />
					</div>
					<div class="form-group text-center no-margin pl-15 w-50">
						<form:input type="text" path="chargerNmEng" id="chargerNmEng" name="chargerNmEng" class="form-control input-sm" value="${mberInfo.chargerNmEng}" />
					</div>
				</div>
		</div>
		<div class="col-md-2 fth">
			<label for="chargerDept" class="col-form-label required">사업담당자 부서</label>
		</div>
		<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" value="${mberInfo.chargerDept}" />
					</div>
					<div class="form-group text-center no-margin pl-15 w-50">
						<form:input type="text" path="chargerDeptEng" id="chargerDeptEng" name="chargerDeptEng" class="form-control input-sm" value="${mberInfo.chargerDeptEng}" />
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
						<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control input-sm" value="${mberInfo.chargerOfcps}"/>
					</div>
					<div class="form-group text-center pl-15 no-margin w-50">
						<form:input type="text" path="chargerOfcpsEng" id="chargerOfcpsEng" name="chargerOfcpsEng" class="form-control input-sm" value="${mberInfo.chargerOfcpsEng}"/>
					</div>
				</div>
		</div>
		<div class="col-md-2 fth">
			<label for="chargerTlphon" class="col-form-label required">사업담당자 연락처</label>
		</div>
		<div class="col-md-4">
			<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" value="${mberInfo.chargerTlphon}" />
		</div>
	</div>

	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="chargerEmail" class="col-form-label required">사업담당자 이메일</label>
		</div>
		<div class="col-md-10">
			<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" value="${mberInfo.chargerEmail}" />
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

<div class="container bo-w">
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
			<textarea class="form-control" name="mainPrduct" id="mainPrduct" rows="5">${mberInfo.mainPrduct}</textarea>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">기본제품(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainPrductEng" id="mainPrductEng" rows="5">${mberInfo.mainPrductEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">추가제품(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="addPrduct" id="addPrduct" rows="5">${mberInfo.addPrduct}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">추가제품(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="addPrductEng" id="addPrductEng" rows="5">${mberInfo.addPrductEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">특허/인증(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="patentCrtfc" id="patentCrtfc" rows="5">${mberInfo.patentCrtfc}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">특허/인증(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="patentCrtfcEng" id="patentCrtfcEng" rows="5">${mberInfo.patentCrtfcEng}</textarea>
		</div>
	</div><div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">주요거래처(국문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainBcnc" id="mainBcnc" rows="5">${mberInfo.mainBcnc}</textarea>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="insttNm" class="col-form-label required">주요거래처(영문)</label>
		</div>
		<div class="col-md-10">
			<textarea class="form-control" name="mainBcncEng" id="mainBcncEng" rows="5">${mberInfo.mainBcncEng}</textarea>
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
			<c:if test="${show.bsnmRsctftFileNm != null}">
				<a href="javascript:fn_downloadFile('${show.bsnmRsctftFileCours}','${show.bsnmRsctftFileNm}');" title="<c:out value="${show.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.bsnmRsctftFileNm}" /></a>
			</c:if>
			<input type="hidden" id="file1Nm" name="file1Nm" value="${show.bsnmRsctftFileNm}"/>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">기본제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file2" id="basicProductFileNm" />
			<c:if test="${show.basicProductFileNm != null}">
				<a href="javascript:fn_downloadFile('${show.basicProductFileCours}','${show.basicProductFileNm}');" title="<c:out value="${show.basicProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.basicProductFileNm}" /></a>
			</c:if>
			<input type="hidden" id="file2Nm" name="file2Nm" value="${show.basicProductFileNm}"/>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">추가제품이미지</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file3" id="addProductFileNm" />
			<c:if test="${show.addProductFileNm != null}">
				<a href="javascript:fn_downloadFile('${show.addProductFileCours}','${show.addProductFileNm}');" title="<c:out value="${show.addProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.addProductFileNm}" /></a>
			</c:if>
			<input type="hidden" id="file3Nm" name="file3Nm" value="${show.addProductFileNm}"/>
		</div>
	</div>
	<div class="bo-w-row row">
		<div class="col-md-2 fth">
			<label for="file_nm2" class="col-form-label required">제품카탈로그</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file4" id="prductCatlFileNm1" />
			<c:if test="${show.prductCatlFileNm1 != null}">
				<a href="javascript:fn_downloadFile('${show.prductCatlFileCours1}','${show.prductCatlFileNm1}');" title="<c:out value="${show.prductCatlFileNm1}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.prductCatlFileNm1}" /></a>
			</c:if>
			<input type="hidden" id="file4Nm" name="file4Nm" value="${show.prductCatlFileNm1}"/>
		</div>
	</div>
	<div class="bo-w-row row mb-20">
		<div class="col-md-2 fth">
			<label for="file_nm3" class="col-form-label">기타첨부</label>
		</div>
		<div class="col-md-10">
			<input type="file" name="file5" id="etcFileNm" />
			<c:if test="${show.bsnmRsctftFileNm != null}">
				<a href="javascript:fn_downloadFile('${show.bsnmRsctftFilePath}','${show.bsnmRsctftFileNm}');" title="<c:out value="${show.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.bsnmRsctftFileNm}" /></a>
			</c:if>
			<input type="hidden" id="file5Nm" name="file5Nm" value="${show.etcFileNm}"/>
		</div>
	</div>

</div><!-- div class="container" -->
