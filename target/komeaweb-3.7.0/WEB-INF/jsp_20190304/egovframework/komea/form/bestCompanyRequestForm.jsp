<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	//지난 2년간 매출액 년도세팅
	$(document.body).on('change',"#salamtStdyy1",function (e) {
		   //doStuff
		   var optVal= $("#salamtStdyy1 option:selected").val();
		   $("#salamtStdyy2").val(parseInt(optVal)+1).attr("selected","selected");
	});
});
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
			<span class="mr-20" >기업회원</span>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="cmpnyNm" class="col-form-label required">회사명</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="cmpnyNmEng" class="col-form-label">회사명 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNmEng" id="cmpnyNmEng" name="cmpnyNmEng" class="form-control input-sm" value="" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="rprsntv" class="col-form-label required">대표자</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="rprsntvEng" class="col-form-label">대표자 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntvEng" id="rprsntvEng" name="rprsntvEng" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="rprsntv" class="col-form-label required">사업자등록번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="bizNum" id="bizNum" name="bizNum" class="form-control input-sm" value="" onkeydown="invalidNumChk(this)" />
	</div>
	<div class="col-md-2 fth">
		<label for="rprsntvEng" class="col-form-label">법인등록번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="corNum" id="corNum" name="corNum" class="form-control input-sm" value="" onkeydown="invalidNumChk(this)" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="locplc" class="col-form-label required">소재지</label>
	</div>
	<div class="col-md-10">
		<form:input type="text" path="postCode1" id="postCode1" name="postCode1" class="form-control input-sm" value="" size="5"/> - 
		<form:input type="text" path="postCode2" id="postCode2" name="postCode2" class="form-control input-sm" value=""/><br/>
		<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="locplc" class="col-form-label required">상시근로자 수</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="workCnt" id="workCnt" name="workCnt" class="form-control input-sm" value=""/> 
	</div>
	<div class="col-md-2 fth">
		<label for="rprsntvEng" class="col-form-label">설립일</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control datepicker wd-120" value="" onChange="formatDate('fondDe');" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label required">최근2년간 매출액</label>
	</div>
	<div class="col-md-10 no-padding">
		<div class="container">
			<div class="bo-w-row row">
				<div class="col-md-12 no-b-border">
					<div class="form-row pl-5 pr-5">
						<div class="form-group no-margin">
							<form:select path="salamtStdyy1" id="salamtStdyy1" name="salamtStdyy1" class="form-control" > 
			                    <c:forEach var="i" begin="2015" end="2020" step="1" > 
			                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}</option> 
			                    </c:forEach> 
			                </form:select>
						</div>
						<div class="form-group no-margin px-20">
							년
						</div>
						<div class="form-group no-margin px-15">
							<form:input type="text" path="salamt1" id="salamt1" name="salamt1" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
						</div>
						<div class="form-group no-margin">
							백만원
						</div>
					</div>
				</div>
			</div>
			<div class="bo-w-row row">
				<div class="col-md-12 no-b-border">
					<div class="form-row pl-5 pr-5">
						<div class="form-group no-margin">
							<form:select path="salamtStdyy2" id="salamtStdyy2" name="salamtStdyy2" class="form-control" > 
			                    <c:forEach var="i" begin="2015" end="2020" step="1" > 
			                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}</option> 
			                    </c:forEach> 
			                </form:select>
						</div>
						<div class="form-group no-margin px-20">
							년
						</div>
						<div class="form-group no-margin px-15">
							<form:input type="text" path="salamt2" id="salamt2" name="salamt2" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
						</div>
						<div class="form-group no-margin">
							백만원
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="ssbypGb1" class="col-form-label required">홈페이지</label>
	</div>
	<div class="col-md-10">
			<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerNm" class="col-form-label required">담당자 이름</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label required">담당자 부서</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerOfcps" class="col-form-label required">담당자 직책</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerTlphon" class="col-form-label required">담당자 직통전화</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerEmail" class="col-form-label required">담당자 이메일</label>
	</div>
	<div class="col-md-10">
		<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" value="" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="mainSkll" class="col-form-label required">주요 생산품목</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainPrduct" id="mainPrduct" rows="3">${MainPrduct}</textarea>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm" class="col-form-label required">신청서</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="applyFileNm" id="applyFileNm"/>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm2" class="col-form-label required">주요 생산품목 설명서</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="mainProductFileNm" id="mainProductFileNm"/>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm3" class="col-form-label">사업자 등록증 사본</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="rsctftFileNm" id="rsctftFileNm"/>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm2" class="col-form-label required">대표자이력서</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="careerFileNm" id="careerFileNm"/>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="file_nm3" class="col-form-label">개인정보수집 및 동의서</label>
	</div>
	<div class="col-md-10">
		<input type="file" name="agreeFileNm" id="agreeFileNm"/>
	</div>
</div>