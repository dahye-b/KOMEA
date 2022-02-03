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
	//제조업여부
	$('input:radio[name="mfcrtrYn"][value="<c:out value="${mberInfo.mfcrtrYn}"/>"]').prop("checked",true);
	//중소기업여부
	$('input:radio[name="smlpzYn"][value="<c:out value="${mberInfo.smlpzYn}"/>"]').prop("checked",true);
	//자본금
	$('#capl').val('<fmt:formatNumber value="${show.capl}" type="number"/>');
	//최근2년간 매출액
	$("#salamtStdyy1").val('<c:out value="${show.salamtStdyy1}"/>').attr("selected","selected");
	$('#salamt1').val('<fmt:formatNumber value="${show.salamt1}" type="number"/>');
	$("#salamtStdyy2").val('<c:out value="${show.salamtStdyy2}"/>').attr("selected","selected");
	$('#salamt2').val('<fmt:formatNumber value="${show.salamt2}" type="number"/>');
	//수출실적
	$("#xportAcmsltStdyy1").val('<c:out value="${show.xportAcmsltStdyy1}"/>').attr("selected","selected");
	$('#xportAcmsltAmount1').val('<fmt:formatNumber value="${show.xportAcmsltAmount1}" type="number"/>');
	$("#xportAcmsltStdyy2").val('<c:out value="${show.xportAcmsltStdyy2}"/>').attr("selected","selected");
	$('#xportAcmsltAmount2').val('<fmt:formatNumber value="${show.xportAcmsltAmount2}" type="number"/>');
	$("#xportAcmsltStdyy3").val('<c:out value="${show.xportAcmsltStdyy3}"/>').attr("selected","selected");
	$('#xportAcmsltAmount13').val('<fmt:formatNumber value="${show.xportAcmsltAmount3}" type="number"/>');
	//신청부스 수
	$('#reqstSpceCo').val('<fmt:formatNumber value="${show.reqstSpceCo}" type="number"/>');
	$('#spceByMg').val('<fmt:formatNumber value="${show.spceByMg}" type="number"/>');
	$('#spceByUnit').val('<fmt:formatNumber value="${show.spceByUnit}" type="number"/>');
	//목표실적
	$('#sptCnsltGoalCo').val('<fmt:formatNumber value="${show.sptCnsltGoalCo}" type="number"/>');
	$('#sptCnsltGoalAmount').val('<fmt:formatNumber value="${show.sptCnsltGoalAmount}" type="number"/>');
	$('#sptPlanGoalCo').val('<fmt:formatNumber value="${show.sptPlanGoalCo}" type="number"/>');
	$('#sptPlanGoalAmount').val('<fmt:formatNumber value="${show.sptPlanGoalAmount}" type="number"/>');
	$('#afterCntrctPosblGoalCo').val('<fmt:formatNumber value="${show.afterCntrctPosblGoalCo}" type="number"/>');
	$('#afterCntrctPosblGoalAmount').val('<fmt:formatNumber value="${show.afterCntrctPosblGoalAmount}" type="number"/>');
	//동 전시회 참여 횟수
	$('#samenssExbiPartcptnCo').val('<fmt:formatNumber value="${show.samenssExbiPartcptnCo}" type="number"/>');

	//지난 2년간 매출액 년도세팅
	$(document.body).on('change',"#salamtStdyy1",function (e) {
		   //doStuff
		   var optVal= $("#salamtStdyy1 option:selected").val();
		   $("#salamtStdyy2").val(parseInt(optVal)+1).attr("selected","selected");
	});
	//지난 3년간 매출실적 년도세팅
	$(document.body).on('change',"#xportAcmsltStdyy1",function (e) {
		   var optVal= $("#xportAcmsltStdyy1 option:selected").val();
		   $("#xportAcmsltStdyy2").val(parseInt(optVal)+1).attr("selected","selected");
		   $("#xportAcmsltStdyy3").val(parseInt(optVal)+2).attr("selected","selected");
	});
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
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value=""/>
<form:input type="hidden" path="agreYn" name="agreYn" id="agreYn" value=""/>

<div class="container bo-w">

		<div class="bo-w-row border-top-3 row">
			<div class="col-md-2 fth">
				<label for="companyname" class="col-form-label required">제조업 여부</label>
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
						<!-- <a class="btn btn-sm btn-success" href="javascript:openSmlpzWindow();" title="자가진단" >자가진단</a> -->
					</div>
				</div>
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="insttNm" class="col-form-label required">회사명</label>
			</div>
			<div class="col-md-10">
				<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control" value="${mberInfo.cmpnyNm}" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">대표자</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control" value="${mberInfo.rprsntv}" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">사업자등록번호</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="bizNum" id="bizNum" name="bizNum" class="form-control" value="${mberInfo.bizNum}" onkeydown="invalidNumChk(this)" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">소재지</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control" value="${mberInfo.locplc}" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">설립일자</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control datepicker wd-120" value="${mberInfo.fondDe}" onChange="formatDate('fondDe');" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">종업원수</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="emplyCo" id="emplyCo" name="emplyCo" class="form-control w-50" value="${mberInfo.emplyCo}" onkeydown="invalidNumChk(this)" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">홈페이지</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control" value="${mberInfo.hmpg}" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 성명</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" value="${mberInfo.chargerNm}" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">담당자 부서/직위</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control" value="${mberInfo.chargerDept}" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 직통전화</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control" value="${mberInfo.chargerTlphon}" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">팩스</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="fax" id="fax" name="fax" class="form-control" value="${mberInfo.fax}" />
			</div>
		</div>

		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="chargerDept" class="col-form-label required">담당자 이메일</label>
			</div>
			<div class="col-md-4">
				<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control" value="${mberInfo.chargerEmail}" />
			</div>
			<div class="col-md-2 fth">
				<label for="chargerDeptEng" class="col-form-label required">자본금</label>
			</div>
			<div class="col-md-4">
				<div class="form-row pl-5 pr-5">
					<div class="form-group no-margin w-50">
						<form:input type="text" path="capl" id="capl" name="capl" class="form-control" value="" onkeydown="invalidNumChk(this)" />
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
									<form:input type="text" path="xportAcmsltAmount1" id="xportAcmsltAmount1" name="xportAcmsltAmount1" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
									<form:input type="text" path="xportAcmsltAmount2" id="xportAcmsltAmount2" name="xportAcmsltAmount2" class="form-control  wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
									<form:input type="text" path="xportAcmsltAmount3" id="xportAcmsltAmount3" name="xportAcmsltAmount3" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
						<form:input type="text" path="reqstSpceCo" id="reqstSpceCo" name="reqstSpceCo" class="form-control wd-120" value="0" onkeyup="initTotalSpceByMg();" onkeydown="invalidNumChk(this)" />
					</div>
					<div class="form-group no-margin text-left pr-15">
						부스
					</div>
					<div class="form-group no-margin text-right">
						1부스 =
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="spceByMg" id="spceByMg" name="spceByMg" class="form-control wd-120" value="0" onkeyup="initTotalSpceByMg();" onkeydown="invalidNumChk(this)" />
					</div>
					<div class="form-group no-margin text-right pl-15">
						총면적 =
					</div>
					<div class="form-group no-margin">
						<form:input type="text" path="spceByUnit" id="spceByUnit" name="spceByUnit" class="form-control wd-120" value="0" onkeydown="invalidNumChk(this)" />
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
										<form:input type="text" path="sptCnsltGoalCo" id="sptCnsltGoalCo" name="sptCnsltGoalCo" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptCnsltGoalAmount" id="sptCnsltGoalAmount" name="sptCnsltGoalAmount" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
										<form:input type="text" path="sptPlanGoalCo" id="sptPlanGoalCo" name="sptPlanGoalCo" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="sptPlanGoalAmount" id="sptPlanGoalAmount" name="sptPlanGoalAmount" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
										<form:input type="text" path="afterCntrctPosblGoalCo" id="afterCntrctPosblGoalCo" name="afterCntrctPosblGoalCo" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
									</div>
									<div class="form-group no-margin text-left pr-20">
										건
									</div>
									<div class="form-group no-margin pr-15">
										<form:input type="text" path="afterCntrctPosblGoalAmount" id="afterCntrctPosblGoalAmount" name="afterCntrctPosblGoalAmount" class="form-control wd-80" value="0" onkeydown="invalidNumChk(this)" />
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
						<form:input type="text" path="samenssExbiPartcptnCo" id="samenssExbiPartcptnCo" name="samenssExbiPartcptnCo" class="form-control wd-100" value="0" onkeydown="invalidNumChk(this)" />
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

		<div class="bo-w-row row mb-20">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">첨부파일</label>
				<p>10MB 이하의 파일만 올려 주십시요.</p>
			</div>
			<div class="col-md-10 no-padding">
				<div class="container">
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							사업자등록증사본
						</div>
						<div class="col-md-9">
							<input type="file" name="file1" id="bsnmRsctftFileNm"/>
							<c:if test="${show.bsnmRsctftFileNm != null}">
								<a href="javascript:fn_downloadFile('${show.bsnmRsctftFilePath}','${show.bsnmRsctftFileNm}');" title="<c:out value="${show.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.bsnmRsctftFileNm}" /></a>
							</c:if>
							<input type="hidden" id="file1Nm" name="file1Nm" value="${show.bsnmRsctftFileNm}"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							수출실적증빙서류
						</div>
						<div class="col-md-9">
							<input type="file" name="file2" id="xportAcmsltFileNm"/>
							<c:if test="${show.xportAcmsltFileNm != null}">
								<a href="javascript:fn_downloadFile('${show.xportAcmsltFilePath}','${show.xportAcmsltFileNm}');" title="<c:out value="${show.xportAcmsltFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.xportAcmsltFileNm}" /></a>
							</c:if>
							<input type="hidden" id="file2Nm" name="file2Nm" value="${show.xportAcmsltFileNm}"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							1차 참가비 입금증
						</div>
						<div class="col-md-9">
							<input type="file" name="file3" id="partcptAmountFileNm" />
							<c:if test="${show.partcptAmountFileNm != null}">
								<a href="javascript:fn_downloadFile('${show.partcptAmountFilePath}','${show.partcptAmountFileNm}');" title="<c:out value="${show.partcptAmountFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.partcptAmountFileNm}" /></a>
							</c:if>
							<input type="hidden" id="file3Nm" name="file3Nm" value="${show.partcptAmountFileNm}"/>
						</div>
					</div>
					<div class="bo-w-row row">
						<div class="col-md-3 border-right-0">
							선택첨부
						</div>
						<div class="col-md-9">
							<input type="file" name="file4" id="etcAtchFileNm"/>
							<c:if test="${show.etcAtchFileNm != null}">
								<a href="javascript:fn_downloadFile('${show.etcAtchFilePath}','${show.etcAtchFileNm}');" title="<c:out value="${show.etcAtchFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.etcAtchFileNm}" /></a>
							</c:if>
							<input type="hidden" id="file4Nm" name="file4Nm" value="${show.etcAtchFileNm}"/>
						</div>
					</div>
				</div>
			</div>
		</div>
</div><!-- div class="container bo-w" -->
