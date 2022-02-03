<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value=""/>
<form:input type="hidden" path="cnsltexhbGb" name="cnsltexhbGb" id="cnsltexhbGb" value=""/>
<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="oldYn" name="oldYn" id="oldYn" value="Y"/>

	<h4 class=""><i class="fas fa-edit"></i> 지난행사이전</h4>
	<p>
		<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
	</p>
	<div class="container mt-30 mb-30" >

		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">행사명</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="eventNm" id="eventNm" name="eventNm" class="form-control" placeholder="행사명" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="eventBeginDe" id="eventBeginDe" name="eventBeginDe" class="form-control datepicker wd-120" placeholder="기간시작일자" size="10" value="" style="width:120px;" />
					</div>
					<div class="form-group text-center px-15 no-margin">
						~
					</div>
					<div class="form-group no-margin">
						<form:input path="eventClosDe" id="eventClosDe" name="eventClosDe" class="form-control datepicker wd-120" placeholder="기간마감일자" size="10" value=""  style="width:120px;" />
					</div>
				</div>
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">장소</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="place" id="place" name="place" class="form-control" placeholder="장소" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">주관기관</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="mngeInstt" id="mngeInstt" name="mngeInstt" class="form-control" placeholder="주관기관" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">주최기관</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="insttNm" id="insttNm" name="insttNm" class="form-control" placeholder="주최기관" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">후원기관</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="suprtInstt" id="suprtInstt" name="suprtInstt" class="form-control" placeholder="후원기관" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">개최규모</label>
			</div>
			<div class="col-md-10">

			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">총 상담실적</label>
			</div>
			<div class="col-md-8">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="cnsltCnt" id="cnsltCnt" name="cnsltCnt" class="form-control wd-60" placeholder="상담실적 건수" value="" required="required" />
					</div>
					<div class="form-group text-center px-15 no-margin">
						건 / 계약추진액 :
					</div>
					<div class="form-group text-center pr-5 no-margin">
						US$ 
					</div>
					<div class="form-group no-margin">								
							<form:input type="text" path="cntrctPrtnAfterAmtSum" id="cntrctPrtnAfterAmtSum" name="cntrctPrtnAfterAmtSum" class="form-control wd-120 " placeholder="계약추진액" value="" required="required" />
					</div>
					<div class="form-group no-margin pl-15">
							<form:input type="text" path="cnsltAmtSum" id="cnsltAmtSum" name="cnsltAmtSum" class="form-control wd-120" placeholder="상담액" value="" required="required" />
					</div>
				</div>
			</div>	
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">기타성과</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="resultEtc" id="resultEtc" rows="3"></textarea>
			</div>
		</div>

	</div>
