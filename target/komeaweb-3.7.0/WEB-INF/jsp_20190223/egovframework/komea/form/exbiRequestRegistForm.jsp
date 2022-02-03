<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){

	//제조업여부
	$('input:radio[name="mfcrtrYn"][value="<c:out value="${LoginUser.mfcrtrYn}"/>"]').prop("checked",true);
	//중소기업여부
	$('input:radio[name="smlpzYn"][value="<c:out value="${LoginUser.smlpzYn}"/>"]').prop("checked",true);
	//자본금
	$('#capl').val('<fmt:formatNumber value="${ExbiCompReq.capl}" type="number"/>');
	
});

function initTotalSpceByMg() {
	//총면적 = 신청부스수 * 1부스크기
	var cnt = $('#reqstSpceCo').val();
	var baseSize = $('#spceByMg').val();
	if(cnt > 0 ) {
		var sum = cnt * baseSize;
		$('#spceByUnit').val(sum.toFixed(2));
	} else {
		$('#spceByUnit').val('0');
	}
}
</script>
<form:input type="hidden" path="exbiCd" id="exbiCd" name="exbiCd" value="${code}" />
<form:input type="hidden" path="entrprsMberCd" name="entrprsMberCd" id="entrprsMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.mberCd}"/>
<form:input type="text" path="insttMberCd" name="insttMberCd" id="insttMberCd" value=""/>


		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label">제조업 여부</label>
			</div>
			<div class="col-md-4">
				<label class="form-check-label mr-20"><form:radiobutton path="mfcrtrYn" value="Y" /> 제조업</label>
				<label class="form-check-label mr-20"><form:radiobutton path="mfcrtrYn" value="N" /> 미제조업</label>
			</div>
			<div class="col-md-2 fth">
				<label for="us_sano1" class="col-form-label required">중소기업 여부</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<label class="form-check-label mr-20"><form:radiobutton path="smlpzYn" value="Y" /> 중소기업</label>
					</div>
					<div class="form-group text-center px-15 no-margin">
						<label class="form-check-label mr-20"><form:radiobutton path="smlpzYn" value="N" /> 기타</label>
					</div>
					<div class="form-group no-margin">
						<button type="button" onclick="openSmlpzWindow();" class="btn btn-xs btn-default" >자가진단 버튼</button>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="insttNm" class="col-form-label required">회사명</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control" value="${LoginUser.cmpnyNm}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">대표자</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control" value="${LoginUser.rprsntv}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">사업자등록번호</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="bizNum" id="bizNum" name="bizNum" class="form-control" value="${LoginUser.bizNum}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">소재지</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control" value="${LoginUser.locplc}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">설립일자</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control" value="${LoginUser.fondDe}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">종업원수</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="emplyCo" id="emplyCo" name="emplyCo" class="form-control w-50" value="${LoginUser.emplyCo}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">홈페이지</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control" value="${LoginUser.hmpg}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 성명</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" value="${LoginUser.chargerNm}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">담당자 부서/직위</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control" value="${LoginUser.chargerDept}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 직통전화</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control" value="${LoginUser.chargerTlphon}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">팩스</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="fax" id="fax" name="fax" class="form-control" value="${LoginUser.fax}" required="required" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 이메일</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control" value="${LoginUser.chargerEmail}" required="required" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">자본금</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="capl" id="capl" name="capl" class="form-control" value="${ExbiCompReq.capl}" required="required" />
					</div>
					<div class="form-group no-margin pl-15 w-50">
						백만원
					</div>
				</div>
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
									<form:input type="text" path="salamt1" id="salamt1" name="salamt1" class="form-control wd-80" value="0" required="required" />
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
									<form:input type="text" path="salamt2" id="salamt2" name="salamt2" class="form-control wd-80" value="0" required="required" />
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
				<label for="chargerDept" class="col-form-label">수출실적</label>
			</div>
			<div class="col-md-10 no-padding">
				<p class="pl-15 pt-15">
					최근 3년간의 수출실적을 적어 주시기 바랍니다.(*증빙첨부必)
				</p>
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-12 no-b-border">
							<div class="form-row pl-5 pr-5">
								<div class="form-group no-margin">
									<form:select path="xportAcmsltStdyy1" id="xportAcmsltStdyy1" name="xportAcmsltStdyy1" class="form-control" > 
					                    <c:forEach var="i" begin="2015" end="2020" step="1" > 
					                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}</option> 
					                    </c:forEach> 
					                </form:select>
								</div>
								<div class="form-group no-margin px-20">
									년
								</div>
								<div class="form-group no-margin px-15">
									<form:input type="text" path="xportAcmsltAmount1" id="xportAcmsltAmount1" name="xportAcmsltAmount1" class="form-control wd-80" value="0" required="required" />
								</div>
								<div class="form-group no-margin">
									천불
								</div>
							</div>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-12 no-b-border">
							<div class="form-row pl-5 pr-5">
								<div class="form-group no-margin">
									<form:select path="xportAcmsltStdyy2" id="xportAcmsltStdyy2" name="xportAcmsltStdyy2" class="form-control" > 
					                    <c:forEach var="i" begin="2015" end="2020" step="1" > 
					                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}</option> 
					                    </c:forEach> 
					                </form:select>
								</div>
								<div class="form-group no-margin px-20">
									년
								</div>
								<div class="form-group no-margin px-15">
									<form:input type="text" path="xportAcmsltAmount2" id="xportAcmsltAmount2" name="xportAcmsltAmount2" class="form-control  wd-80" value="0" required="required" />
								</div>
								<div class="form-group no-margin">
									천불
								</div>
							</div>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-12 no-b-border">
							<div class="form-row pl-5 pr-5">
								<div class="form-group no-margin">
									<form:select path="xportAcmsltStdyy3" id="xportAcmsltStdyy3" name="xportAcmsltStdyy3" class="form-control" > 
					                    <c:forEach var="i" begin="2015" end="2020" step="1" > 
					                        <option value="${i}" <c:if test="${i == (now.year + 1900)}">selected</c:if> >${i}</option> 
					                    </c:forEach> 
					                </form:select>
								</div>
								<div class="form-group no-margin px-20">
									년
								</div>
								<div class="form-group no-margin px-15">
									<form:input type="text" path="xportAcmsltAmount3" id="xportAcmsltAmount3" name="xportAcmsltAmount3" class="form-control wd-80" value="0" required="required" />
								</div>
								<div class="form-group no-margin">
									천불
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label">신청부스 수</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin">
						<form:input type="text" path="reqstSpceCo" id="reqstSpceCo" name="reqstSpceCo" class="form-control wd-120" value="0" onkeyup="initTotalSpceByMg();" required="required" />
					</div>
					<div class="form-group no-margin text-left pr-15">
						부스
					</div>
					<div class="form-group no-margin text-right">
						1부스 = 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="spceByMg" id="spceByMg" name="spceByMg" class="form-control wd-120" value="0" required="required" />
					</div>
					<div class="form-group no-margin text-right pl-15">
						총면적 = 
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="spceByUnit" id="spceByUnit" name="spceByUnit" class="form-control wd-120" value="0" required="required" />
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">목표실적</label>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							현장상담목표
						</div>
						<div class="col-md-9">
								<div class="form-row pl-5 pr-5">
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptCnsltGoalCo" id="sptCnsltGoalCo" name="sptCnsltGoalCo" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptCnsltGoalAmount" id="sptCnsltGoalAmount" name="sptCnsltGoalAmount" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left">
										천불
									</div>
								</div>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							현장계약목표
						</div>
						<div class="col-md-9">
								<div class="form-row pl-5 pr-5">
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptPlanGoalCo" id="sptPlanGoalCo" name="sptPlanGoalCo" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptPlanGoalAmount" id="sptPlanGoalAmount" name="sptPlanGoalAmount" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left">
										천불
									</div>
								</div>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0 no-b-border">
							향후계약가능목표
						</div>
						<div class="col-md-9 no-b-border">
								<div class="form-row pl-5 pr-5">
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="afterCntrctPosblGoalCo" id="afterCntrctPosblGoalCo" name="afterCntrctPosblGoalCo" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="afterCntrctPosblGoalAmount" id="afterCntrctPosblGoalAmount" name="afterCntrctPosblGoalAmount" class="form-control wd-80" value="0" required="required" />
									</div>
									<div class="form-group no-margin text-left">
										천불
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="insttNm" class="col-form-label required">동 전시회 참여횟수</label>
			</div>
			<div class="col-md-10">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin pr-5">
						금번 참여시
					</div>
					<div class="form-group no-margin text-left pr-5">
						<form:input type="text" path="samenssExbiPartcptnCo" id="samenssExbiPartcptnCo" name="samenssExbiPartcptnCo" class="form-control wd-100" value="0" required="required" />
					</div>
					<div class="form-group no-margin text-right">
						회째 참가임.
					</div>
				</div>
				<span class="red pl20">* 동 전시회 정부지원사업 참가횟수임</span>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="insttNm" class="col-form-label required">주력전시제품</label>
			</div>
			<div class="col-md-10">
				<textarea class="form-control" name="mfrcDspyPrduct" id="mfrcDspyPrduct" rows="10">${MfrcDspyPrduct}</textarea>
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
							사업자등록증사본
						</div>
						<div class="col-md-9">
							<input type="file" name="file1" id="bsnmRsctftFileNm"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							수출실적증빙서류
						</div>
						<div class="col-md-9">
							<input type="file" name="file2" id="xportAcmsltFileNm"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							1차 참가비 입금증
						</div>
						<div class="col-md-9">
							<input type="file" name="file3" id="partcptAmountFileNm" />
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							선택첨부
						</div>
						<div class="col-md-9">
							<input type="file" name="file4" id="etcAtchFileNm"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div><!-- div class="container" -->


	<!-- 가입약관 { -->
	<!-- h3 class="card-title mt-50 mb-10"><i class="fas fa-check"></i> 참가 규정 확인서</h3 -->
	<h5 class="mt-50 mb-10"><i class="fas fa-check"></i> 참가 규정 확인서</h5>
	<div class="card bg-light" >
		<div class="card-body terms1" >
<!-- h5>참가 규정 확인서</h5>
<br / -->
<strong>제 1조 : 참가신청 및 참가비 납부</strong><br />
1. 참가신청 최소면적은 1부스이다 . <br />
2. 참가신청금은 소정의 참가 신청서 제출 후 조합에서 지정하는 날짜까지 납부 하여야 한다.<br /><br />

<strong>제 2조 : 부스배정</strong><br />
1. 부스배정은 참가비 선금을 납부한 회사만 참여할 수 있으며, 조합이 지정한 기한 내 미납시 참가신청에서 제외될 수 있다.<br />
2. 조합은 효율적인 전시관 구성을 위해서 기 배정된 부스의 위치, 규모 등을 임의로 변경시킬 수 있으며, 참가회사는 변경 결과에 대한 이의제기나 보상을 요구할 수 없다.<br />
3. 1개의 부스를 2개 이상의 회사가 동시에 사용할 수 없으며, 조합의 사전 승인 없이 배정받은 전시면적의 일부 또는 전부를 타 회사에게 일체 전대 또는 참가회사 간에 상호 교환 할 수 없다.(이 사항을 준수치 않을 경우 조합은 참가 회사를 즉시 부스에서 철수 시킨다 또한 조합에서 주최하는 향후 타 전시회에 참가를 불허함)<br /><br />

<strong>제 3조 : 전시실 관리</strong><br />
1. 참가회사는 참가신청서에 명시한 전시품을 전시하고 상주요원을 배치하여야 한다.<br />
2. 전시물품 또는 관련 장비의 최종적인 관리 책임은 참가회사에 있으며, 조합은 이의 도난, 화재, 파손 등 전시장내에서 예상되는 각종 사고로 인한 일체의 재산상의 손실에 대해서 보상하지 않는다.<br />
※ 전시물품에 대한 보험 가입은 참가업체 임의로 한다.<br /><br />

<strong>제 4조 : 해약</strong><br />
1. 조합은 다음의 경우에 일방적으로 참가신청을 해지 할 수 있다.<br />
○ 참가회사가 참가비를 기한 내에 완납하지 않은 경우<br />
○ 참가회사가 일방적 의사로 참가를 취소할 경우<br />
○ 배정된 부스의 전부 또는 일부의 사용을 거부할 경우<br />
○ 참가회사가 참가규정을 준수하지 아니하거나, 한국관 추진에 저해를 하는 경우<br />
2. 위 1의 참가신청 해지시 참가회사가 납부한 참가비는 환불하지 아니한다. 또한 참가비 전액을 납부하여야 한다.<br />
3. 천재지변 등 부득이한 사정으로 전시회가 취소되거나 연기되었을 경우에는 조합의 결정에 따른다.<br />
4. 참가회사가 일방적 의사로 참가를 취소할 경우 향후 조합 및 정부관련 사업에 참여가 제한됨을 인지하고 다음과 같은 위약 규정에 따른다.<br />
○ 한국관 참여업체로 선정된 이후 참여업체의 일방적 취소 시: 참여업체는 부스비, 설치비등 전시 비용 일체를 조합에 납부하여야하고, 모든 비용을 기 납부 하였을 경우 반환되지 않는다.<br /><br />

<strong>제 5조 : 세부운영요강, 보충규정, 규정의 준수</strong><br />
1. 참가회사는 전시 주관사의 제반규정을 준수하여야 한다.<br />
2. (중소기업청-중소기업중앙회 지원 전시회의 경우) 참여 업체는 중소기업의 범주에 속하여야 하고, 중소기업자가 아님이 확인될 경우, 동전시회서 지원된 국비를 모두 반환하여야 한다. (신청시 중소기업이었다가, 사업기간(전시회 개최년도 3월~전시회 개최년도 다음해 2월)중 중소기업의 범주에서 벗어나게 될 경우 포함)<br /><br />

<strong>제 6조 : 규정의 해석</strong><br />
1. 본 규정의 해석에 관하여 조합과 참가회사 간에 이견이 있을 경우 조합의 해석과 결정에 우선적으로 따라야 한다. <br /><br />


위 규정을 준수할 것이며, 신청서 상 기재된 내용에 대하여는<br />
관련 지원사업 및 신용정보 제공에 활용하여도 이의가 없음을 확인합니다.    <br /><br />  

<h5 class="text-center">한국조선해양기자재공업협동조합 이사장 귀하</h5>


		</div>
	</div>
	<!-- } 가입약관 -->

	<div class="section-text col-12 mt-20">
		<div class="form-group text-center">
			<div class="checkbox">
				<label>
					 참가규정 확인서에
					 <form:radiobutton path="agreYn" value="Y" class="ml-10" /> 동의합니다.
					 <form:radiobutton path="agreYn" value="N" class="ml-10" /> 동의하지 않습니다.
				</label>
			</div>
		</div>
		<div class="form-group text-center">
			<button type="submit" class="btn btn-primary" name="signup" onclick="javascript:fn_Insert();">신청하기</button>
			<button type="button" class="btn btn-secondary" name="nosignup" onclick="javascript:cancel();">취소</button>
		</div>
	</div>
		