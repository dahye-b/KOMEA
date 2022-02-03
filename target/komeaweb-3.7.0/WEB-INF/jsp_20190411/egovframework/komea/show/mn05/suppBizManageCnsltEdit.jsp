<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
//첨부파일 다운로드
function fn_downloadFile(obj1, obj2){
	document.Form.fileCours.value = obj1;
	document.Form.fileNm.value = obj2;
	document.Form.action = "<c:url value='/komea/show/downloadFile.do'/>";
	document.Form.submit();
}
function fn_PreCnsltData(obj){
	if(obj != "0"){
		document.Form.preCnsltexhbCd.value=obj;
	}else{
		document.Form.preCnsltexhbCd.value="";
	}
	document.Form.action = "<c:url value='/show/suppBizManageCnsltEdit.do'/>";
	document.Form.submit();
}
//저장
function fn_Save(){
	var fm = document.Form;
	
	if(fm.eventNm.value == ""){
		alert("행사명을 입력하세요.");
		fm.eventNm.focus();
		return;
	}
	if(fm.eventBeginDe.value == ""){
		alert("행사시작일을 입력하세요.");
		fm.eventBeginDe.focus();
		return;
	}
	if(fm.eventClosDe.value == ""){
		alert("행사종료일을 입력하세요.");
		fm.eventClosDe.focus();
		return;
	}
	if(fm.rceptBeginDe.value == ""){
		alert("접수시작일을 입력하세요.");
		fm.rceptBeginDe.focus();
		return;
	}
	if(fm.rceptClosDe.value == ""){
		alert("접수종료일을 입력하세요.");
		fm.rceptClosDe.focus();
		return;
	}
	if(fm.place.value == ""){
		alert("장소를 입력하세요.");
		fm.place.focus();
		return;
	}
	if(fm.mngeInstt.value == ""){
		alert("주관기관을 입력하세요.");
		fm.mngeInstt.focus();
		return;
	}
	if(fm.insttNm.value == ""){
		alert("주최기관을 입력하세요.");
		fm.insttNm.focus();
		return;
	}
	if(fm.suprtInstt.value == ""){
		alert("후원기관을 입력하세요.");
		fm.suprtInstt.focus();
		return;
	}
	if(fm.mainCn.value == ""){
		alert("주요내용을 입력하세요.");
		fm.mainCn.focus();
		return;
	}
	if(fm.sportCn.value == ""){
		alert("지원내용을 입력하세요.");
		fm.sportCn.focus();
		return;
	}
	if(fm.chargerNm.value == ""){
		alert("담당자명을 입력하세요.");
		fm.chargerNm.focus();
		return;
	}
	if(fm.chargerEmail.value == ""){
		alert("이메일을 입력하세요.");
		fm.chargerEmail.focus();
		return;
	}
	if(fm.exbiChargerDept.value == ""){
		alert("부서를 입력하세요.");
		fm.exbiChargerDept.focus();
		return;
	}
	if(fm.exbiChargerOfcps.value == ""){
		alert("직책을 입력하세요.");
		fm.exbiChargerOfcps.focus();
		return;
	}
	if(fm.chargerTlphon.value == ""){
		alert("전화를 입력하세요.");
		fm.chargerTlphon.focus();
		return;
	}
	if(fm.chargerFax.value == ""){
		alert("팩스를 입력하세요.");
		fm.chargerFax.focus();
		return;
	}
	document.Form.action = "<c:url value='/show/UpdateSuppBizManageCnslt.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->

<form:input type="hidden" path="fileCours" name="fileCours" id="fileCours" value=""/>
<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value=""/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>지원사업관리</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/cnsltRegistForm.jsp" />
					<div class="text-center mt-10">
						<a href="javascript:fn_Save();" class="btn btn-sm btn-primary" role="button">저장</a>
						<a href="<c:url value='/show/SuppBizManage.do'/>" class="btn btn-sm btn-secondary" role="button">취소</a>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>