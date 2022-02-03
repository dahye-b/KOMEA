<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String flag = request.getParameter("flag");
%>
<script type="text/javascript">
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

<div class="bo-w-row border-top-3 row">
	<div class="col-md-2 fth">
		<label for="ssbypGb1" class="col-form-label required">기업유형</label>
	</div>
	<div class="col-md-10">
			<span class="mr-20" >기타회원</span>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="01" name="ssbyp_gb" id="ssbypGb1" onclick="javascript:checkedSsbypGb();" class="form-check-input" >
				<label for="ssbypGb1" class="form-check-label" >여행사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="02" name="ssbyp_gb" id="ssbypGb2" onclick="javascript:checkedSsbypGb();" class="form-check-input" >
				<label for="ssbypGb2" class="form-check-label" >장치사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="03" name="ssbyp_gb" id="ssbypGb3" onclick="javascript:checkedSsbypGb();" class="form-check-input" >
				<label for="ssbypGb3" class="form-check-label" >운송사</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="checkbox" value="04" name="ssbyp_gb" id="ssbypGb4" onclick="javascript:checkedSsbypGb();" class="form-check-input" >
				<label for="ssbypGb4" class="form-check-label" >기타</label>
				<form:input type="hidden" path="ssbypGb" id="ssbypGb" name="ssbypGb" value="" />
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
		<label for="fax" class="col-form-label">팩스</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fax" id="fax" name="fax" class="form-control input-sm" placeholder="051-123-4567" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="bizNum" class="col-form-label required">사업자등록번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="bizNum" id="bizNum" name="bizNum" class="form-control input-sm" placeholder="사업자등록번호" value="" required="required" />
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
		<label for="id" class="col-form-label required">아이디</label>
	</div>
	<div class="col-md-4">
	<% if(flag.equals("Edit")){ %>
		${mberVO.id}
	<%}else{ %>
		<form:input type="text" path="id" id="id" name="id" class="form-control input-sm" placeholder="아이디" value="" required="required" /> 
	<%}%>
	</div>
	<div class="col-md-6">
	<% if(!flag.equals("Edit")){ %>
		<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_IdCheck();">중복확인</button>
		<p>
			<font color="red"><form:errors path="id"/></font>
		</p><!-- 아이디 중복 여부 메세지 -->
	<%} %>
	</div>
</div>
	<% if(flag.equals("Join")){ %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="password" class="col-form-label required">비밀번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="password" path="password" id="password" name="password" class="form-control input-sm" placeholder="비밀번호" value="" required="required" />
		<p>
			6자리 이상의 영문/숫자 조합
		</p>
	</div>
	<div class="col-md-2 fth">
		<label for="cfm_password" class="col-form-label required">비밀번호 확인</label>
	</div>
	<div class="col-md-4">
		<input type="password" id="cfm_password" name="cfm_password" class="form-control input-sm" placeholder="비밀번호 확인" value="" required="required" />
	</div>
</div>
	<%} %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerNm" class="col-form-label required">담당자 이름</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" placeholder="담당자이름" value="" required="required" />
	</div>
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label">담당자 부서</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" placeholder="담당자부서" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerOfcps" class="col-form-label">담당자 직책</label>
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
		<label for="locplc" class="col-form-label">소재지</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm" placeholder="소재지" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="locplcEng" class="col-form-label">소재지 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="locplcEng" id="locplcEng" name="locplcEng" class="form-control input-sm" placeholder="소재지 영문" value=""/>
	</div>
</div>

<h5 class="mt-30 mb-10" >제품 및 기타정보</h5>
<div class="bo-w-row border-top-1 row">
	<div class="col-md-2 fth">
		<label for="mainSkll" class="col-form-label required">주요업무</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainSkll" id="mainSkll" rows="3" required="required"></textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="etcMatter" class="col-form-label">기타사항</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="etcMatter" id="etcMatter" rows="3"></textarea>
	</div>
</div>
	<% if(flag.equals("Join")){ %>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm" class="col-form-label required">회사소개서</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="file_nm" id="file_nm" required="required" />
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label required">재무제표</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="file_nm2" id="file_nm2" required="required" />
				<p>재무제표는 최근 2년 실적현황으로 첨부 해주세요.</p>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm3" class="col-form-label">기타첨부<br />(카탈로그, 인증서 등)</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="file_nm3" id="file_nm3"/>
			</div>
		</div>
<% }else{ %>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm" class="col-form-label required">회사소개서</label>
			</div>
			<div class="col-md-10">
				<a href="<c:out value="${mberVO.fileCours}" />" title="<c:out value="${mberVO.fileNm}" />" ><i class="fas fa-paperclip text-info"></i> ${mberVO.fileNm}</a>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label required">재무제표</label>
			</div>
			<div class="col-md-10">
				<a href="<c:out value="${mberVO.fileCours2}" />" title="<c:out value="${mberVO.fileNm2}" />" ><i class="fas fa-paperclip text-info"></i> ${mberVO.fileNm2}</a>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm3" class="col-form-label">기타첨부<br />(카탈로그, 인증서 등)</label>
			</div>
			<div class="col-md-10">
				<a href="<c:out value="${mberVO.fileCours3}" />" title="<c:out value="${mberVO.fileNm3}" />" ><i class="fas fa-paperclip text-info"></i> ${mberVO.fileNm3}</a>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="etcMatter" class="col-form-label">회원탈퇴</label>
			</div>
			<div class="col-md-10">
				회원탈퇴는 관리자에게 문의주시기 바랍니다.  (Tel. 051-972-6470)
			</div>
		</div>
<%}%>