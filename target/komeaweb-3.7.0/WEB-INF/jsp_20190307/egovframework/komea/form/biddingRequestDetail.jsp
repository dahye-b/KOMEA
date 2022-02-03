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
	var ssbyp_arr = $.trim("${mberInfo.ssbypGb}").split(",");
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
</script>

	<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 입찰공고 신청서</h5>
	<a href="#" class="btn btn-sm btn-secondary" role="button">선정 및 계약 절차</a>

	<div class="container mb-10">

			<div class="bo-v-row border-top-3 row">
				<div class="col-md-2 fth">가입유형</div>
				<div class="col-md-10">
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
			<div class="bo-v-row row">
				<div class="col-md-2 fth">상호명</div>
				<div class="col-md-4"><c:out value="${mberInfo.rprsntv}" /></div>
				<div class="col-md-2 fth">상호명 영문</div>
				<div class="col-md-4"><c:out value="${mberInfo.fondDe}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">대표자</div>
				<div class="col-md-10"><c:out value="${mberInfo.bizNum}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">대표전화</div>
				<div class="col-md-4"><c:out value="${mberInfo.postCode}" /></div>
				<div class="col-md-2 fth">팩스</div>
				<div class="col-md-4"><c:out value="${mberInfo.workCnt}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">아이디</div>
				<div class="col-md-4"><c:out value="${mberInfo.id}" /></div>
				<div class="col-md-2 fth">이메일</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerNm}" /></div>
			</div>			
			<div class="bo-v-row row">
				<div class="col-md-2 fth">담당자 이름</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerTlphon}" /></div>
				<div class="col-md-2 fth">담당자 부서</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">담당자 직책</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerTlphon}" /></div>
				<div class="col-md-2 fth">담당자 연락처</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">담당자 휴대폰</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerTlphon}" /></div>
				<div class="col-md-2 fth">담당자 이메일</div>
				<div class="col-md-4"><c:out value="${mberInfo.chargerEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">소재지</div>
				<div class="col-md-10">
					<c:out value="${mberInfo.mainPrduct}" /> <br/>
					<c:out value="${mberInfo.mainPrduct}" />
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">주요 업무</div>
				<div class="col-md-10"><c:out value="${MainSkll}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기타사항</div>
				<div class="col-md-10"><c:out value="${EtcMatter}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">사업자등록증</div>
				<div class="col-md-10">
					<c:if test="${show.bsnmRsctftFileNm != null}">
						<a href="javascript:fn_downloadFile('${show.bsnmRsctftFilePath}','${show.bsnmRsctftFileNm}');" title="<c:out value='${show.bsnmRsctftFileNm}' />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.bsnmRsctftFileNm}" /></a>
					</c:if>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">사업관련자료</div>
				<div class="col-md-10">
					<c:if test="${show.biddingFileNm != null}">
						<a href="javascript:fn_downloadFile('${show.biddingFilePath}','${show.biddingFileNm}');" title="<c:out value='${show.biddingFileNm}' />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.biddingFileNm}" /></a>
					</c:if>
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">기타자료</div>
				<div class="col-md-10">
					<c:if test="${show.etcFileNm != null}">
						<a href="javascript:fn_downloadFile('${show.etcFilePath}','${show.etcFileNm}');" title="<c:out value='${show.etcFileNm}' />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${show.etcFileNm}" /></a>
					</c:if>
				</div>
			</div>
	</div>
</div>