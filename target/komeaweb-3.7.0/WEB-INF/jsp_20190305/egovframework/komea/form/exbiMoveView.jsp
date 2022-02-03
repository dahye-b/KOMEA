<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	//숫자처리
	$('#totalPartcptScale').val('<fmt:formatNumber value="${show.totalPartcptScale}" type="number"/>');
	$('#totalPartcptCnt').val('<fmt:formatNumber value="${show.totalPartcptCnt}" type="number"/>');
	$('#totalPartcptPeople').val('<fmt:formatNumber value="${show.totalPartcptPeople}" type="number"/>');
	
	$('#cnsltMoney').val('<fmt:formatNumber value="${show.cnsltMoney}" type="number"/>');
	$('#contractMoney').val('<fmt:formatNumber value="${show.contractMoney}" type="number"/>');
});
</script>
<form:input type="hidden" path="exbiCd" name="exbiCd" id="exbiCd" value=""/>
<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="oldYn" name="oldYn" id="oldYn" value="Y"/>
	<h4 class=""><i class="fas fa-edit"></i> 지난행사이전</h4>
	<p>
		<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
	</p>
	<div class="container mt-30 mb-30" ></div>

		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">전시회명</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="exbiNm" id="exbiNm" name="exbiNm" class="form-control" value=""  />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="opmtBeginDe" class="col-form-label">개최기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="opmtBeginDe" id="opmtBeginDe" name="opmtBeginDe" class="form-control datepicker wd-120" size="10" value="" onChange="formatDate('opmtBeginDe');"/>
					</div>
					<div class="form-group text-center px-15 no-margin">
						~
					</div>
					<div class="form-group no-margin">
						<form:input path="opmtClosDe" id="opmtClosDe" name="opmtClosDe" class="form-control datepicker wd-120" size="10" value="" onChange="formatDate('opmtClosDe');"/>
					</div>
				</div>
			</div>
			<div class="col-md-2 fth">
				<label for="opmtPlace" class="col-form-label">개최장소</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="opmtPlace" id="opmtPlace" name="opmtPlace" class="form-control" value=""  />
			</div>
		</div>


		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">행사장정보</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="placeInfo" id="placeInfo" name="placeInfo" class="form-control" value=""  />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">지원기관</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="supportOrganNm" id="supportOrganNm" name="supportOrganNm" class="form-control" value=""  />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">주최기관</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="mainInsttNm" id="mainInsttNm" name="mainInsttNm" class="form-control" value=""  />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">개최규모</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="totalPartcptScale" id="totalPartcptScale" name="totalPartcptScale" class="form-control wd-100" value="" />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						sq.m/sq.f
					</div>
					<div class="form-group text-center pl-15 pr-5 no-margin">
						참가업체수 : 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="totalPartcptCnt" id="totalPartcptCnt" name="totalPartcptCnt" class="form-control wd-100" value="" />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						개사
					</div>
					<div class="form-group text-center pl-15 pr-5 no-margin">
						참관객 : 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="totalPartcptPeople" id="totalPartcptPeople" name="totalPartcptPeople" class="form-control wd-100" value="" />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						명
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">Floor Plan</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="floorPlanFileNm" id="floorPlanFileNm"/>
				<c:if test="${show.floorPlanFileNm != null}">
					<i class="fas fa-paperclip text-info"></i> <c:out value="${show.floorPlanFileNm}" /> 
				</c:if>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">한국관 참가규모</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="korPartcptScaleNum" id="korPartcptScaleNum" name="korPartcptScaleNum" class="form-control wd-100" value=""/>
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						sq.m/sq.f
					</div>
					<div class="form-group text-center pl-15 pr-5 no-margin">
						한국관참가업체수 : 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="korPartcptCompCnt" id="korPartcptCompCnt" name="korPartcptCompCnt" class="form-control wd-100" value="" />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						개사
					</div>
					<div class="form-group text-center pl-15 pr-5 no-margin">
						한국관참가부스 : 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="korPartcptSpceCnt" id="korPartcptSpceCnt" name="korPartcptSpceCnt" class="form-control wd-100" value="" />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						부스
						<a href="javascript:consEnterCompList('0','${show.exbiCd}');" class="btn btn-sm btn-secondary" role="button">참가업체리스트</a>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">상담실적</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="cnsltCnt" id="cnsltCnt" name="cnsltCnt" class="form-control wd-100" value="" size="5"  />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						건 / 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="cnsltMoney" id="cnsltMoney" name="cnsltMoney" class="form-control wd-200" value="" size="5"  />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						US$
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">계약(추진)액</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="contractCnt" id="contractCnt" name="contractCnt" class="form-control wd-100" value="" size="5"  />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						건 / 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="contractMoney" id="contractMoney" name="contractMoney" class="form-control wd-200" value="" size="5"  />
					</div>
					<div class="form-group text-center pl-5 pr-15 no-margin">
						US$
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">기타성과</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="etcResult" id="etcResult" rows="3">${EtcResult}</textarea>
			</div>
		</div>