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
function fn_PreExbiData(obj){
	document.Form.preExbiCd.value=obj;
	document.Form.action = "<c:url value='/show/suppBizManageExbiEdit.do'/>";
	document.Form.submit();
}
//저장
function fn_Save(){
	var fm = document.Form;
	
	if(fm.exbiNm.value == ""){
		alert("전시회명(국문)을 입력하세요.");
		fm.exbiNm.focus();
		return;
	}
	if(fm.exbiNmEng.value == ""){
		alert("전시회명(영문)을 입력하세요.");
		fm.exbiNmEng.focus();
		return;
	}
	if(fm.opmtBeginDe.value == ""){
		alert("개최시작일을 입력하세요.");
		fm.opmtBeginDe.focus();
		return;
	}
	if(fm.opmtClosDe.value == ""){
		alert("개최종료일을 입력하세요.");
		fm.opmtClosDe.focus();
		return;
	}
	if(fm.rceptBeginDe.value == ""){
		alert("신청시작일을 입력하세요.");
		fm.rceptBeginDe.focus();
		return;
	}
	if(fm.rceptClosDe.value == ""){
		alert("신청종료일을 입력하세요.");
		fm.rceptClosDe.focus();
		return;
	}
	if(fm.opmtPlace.value == ""){
		alert("개최장소를 입력하세요.");
		fm.opmtPlace.focus();
		return;
	}
	if(fm.opmtCycle.value == ""){
		alert("개최주기를 입력하세요.");
		fm.opmtCycle.focus();
		return;
	}
	if(fm.mainInsttNm.value == ""){
		alert("주관사를 입력하세요.");
		fm.mainInsttNm.focus();
		return;
	}
	if(fm.supportOrganNm.value == ""){
		alert("참가지원기관을 입력하세요.");
		fm.supportOrganNm.focus();
		return;
	}
	if(fm.partcptSumry.value == ""){
		alert("참가개요를 입력하세요.");
		fm.partcptSumry.focus();
		return;
	}
	if(fm.sportCn.value == ""){
		alert("지원내용을 입력하세요.");
		fm.sportCn.focus();
		return;
	}
	if(fm.partcptReqstMth.value == ""){
		alert("참가신청방법을 입력하세요.");
		fm.partcptReqstMth.focus();
		return;
	}
	if(fm.spceByMg.value == ""){
		alert("신청단위부스를 입력하세요.");
		fm.spceByMg.focus();
		return;
	}
	if(fm.spceByUnit.value == ""){
		alert("크기단위를 선택하세요.");
		fm.spceByUnit.focus();
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
	document.Form.action = "<c:url value='/show/UpdateSuppBizManageExbi.do'/>";
	document.Form.submit();
}
//목록으로
function fn_List(){
	document.Form.action = "<c:url value='/show/SuppBizManage.do'/>";
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
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiRegistForm.jsp" />
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