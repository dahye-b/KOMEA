<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:input type="hidden" path="exbiCd" name="exbiCd" id="exbiCd" value=""/>
<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>

	<h4 class=""><i class="fas fa-edit"></i> 사업등록하기(전시)</h4>
	<p>
		<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
	</p>
	<div class="container mt-30 mb-30" ></div>

		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">이전행사</label>
			</div>
			<div class="col-md-10">
				<form:select class="form-control form-control-sm" path="preExbiCd" id="preExbiCd" name="preExbiCd" OnChange="javascript:fn_PreExbiData(this.value);">
					<form:option value="0">없음</form:option>
					<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
						<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
					</c:forEach>
				</form:select>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="insttNm" class="col-form-label required">전시회명(국문)</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="exbiNm" id="exbiNm" name="exbiNm" class="form-control" placeholder="전시회명(국문)" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="insttNmEng" class="col-form-label">전시회명(영문)</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="exbiNmEng" id="exbiNmEng" name="exbiNmEng" class="form-control" placeholder="기관명 영문" value=""/>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="rprsntv" class="col-form-label">개최기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="opmtBeginDe" id="opmtBeginDe" name="opmtBeginDe" class="form-control datepicker wd-120" onChange="formatDate('opmtBeginDe');" placeholder="개최시작일자" size="10" value=""/>
					</div>
					<div class="form-group text-center px-15 no-margin">
						~
					</div>
					<div class="form-group no-margin">
						<form:input path="opmtClosDe" id="opmtClosDe" name="opmtClosDe" class="form-control datepicker wd-120" onChange="formatDate('opmtClosDe');" placeholder="개최마감일자" size="10" value=""/>
					</div>
				</div>
			</div>
			<div class="col-md-2 fth">
				<label for="rprsntvEng" class="col-form-label">신청기간</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input path="rceptBeginDe" id="rceptBeginDe" name="rceptBeginDe" class="form-control datepicker wd-120" onChange="formatDate('rceptBeginDe');" placeholder="신청시작일자" size="10" value=""/>
					</div>
					<div class="form-group text-center px-15 no-margin">
						~
					</div>
					<div class="form-group no-margin">
						<form:input path="rceptClosDe" id="rceptClosDe" name="rceptClosDe" class="form-control datepicker wd-120" onChange="formatDate('rceptClosDe');" placeholder="신청마감일자" size="10" value=""/>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">개최장소</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="opmtPlace" id="opmtPlace" name="opmtPlace" class="form-control" placeholder="개최장소" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">개최주기</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="opmtCycle" id="opmtCycle" name="opmtCycle" class="form-control" placeholder="개최주기" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">주관사</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="mainInsttNm" id="mainInsttNm" name="mainInsttNm" class="form-control" placeholder="주관사" value="" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">홈페이지</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="homepage" id="homepage" name="homepage" class="form-control" placeholder="홈페이지" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">참가지원기관</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="supportOrganNm" id="supportOrganNm" name="supportOrganNm" class="form-control" placeholder="참가지원기관" value="" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">참가개요</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="mainSkll" id="mainSkll" rows="3">${ExbiMainSkll}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">지원내용</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="sportCn" id="sportCn" rows="3">${ExbiSportCn}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">참가신청방법</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="partcptReqstMth" id="partcptReqstMth" rows="3">${ExbiPartcptReqstMth}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">신청단위부스크기</label>
			</div>
			<div class="col-md-10">
				<div class="form-row">
					<div class="form-group col-md-9 no-margin">
						<form:input type="text" path="spceByMg" id="spceByMg" name="spceByMg" class="form-control" placeholder="지원내용" value="" required="required" />
					</div>
					<div class="form-group col-md-3 no-margin ">
						<form:select class="form-control form-control-sm" path="spceByUnit" id="spceByUnit" name="spceByUnit">
								<form:option value="sqm">sqm</form:option>
								<form:option value="sqf">sqf</form:option>
						</form:select>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="coPayamt1" class="col-form-label">납부금</label>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-2 fth no-b-border">
							<label for="insttNm" class="col-form-label required">1차납부금</label>
						</div>
						<div class="col-md-3 no-b-border">
							<form:input type="text" path="coPayamt1" id="coPayamt1" name="coPayamt1" class="form-control" placeholder="1차납부금" value="" required="required" />
						</div>
						<div class="col-md-2 fth no-b-border">
							<label for="insttNmEng" class="col-form-label">2차납부금</label>
						</div>
						<div class="col-md-3 no-b-border">
							<form:input type="text" path="coPayamt2" id="coPayamt2" name="coPayamt2" class="form-control" placeholder="2차납부금" value=""/>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">실적표기여부<br/>(전시회 개최, 한국관 참가)</label>
			</div>
			<div class="col-md-10">
				<form:radiobutton path="resultViewYn" value="Y" />  예
				<form:radiobutton path="resultViewYn" value="N" />  아니오
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">참가비 포함 사항</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="partcptInclsMatter" id="partcptInclsMatter" rows="3">${ExbiPartcptInclsMatter}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="rcpmnyAcnut" class="col-form-label">입금계좌정보</label>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-2 fth no-b-border">
							<label for="rcpmnyAcnut" class="col-form-label required">입금계좌</label>
						</div>
						<div class="col-md-4 no-b-border">
							<form:input type="text" path="rcpmnyAcnut" id="rcpmnyAcnut" name="rcpmnyAcnut" class="form-control" placeholder="입금계좌" value="" required="required" />
						</div>
						<div class="col-md-2 fth no-b-border">
							<label for="insttNmEng" class="col-form-label">예금주</label>
						</div>
						<div class="col-md-4 no-b-border">
							<form:input type="text" path="dpstr" id="dpstr" name="dpstr" class="form-control" placeholder="예금주" value=""/>
						</div>
					</div>
				</div>
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
				<label for="companyname" class="col-form-label">참고사항</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="noticeItems" id="noticeItems" rows="3">${ExbiNoticeItems}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">한국관참가규모</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="korPartcptScale" id="korPartcptScale" name="korPartcptScale" class="form-control" placeholder="한국관참가규모" value=""/>
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label">총상담실적</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="totalCounselResult" id="totalCounselResult" name="totalCounselResult" class="form-control" placeholder="총상담실적" value=""/>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">기타성과</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="etcResult" id="etcResult" rows="3">${ExbiEtcResult}</textarea>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">첨부파일</label>
				<p>파일은 3개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.</p>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							첨부파일1.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="attchefileNm" id="attchefileNm"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							첨부파일2.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="attchefileNm2" id="attchefileNm2"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0 no-b-border">
							첨부파일3.hwp
						</div>
						<div class="col-md-9 no-b-border">
							<input type="file" name="attchefileNm3" id="attchefileNm3"/>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">사진파일</label>
				<p>파일은 3개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.</p>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일1.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="exbiPhotoFileNm1" id="exbiPhotoFileNm1"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일2.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="exbiPhotoFileNm2" id="exbiPhotoFileNm2"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0 no-b-border">
							사진파일3.hwp
						</div>
						<div class="col-md-9 no-b-border">
							<input type="file" name="exbiPhotoFileNm3" id="exbiPhotoFileNm3"/>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<p>jpg, gif, png 등 이미지 형식의 파일만 올려 주십시요.<br />(단, 4개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.)</p>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일1.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="opmtAcmsltImageFileNm" id="opmtAcmsltImageFileNm"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일2.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="opmtAcmsltImageFileNm2" id="opmtAcmsltImageFileNm2"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일3.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="opmtAcmsltImageFileNm3" id="opmtAcmsltImageFileNm3"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0 no-b-border">
							사진파일4.hwp
						</div>
						<div class="col-md-9 no-b-border">
							<input type="file" name="opmtAcmsltImageFileNm4" id="opmtAcmsltImageFileNm4"/>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">한국관참가실적</label>
				<p>jpg, gif, png 등 이미지 형식의 파일만 올려 주십시요.<br />(단, 3개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.)</p>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일1.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="partcptAcmImageFileNm1" id="partcptAcmImageFileNm1"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사진파일2.hwp
						</div>
						<div class="col-md-9">
							<input type="file" name="partcptAcmImageFileNm2" id="partcptAcmImageFileNm2"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0 no-b-border">
							사진파일3.hwp
						</div>
						<div class="col-md-9 no-b-border">
							<input type="file" name="partcptAcmImageFileNm3" id="partcptAcmImageFileNm3"/>
						</div>
					</div>
				</div>
			</div>
		</div>

