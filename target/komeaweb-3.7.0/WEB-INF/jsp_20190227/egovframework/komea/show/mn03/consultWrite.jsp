<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_List(){
	document.Form.action = "<c:url value='/show/DisplayList.do'/>";
	document.Form.submit();
}
function fn_Insert(){
	
	var fm = document.Form;
	
	if(fm.cmpnyNm.value == ""){
		alert("회사명을 입력하세요.");
		fm.cmpnyNm.focus();
		return;
	}
	
	if(fm.rprsntv.value == ""){
		alert("대표자를 입력하세요.");
		fm.rprsntv.focus();
		return;
	}
	
	if(fm.locplc.value == ""){
		alert("소재지를 입력하세요.");
		fm.locplc.focus();
		return;
	}
	
	if(fm.emplyCo.value == ""){
		alert("종업원수를 입력하세요.");
		fm.emplyCo.focus();
		return;
	}else{
		document.Form.emplyCo.value = parseInt(fm.emplyCo.value.replace(/,/g,""));
	}
	
	if(fm.telno.value == ""){
		alert("대표전화를 입력하세요.");
		fm.telno.focus();
		return;
	}
	
	if(fm.fax.value == ""){
		alert("팩스를 입력하세요.");
		fm.fax.focus();
		return;
	}
	
	if(fm.hmpg.value == ""){
		alert("홈페이지를 입력하세요.");
		fm.hmpg.focus();
		return;
	}
	
	if(fm.reprsntEmail.value == ""){
		alert("이메일을 입력하세요.");
		fm.reprsntEmail.focus();
		return;
	}
	
	if(fm.chargerNm.value == ""){
		alert("사업담당자 성명을 입력하세요.");
		fm.chargerNm.focus();
		return;
	}
	
	if(fm.chargerDept.value == ""){
		alert("사업담당자 부서를 입력하세요.");
		fm.chargerDept.focus();
		return;
	}
	
	if(fm.chargerOfcps.value == ""){
		alert("사업담당자 직위를 입력하세요.");
		fm.chargerOfcps.focus();
		return;
	}
	
	if(fm.chargerTlphon.value == ""){
		alert("사업담당자 연락처를 입력하세요.");
		fm.chargerTlphon.focus();
		return;
	}
	
	if(fm.chargerEmail.value == ""){
		alert("사업담당자 이메일을 입력하세요.");
		fm.chargerEmail.focus();
		return;
	}
	
	if(fm.beforeYearSalamt.value == ""){
		alert("전년도 매출액을 입력하세요.");
		fm.beforeYearSalamt.focus();
		return;
	}else{
		document.Form.beforeYearSalamt.value = parseInt(fm.beforeYearSalamt.value.replace(/,/g,""));
	}
	
	if(fm.beforeYearXportAcmslt.value == ""){
		alert("전년도 수출액을 입력하세요.");
		fm.beforeYearXportAcmslt.focus();
		return;
	}else{
		document.Form.beforeYearXportAcmslt.value = parseInt(fm.beforeYearXportAcmslt.value.replace(/,/g,""));
	}
	
	if(fm.productDetailGb.value == ""){
		alert("제품세부분류를 선택하세요.");
		fm.productDetailGb.focus();
		return;
	}
	
	if(fm.mainPrduct.value == ""){
		alert("기본제품(국문)을 입력하세요.");
		fm.mainPrduct.focus();
		return;
	}
	
	if(fm.mainPrductEng.value == ""){
		alert("기본제품(영문)을 입력하세요.");
		fm.mainPrductEng.focus();
		return;
	}
	
	if(fm.addPrduct.value == ""){
		alert("추가제품(국문)을 입력하세요.");
		fm.addPrduct.focus();
		return;
	}
	
	if(fm.addPrductEng.value == ""){
		alert("추가제품(영문)을 입력하세요.");
		fm.addPrductEng.focus();
		return;
	}
	
	if(fm.patentCrtfc.value == ""){
		alert("특허/인증(국문)을 입력하세요.");
		fm.patentCrtfc.focus();
		return;
	}
	
	if(fm.patentCrtfcEng.value == ""){
		alert("특허/인증(영문)을 입력하세요.");
		fm.patentCrtfcEng.focus();
		return;
	}
	
	if(fm.mainBcnc.value == ""){
		alert("주요거래처(국문)을 입력하세요.");
		fm.mainBcnc.focus();
		return;
	}
	
	if(fm.mainBcncEng.value == ""){
		alert("주요거래처(영문)을 입력하세요.");
		fm.mainBcncEng.focus();
		return;
	}
	
	if(fm.buyerCd.value == ""){
		alert("상담신청바이어를 선택하세요.");
		fm.buyerCd.focus();
		return;
	}
	
	if(fm.file1.value == ""){
		alert("사업자등록증을 첨부하세요.");
		fm.file1.focus();
		return;
	}
	
	if(fm.file2.value == ""){
		alert("기본제품이미지를 첨부하세요.");
		fm.file2.focus();
		return;
	}
	
	if(fm.file4.value == ""){
		alert("제품카탈로그를 첨부하세요.");
		fm.file4.focus();
		return;
	}
	
	if(fm.agreYn.value == "" || fm.agreYn.value == "N"){
		alert("서약서에 동의 후 신청가능합니다.");
		fm.agreYn.focus();
		return;
	}
	if(confirm("상담행사 참가신청을 하시겠습니까?") == true) {
		document.Form.action = "<c:url value='/show/InsertRequestCnsltInfo.do'/>";
		document.Form.submit();
	}
}
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data"><!-- enctype="multipart/form-data" -->
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>상담행사 참가신청서</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-w show">
            		
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/cnsltRequestRegistForm.jsp" />

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>