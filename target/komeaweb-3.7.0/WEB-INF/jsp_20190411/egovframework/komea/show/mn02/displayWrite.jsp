<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_List(){
	document.Form.action = "<c:url value='/show/DisplayList.do'/>";
	document.Form.submit();
}
function fn_Insert(){
	
	var fm = document.Form;
	
	if(fm.smlpzYn.value == ""){
		alert("중소기업여부를 선택하세요.");
		fm.smlpzYn.focus();
		return;
	}
	
	if(fm.cmpnyNm.value == ""){
		alert("회사명을 입력하세요.");
		fm.cmpnyNm.focus();
		return;
	}
	
	if(fm.rprsntv.value == ""){
		alert("대표자명을 입력하세요.");
		fm.rprsntv.focus();
		return;
	}
	
	if(fm.bizNum.value == ""){
		alert("사업자등록번호를 입력하세요.");
		fm.bizNum.focus();
		return;
	}
	
	if(fm.locplc.value == ""){
		alert("소재지를 입력하세요.");
		fm.locplc.focus();
		return;
	}
	
	if(fm.fondDe.value == ""){
		alert("설립일자를 선택하세요.");
		fm.fondDe.focus();
		return;
	}
	
	if(fm.emplyCo.value == ""){
		alert("종업원수를 입력하세요.");
		fm.emplyCo.focus();
		return;
	}else{
		document.Form.emplyCo.value = parseInt(fm.emplyCo.value.replace(/,/g,""));
	}
	
	if(fm.hmpg.value == ""){
		alert("홈페이지를 입력하세요.");
		fm.hmpg.focus();
		return;
	}
	
	if(fm.chargerNm.value == ""){
		alert("담당자성명을 입력하세요.");
		fm.chargerNm.focus();
		return;
	}
	
	if(fm.chargerDept.value == ""){
		alert("담당자부서/직위를 입력하세요.");
		fm.chargerDept.focus();
		return;
	}
	
	if(fm.chargerTlphon.value == ""){
		alert("담당자직통전화를 입력하세요.");
		fm.chargerTlphon.focus();
		return;
	}
	
	if(fm.fax.value == ""){
		alert("팩스를 입력하세요.");
		fm.fax.focus();
		return;
	}
	
	if(fm.chargerEmail.value == ""){
		alert("담당자이메일을 입력하세요.");
		fm.chargerEmail.focus();
		return;
	}
	
	if(fm.capl.value == ""){
		alert("자본금을 입력하세요.");
		fm.capl.focus();
		return;
	}else{
		document.Form.capl.value = parseInt(fm.capl.value.replace(/,/g,""));
	}
	
	if(fm.salamt1.value == ""){
		alert(fm.salamtStdyy1.value+"년도 매출액을 입력하세요.");
		fm.salamt1.focus();
		return;
	}else{
		document.Form.salamt1.value = parseInt(fm.salamt1.value.replace(/,/g,""));
	}
	
	if(fm.salamt2.value == ""){
		alert(fm.salamtStdyy2.value+"년도 매출액을 입력하세요.");
		fm.salamt2.focus();
		return;
	}else{
		document.Form.salamt2.value = parseInt(fm.salamt2.value.replace(/,/g,""));
	}
	
	if(fm.samenssExbiPartcptnCo.value == ""){
		alert("전시회 참여횟수를 입력하세요.");
		fm.samenssExbiPartcptnCo.focus();
		return;
	}
	
	if(fm.mfrcDspyPrduct.value == ""){
		alert("주력전시제품을 입력하세요.");
		fm.mfrcDspyPrduct.focus();
		return;
	}
	
	if(fm.file1.value == ""){
		alert("사업자등록증사본을 첨부하세요.");
		fm.file1.focus();
		return;
	}
	
	if(fm.file2.value == ""){
		alert("수출실적증빙서류를 첨부하세요.");
		fm.file2.focus();
		return;
	}
	
	if(fm.file3.value == ""){
		alert("1차 참가비 입금증을 첨부하세요.");
		fm.file3.focus();
		return;
	}
	
	if(fm.agreYn.value == "" || fm.agreYn.value == "N"){
		alert("참가규정 확인서에 동의 후 신청가능합니다.");
		fm.agreYn.focus();
		return;
	}
	if(confirm("전시행사 참가신청을 하시겠습니까?") == true) {
		document.Form.action = "<c:url value='/show/InsertRequestExbiInfo.do'/>";
		document.Form.submit();
	}
}
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>전시행사 참가신청서</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
            		
            		<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiRequestRegistForm.jsp" />
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>