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

});
</script>

<div class="bo-w-row border-top-3 row">
	<div class="col-md-2 fth">
		<label for="companyname" class="col-form-label">기업유형</label>
	</div>
	<div class="col-md-10">
		<label class="col-form-label" id="companyname">기관회원</label>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="insttNm" class="col-form-label required">기관명</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="insttNm" id="insttNm" name="insttNm" class="form-control" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="insttNmEng" class="col-form-label">기관명 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="insttNmEng" id="insttNmEng" name="insttNmEng" class="form-control" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="rprsntv" class="col-form-label required">대표자</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="rprsntvEng" class="col-form-label">대표자 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="rprsntvEng" id="rprsntvEng" name="rprsntvEng" class="form-control" value=""/>
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
		<form:input type="text" path="id" id="id" name="id" class="form-control" value="" /> 
	<%}%>
	</div>
	<div class="col-md-6">
	<% if(flag.equals("Join")){ %>
		<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:fn_IdCheck();">중복확인</button>
		<p><font color="red"><form:errors path="id"/></font></p><!-- 아이디 중복 여부 메세지 -->
	<%} %>
	</div>
</div>
	<% if(flag.equals("Join")){ %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="password" class="col-form-label required">비밀번호</label>
	</div>
	<div class="col-md-4">
		<form:input type="password" path="password" id="password" name="password" class="form-control" value="" />
		<p>
			6자리 이상의 영문/숫자 조합
		</p>
	</div>
	<div class="col-md-2 fth">
		<label for="cfm_password" class="col-form-label required">비밀번호 확인</label>
	</div>
	<div class="col-md-4">
		<input type="password" id="cfm_password" name="cfm_password" class="form-control" value="" />
	</div>
</div>
	<%} %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerNm" class="col-form-label">담당자이름</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="chargerNmEng" class="col-form-label">담당자이름 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerNmEng" id="chargerNmEng" name="chargerNmEng" class="form-control" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="chargerDept" class="col-form-label">담당자부서</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control" value=""/>
	</div>
	<div class="col-md-2 fth">
		<label for="chargerDeptEng" class="col-form-label">담당자부서 영문</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="chargerDeptEng" id="chargerDeptEng" name="chargerDeptEng" class="form-control" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="telno" class="col-form-label required">대표전화</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="telno" id="telno" name="telno" class="form-control" value="" />
	</div>
	<div class="col-md-2 fth">
		<label for="fax" class="col-form-label">팩스</label>
	</div>
	<div class="col-md-4">
		<form:input type="text" path="fax" id="fax" name="fax" class="form-control" value=""/>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="reprsntEmail" class="col-form-label required">이메일</label>
	</div>
	<div class="col-md-10">
		<form:input type="text" path="reprsntEmail" id="reprsntEmail" name="reprsntEmail" class="form-control" value="" />
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="mainSkll" class="col-form-label required">주요기능</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control" name="mainSkll" id="mainSkll" rows="3">${mberVO.mainSkll}</textarea>
	</div>
</div>

<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="etcMatter" class="col-form-label">기타사항</label>
	</div>
	<div class="col-md-10">
		<textarea class="form-control" name="etcMatter" id="etcMatter" rows="3">${mberVO.etcMatter}</textarea>
	</div>
</div>
<% if(flag.equals("Edit")){ %>
<div class="bo-w-row row">
	<div class="col-md-2 fth">
		<label for="etcMatter" class="col-form-label">회원탈퇴</label>
	</div>
	<div class="col-md-10">
		회원탈퇴는 관리자에게 문의주시기 바랍니다.  (Tel. 051-972-6470)
	</div>
</div>
<%}%>