<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value=""/>
<form:input type="hidden" path="cnsltexhbGb" name="cnsltexhbGb" id="cnsltexhbGb" value=""/>
<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>

	<h4 class=""><i class="fas fa-edit"></i> 사업등록하기(상담)</h4>
	<p>
		<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
	</p>
	<div class="container mt-30 mb-30" >

		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">이전행사</label>
			</div>
			<div class="col-md-10">
				<form:select class="form-control form-control-sm" path="preCnsltexhbCd" id="preCnsltexhbCd" name="preCnsltexhbCd" OnChange="javascript:fn_PreCnsltData(this.value);">
					<form:option value="0">없음</form:option>
					<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
						<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
					</c:forEach>
				</form:select>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">행사명</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="eventNm" id="eventNm" name="eventNm" class="form-control" placeholder="행사명" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="rprsntv" class="col-form-label">행사기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="eventBeginDe" id="eventBeginDe" name="eventBeginDe" class="form-control form-control-sm datepicker wd-120" onChange="formatDate('eventBeginDe');" placeholder="행사시작일자" size="10" value=""/>
					</div>
					<div class="form-group text-center px-15 no-margin">~</div>
					<div class="form-group no-margin">
						<form:input path="eventClosDe" id="eventClosDe" name="eventClosDe" class="form-control form-control-sm datepicker wd-120" onChange="formatDate('eventClosDe');" placeholder="행사마감일자" size="10" value=""/>
					</div>
				</div>
			</div>
			<div class="col-md-2 fth">
				<label for="rprsntvEng" class="col-form-label">접수기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="rceptBeginDe" id="rceptBeginDe" name="rceptBeginDe" class="form-control form-control-sm datepicker wd-120" onChange="formatDate('rceptBeginDe');" placeholder="접수시작일자" size="10" value=""/>
					</div>
					<div class="form-group text-center px-15 no-margin">~</div>
					<div class="form-group no-margin">
						<form:input path="rceptClosDe" id="rceptClosDe" name="rceptClosDe" class="form-control form-control-sm datepicker wd-120" onChange="formatDate('rceptClosDe');" placeholder="접수마감일자" size="10" value=""/>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">장소</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="place" id="place" name="place" class="form-control" placeholder="장소" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">주관기관</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="mngeInstt" id="mngeInstt" name="mngeInstt" class="form-control" placeholder="주관기관" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">주최기관</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="insttNm" id="insttNm" name="insttNm" class="form-control" placeholder="주최기관" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">후원기관</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="suprtInstt" id="suprtInstt" name="suprtInstt" class="form-control" placeholder="후원기관" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">주요내용</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="mainCn" id="mainCn" rows="3">${CnsltMainCn}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">지원내용</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="sportCn" id="sportCn" rows="3">${CnsltSportCn}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerNm" class="col-form-label required">문의처</label>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-2 fth" >
							<label for="chargerNm" class="col-form-label required">담당자</label>
						</div>
						<div class="col-md-4" >
							<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" placeholder="담당자이름" value="" required="required" />
						</div>
						<div class="col-md-2 fth" >
							<label for="chargerNmEng" class="col-form-label">이메일</label>
						</div>
						<div class="col-md-4" >
							<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control" placeholder="ex) myname@example.net" data-email-msg="E-mail 형식에 맞지 않습니다." value=""/>
						</div>
					</div>

					<div class="bo-w-row row">
						<div class="col-md-2 fth">
							<label for="exbiChargerDept" class="col-form-label required">부서</label>
						</div>
						<div class="col-md-4">
							<form:input type="text" path="exbiChargerDept" id="exbiChargerDept" name="exbiChargerDept" class="form-control" placeholder="부서" value=""/>
						</div>
						<div class="col-md-2 fth">
							<label for="chargerDeptEng" class="col-form-label">직책</label>
						</div>
						<div class="col-md-4">
							<form:input type="text" path="exbiChargerOfcps" id="exbiChargerOfcps" name="exbiChargerOfcps" class="form-control" placeholder="직책" value=""/>
						</div>
					</div>

					<div class="bo-w-row row">
						<div class="col-md-2 fth no-b-border">
							<label for="chargerTlphon" class="col-form-label">문의처</label>
						</div>
						<div class="col-md-4 no-b-border">
							<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control" placeholder="전화" value=""/>
						</div>
						<div class="col-md-2 fth no-b-border">
							<label for="chargerDeptEng" class="col-form-label">팩스</label>
						</div>
						<div class="col-md-4 no-b-border">
							<form:input type="text" path="chargerFax" id="chargerFax" name="chargerFax" class="form-control" placeholder="팩스" value=""/>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="rcpmnyAcnut" class="col-form-label" >전년도 지원사업<br/>실적내용</label>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container h-100">
					<div class="bo-w-row h-100 row">
						<div class="col-md-2 fth no-b-border">
							<label for="rcpmnyAcnut" class="col-form-label required">상담액</label>
						</div>
						<div class="col-md-4 no-b-border">
							<form:input type="text" path="prevYearCnsltSum" id="prevYearCnsltSum" name="prevYearCnsltSum" class="form-control" placeholder="전년도사업상담액" value="" required="required" />
						</div>
						<div class="col-md-2 fth no-b-border">
							<label for="insttNmEng" class="col-form-label">참가업체수<br/><small>(국내업체/바이어)</small></label>
						</div>
						<div class="col-md-4 no-b-border p-0" >
							<div class="container">
								<div class="row">
									<div class="col-md-5 border-0">
										<form:input type="text" path="prevYearCompEnter" id="prevYearCompEnter" name="prevYearCompEnter" class="form-control" placeholder="전년도참가업체수(바이어)" value=""/>
									</div>
									<div class="col-md-1 border-0 text-center">
										/
									</div>
									<div class="col-md-5 border-0">
										<form:input type="text" path="domPrevYearCompEnter" id="domPrevYearCompEnter" name="domPrevYearCompEnter" class="form-control" placeholder="전년도참가업체수(국내업체)" value=""/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">첨부파일</label>
				<p>파일은 3개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.</p>
			</div>
			<div class="col-md-10">				
				<div class="container">
					<div class="row my-1">
						<div class="col-3">
							첨부파일1.hwp
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbAttchFileNm1" id="cnsltexhbAttchFileNm1"/>
						</div>
					</div>
					<div class="row my-1">
						<div class="col-3">
							첨부파일2.hwp
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbAttchFileNm2" id="attchefileNm2"/>
						</div>
					</div>
					<div class="row my-1">
						<div class="col-3">
							첨부파일3.hwp
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbAttchFileNm3" id="attchefileNm3"/>
						</div>
					</div>					
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">사진파일</label>
				<p>jpg, gif, png 등 이미지 형식의 파일만 올려 주십시요.<br />(단, 4개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.)</p>
			</div>
			<div class="col-md-10">
				<div class="container">
					<div class="row my-1">
						<div class="col-3">
							사진파일1.jpg
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbPhotoFileNm1" id="cnsltexhbPhotoFileNm1"/>
						</div>
					</div>
					<div class="row my-1">
						<div class="col-3">
							사진파일2.jpg
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbPhotoFileNm2" id="cnsltexhbPhotoFileNm2"/>
						</div>
					</div>
					<div class="row my-1">
						<div class="col-3">
							사진파일3.jpg
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbPhotoFileNm3" id="cnsltexhbPhotoFileNm3"/>
						</div>
					</div>					
					<div class="row my-1">
						<div class="col-3">
							사진파일4.jpg
						</div>
						<div class="col-9">
							<input type="file" name="cnsltexhbPhotoFileNm4" id="cnsltexhbPhotoFileNm4"/>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div><!-- div class="container mt-30 mb-30" -->