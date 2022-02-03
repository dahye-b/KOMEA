<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	//기타회원 체크하기
	var ssbyp_arr = $.trim("${show.ssbypGb}").split(",");
	for(i=0; i < ssbyp_arr.length; i++) {
		if(ssbyp_arr[i] == '01'){
			$("input:checkbox[id='ssbypGb1']").prop("checked", true);
		}else if(ssbyp_arr[i] == '02'){
			$("input:checkbox[id='ssbypGb2']").prop("checked", true);
		}else if(ssbyp_arr[i] == '03'){
			$("input:checkbox[id='ssbypGb3']").prop("checked", true);
		}else if(ssbyp_arr[i] == '04'){
			$("input:checkbox[id='ssbypGb4']").prop("checked", true);
		}
	}
});
//기타회원 구분자 체크시 값세팅
function checkedSsbypGb() {
	var checkedValue = "";
	var i = 0;
	$("input[name=ssbyp_gb]:checked").each(function() {
		if(i == 0) {
			checkedValue = $(this).val();
		}else{
			checkedValue = checkedValue + "," +$(this).val();
		}
		i ++;
	});
	$('#ssbypGb').val(checkedValue);
}
</script>
<form:input type="hidden" path="ssbypGb" id="ssbypGb" name="ssbypGb" value="" />
<form:input type="hidden" path="bbsTy" id="bbsTy" name="bbsTy" value="${bbsTy}" />
<form:input type="hidden" path="registNo" id="registNo" name="registNo" value="${registNo}" />
<form:input type="hidden" path="bbscttNo" id="bbscttNo" name="bbscttNo" value="${bbscttNo}" />
<form:input type="hidden" path="mberCd" id="mberCd" name="mberCd" value="${loginInfo.mberCd}" />
<div class="bo-w-row border-top-3 row">
	<div class="col-md-2 fth">
		<label for="ssbypGb1" class="col-form-label required">기업유형</label>
	</div>
	<div class="col-md-10">
			<span class="mr-20" >기타회원</span>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="01" name="ssbyp_gb" id="ssbypGb1" class="form-check-input" >
				<label for="ssbypGb1" class="form-check-label" >여행사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="02" name="ssbyp_gb" id="ssbypGb2" class="form-check-input" >
				<label for="ssbypGb2" class="form-check-label" >장치사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="03" name="ssbyp_gb" id="ssbypGb3" class="form-check-input" >
				<label for="ssbypGb3" class="form-check-label" >운송사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="04" name="ssbyp_gb" id="ssbypGb4" class="form-check-input" >
				<label for="ssbypGb4" class="form-check-label" >기타</label>
			</div>											
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="cmpnyNm" class="col-form-label required">상호명</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" placeholder="상호명" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="cmpnyNmEng" class="col-form-label">상호명 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNmEng" id="cmpnyNmEng" name="cmpnyNmEng" class="form-control input-sm" placeholder="상호명 영문" value="" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="rprsntv" class="col-form-label required">대표자</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control input-sm" placeholder="대표자" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="rprsntvEng" class="col-form-label">대표자 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntvEng" id="rprsntvEng" name="rprsntvEng" class="form-control input-sm" placeholder="대표자 영문" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="telno" class="col-form-label required">대표전화</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="telno" id="telno" name="telno" class="form-control input-sm" placeholder="051-123-4567" value="" required="required"/>
	</div>
	<div class="col-md-2 fth">
		<label for="fax" class="col-form-label required">팩스</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fax" id="fax" name="fax" class="form-control input-sm" placeholder="051-123-4567" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="bizNum" class="col-form-label required">아이디</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="id" id="id" name="id" class="form-control input-sm" placeholder="아이디" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="reprsntEmail" class="col-form-label required">이메일</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="reprsntEmail" id="reprsntEmail" name="reprsntEmail" class="form-control input-sm" placeholder="이메일" value="" required="required" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerNm" class="col-form-label required">담당자 이름</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" placeholder="담당자이름" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label required">담당자 부서</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" placeholder="담당자부서" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerOfcps" class="col-form-label required">담당자 직책</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control input-sm" placeholder="담당자직책" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerTlphon" class="col-form-label required">담당자 연락처</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" placeholder="담당자연락처" value="" required="required" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerHp" class="col-form-label required">담당자 휴대폰</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerHp" id="chargerHp" name="chargerHp" class="form-control input-sm" placeholder="담당자휴대폰" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="chargerEmail" class="col-form-label required">담당자 이메일</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" placeholder="담당자이메일" value="" required="required" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="locplc" class="col-form-label required">소재지</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="postCode1" id="postCode1" name="postCode1" class="form-control input-sm" placeholder="우편번호1" value=""/> - 
		<form:input type="text" path="postCode2" id="postCode2" name="postCode2" class="form-control input-sm" placeholder="우편번호2" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="locplcEng" class="col-form-label required">소재지국문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm" placeholder="소재지" value=""/>
	</div>
</div>

<h5 class="mt-30 mb-10" >제품 및 기타정보</h5>
<div class="bo-w-row border-top-1 row">
	<div class="col-md-2 fth">
		<label for="mainSkll" class="col-form-label required">주요업무</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainSkll" id="mainSkll" rows="3" required="required">${MainSkll}</textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="etcMatter" class="col-form-label required">기타사항</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="etcMatter" id="etcMatter" rows="3">${EtcMatter}</textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm" class="col-form-label required">사업자등록증</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="bsnmRsctftFileNm" id="bsnmRsctftFileNm" required="required" />
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm2" class="col-form-label required">사업관련자료</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="biddingFileNm" id="biddingFileNm" required="required" />
		<p>사업관련자료 : 입찰시안, 계획서, 견적서, 실적자료 등을 첨부해서 올려주세요. 기타관련자료는 기타자료에 첨부해 주세요.</p>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm3" class="col-form-label">기타자료</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="etcFileNm" id="etcFileNm" required="required" />
	</div>
</div>
