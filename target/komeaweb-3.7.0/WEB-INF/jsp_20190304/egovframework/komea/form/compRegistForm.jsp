<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String flag = request.getParameter("flag");%>
<script type="text/javascript">
$(document).ready(function(){
	//전년도 수출실적
	$('#emplyCo').val('<fmt:formatNumber value="${mberVO.emplyCo}" type="number"/>');
	//전년도 매출액
	$('#beforeYearSalamt').val('<fmt:formatNumber value="${mberVO.beforeYearSalamt}" type="number"/>');
	//전년도 수출실적
	$('#beforeYearXportAcmslt').val('<fmt:formatNumber value="${mberVO.beforeYearXportAcmslt}" type="number"/>');
});
function fn_DateCheck() {
	$('#fondDe').val($('#fondDe').val().replace(/-/g,""));
}
</script>
<div class="bo-w-row border-top-3 row">
	<div class="col-md-2 fth">
		<label for="companyname" class="col-form-label">기업유형</label>
	</div>
	<div class="col-md-10">
		<label class="col-form-label" id="companyname">기업회원</label>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="cmpnyNm" class="col-form-label required">회사명</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNm" id="cmpnyNm" name="cmpnyNm" class="form-control input-sm" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="cmpnyNmEng" class="col-form-label">회사명 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="cmpnyNmEng" id="cmpnyNmEng" name="cmpnyNmEng" class="form-control input-sm" value=""/>
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
		<label for="id" class="col-form-label required">사업자등록번호</label>
	</div>
	<div class="col-md-4">
	<% if(flag.equals("Edit")){ %>
		${mberVO.id}
	<%}else{ %>
		<form:input type="text" path="id" id="id" name="id" class="form-control input-sm" value="" />
	<%}%>
		
	</div>
	<div class="col-md-6">
	<% if(flag.equals("Join")){ %>
		<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_IdCheck();">중복확인</button>
		<p> 기업회원은 사업자등록번호가 아이디가 됩니다.('-'은 제외해 주세요) <br/>
			<font color="red"><form:errors path="id"/></font>
		</p><!-- 아이디 중복 여부 메세지 -->
	<%}%>
	</div>
</div>
	<% if(flag.equals("Join")){ %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="password" class="col-form-label required">비밀번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="password" path="password" id="password" name="password" class="form-control input-sm" value=""/>
		<p>
			6자리 이상의 영문/숫자 조합
		</p>
	</div>
	<div class="col-md-2 fth">
		<label for="cfm_password" class="col-form-label required">비밀번호 확인</label>
	</div>
	<div class="col-md-4">
		<input type="password" id="cfm_password" name="cfm_password" class="form-control input-sm" value="" />
	</div>
</div>
	<%} %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="locplc" class="col-form-label required">소재지</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="locplc" id="locplc" name="locplc" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="locplcEng" class="col-form-label">소재지 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="locplcEng" id="locplcEng" name="locplcEng" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="fondDe" class="col-form-label required">설립일자</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fondDe" id="fondDe" name="fondDe" class="form-control input-sm datepicker" placeholder="달력을 선택하세요" value="" onChange="formatDate('fondDe');"/>
	</div>
	<div class="col-md-2 fth">
		<label for="emplyCo" class="col-form-label required">종업원수</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="emplyCo" id="emplyCo" name="emplyCo" class="form-control input-sm" value="" onkeydown="invalidNumChk(this)"/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="beforeYearSalamt" class="col-form-label required">전년도 매출액</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="beforeYearSalamt" id="beforeYearSalamt" name="beforeYearSalamt" class="form-control input-sm" value="" onkeydown="invalidNumChk(this)"/>
	</div>
	<div class="col-md-2 fth">
		<label for="beforeYearXportAcmslt" class="col-form-label required">전년도 수출실적</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="beforeYearXportAcmslt" id="beforeYearXportAcmslt" name="beforeYearXportAcmslt" class="form-control input-sm" value="" onkeydown="invalidNumChk(this)"/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="telno" class="col-form-label required">대표전화</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="telno" id="telno" name="telno" class="form-control input-sm" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="fax" class="col-form-label required">팩스</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fax" id="fax" name="fax" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="telno" class="col-form-label">홈페이지</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="reprsntEmail" class="col-form-label required">이메일</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="reprsntEmail" id="reprsntEmail" name="reprsntEmail" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerNm" class="col-form-label required">담당자이름</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control input-sm" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="chargerNmEng" class="col-form-label">담당자이름 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNmEng" id="chargerNmEng" name="chargerNmEng" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label">담당자부서</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerDeptEng" class="col-form-label">담당자부서 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDeptEng" id="chargerDeptEng" name="chargerDeptEng" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerOfcps" class="col-form-label">담당자직위</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerOfcpsEng" class="col-form-label">담당자직위 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerOfcpsEng" id="chargerOfcpsEng" name="chargerOfcpsEng" class="form-control input-sm" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerTlphon" class="col-form-label required">담당자전화</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerTlphon" id="chargerTlphon" name="chargerTlphon" class="form-control input-sm" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerEmail" class="col-form-label required">담당자이메일</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control input-sm" value="" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="us_company" class="col-form-label required">제조업 여부</label>
	</div>
	<div class="col-md-4">
		<label class="form-check-label mr-20"><form:radiobutton path="mfcrtrYn" value="Y" /> 제조업</label>
		<label class="form-check-label mr-20"><form:radiobutton path="mfcrtrYn" value="N" /> 미제조업</label>
	</div>
	<div class="col-md-2 fth">
		<label for="us_sano1" class="col-form-label required">중소기업 여부</label>
	</div>
	<div class="col-md-4">
		<label class="form-check-label mr-20"><form:radiobutton path="smlpzYn" value="Y" /> 중소기업</label>
		<label class="form-check-label mr-20"><form:radiobutton path="smlpzYn" value="N" /> 기타</label>
	</div>
</div>

<h5 class="mt-30 mb-10" >제품 및 기타정보</h5>
<div class="bo-w-row border-top-1 row">
	<div class="col-md-2 fth">
		<label for="mainPrduct" class="col-form-label required">메인제품(국문)</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainPrduct" id="mainPrduct" rows="3">${mberVO.mainPrduct}</textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="mainPrductEng" class="col-form-label required">메인제품(영문)</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainPrductEng" id="mainPrductEng" rows="3">${mberVO.mainPrductEng}</textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="patentCrtfc" class="col-form-label">특허/인증</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="patentCrtfc" id="patentCrtfc" rows="3">${mberVO.patentCrtfc}</textarea>
	</div>
</div>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="mainBcnc" class="col-form-label">주요거래처</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control form-control-sm" name="mainBcnc" id="mainBcnc" rows="3">${mberVO.mainBcnc}</textarea>
	</div>
</div>
	<% if(flag.equals("Join")){ %>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm" class="col-form-label required">제품사진첨부</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="fileNm" id="fileNm"/>
				<p>jpg, gif, png 등 이미지 형식의 파일만 올려 주십시요. (단, 1개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.)</p>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">기타첨부<br />(카탈로그, 인증서 등)</label>
			</div>
			<div class="col-md-10">
				<input type="file" name="fileNm2" id="fileNm2"/>
				<p>파일은 1개 이상 올리실 수 없습니다. 10MB 이하의 파일만 올려 주십시요.</p>
			</div>
		</div>
<% }else{ %>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm" class="col-form-label">제품사진첨부</label>
			</div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${mberVO.fileCours}','${mberVO.fileNm}');" title="<c:out value="${mberVO.fileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${mberVO.fileNm}" /></a>
			</div>
		</div>
		<div class="bo-w-row row">
			<div class="col-md-2 fth">
				<label for="file_nm2" class="col-form-label">기타첨부<br />(카탈로그, 인증서 등)</label>
			</div>
			<div class="col-md-10">
				<a href="<c:out value="${mberVO.fileCours2}" />" title="<c:out value="${mberVO.fileNm2}" />" ><i class="fas fa-paperclip text-info"></i> ${mberVO.fileNm2}</a>
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