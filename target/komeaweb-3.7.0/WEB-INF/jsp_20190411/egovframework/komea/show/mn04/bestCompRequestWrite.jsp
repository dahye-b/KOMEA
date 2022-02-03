<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
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
	
	if(fm.bizNum.value == ""){
		alert("사업자등록번호를 입력하세요.");
		fm.bizNum.focus();
		return;
	}
	
	if(fm.postCode1.value == "" && fm.postCode2.value){
		alert("우편번호를 입력하세요.");
		fm.postCode1.focus();
		return;
	}	
	
	if(fm.locplc.value == ""){
		alert("소재지를 입력하세요.");
		fm.locplc.focus();
		return;
	}
	
	if(fm.workCnt.value == ""){
		alert("상시근로자 수를 입력하세요.");
		fm.workCnt.focus();
		return;
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
	
	if(fm.hmpg.value == ""){
		alert("홈페이지를 입력하세요.");
		fm.hmpg.focus();
		return;
	}
	
	if(fm.chargerNm.value == ""){
		alert("담당자이름을 입력하세요.");
		fm.chargerNm.focus();
		return;
	}
	
	if(fm.chargerDept.value == ""){
		alert("담당자부서를 입력하세요.");
		fm.chargerDept.focus();
		return;
	}

	if(fm.chargerOfcps.value == ""){
		alert("담당자직책을 입력하세요.");
		fm.chargerOfcps.focus();
		return;
	}
	
	if(fm.chargerEmail.value == ""){
		alert("담당자이메일을 입력하세요.");
		fm.chargerEmail.focus();
		return;
	}
	
	if(fm.chargerTlphon.value == ""){
		alert("담당자직통전화를 입력하세요.");
		fm.chargerTlphon.focus();
		return;
	}
	
	if(fm.mainPrduct.value == ""){
		alert("주요생산품목을 입력하세요.");
		fm.mainPrduct.focus();
		return;
	}
	
	if(fm.applyFileNm.value == ""){
		alert("신청서를 첨부하세요.");
		fm.applyFileNm.focus();
		return;
	}
	
	if(fm.mainProductFileNm.value == ""){
		alert("주요생산품목설명서를 첨부하세요.");
		fm.mainProductFileNm.focus();
		return;
	}
	
	if(fm.careerFileNm.value == ""){
		alert("대표자이력서를 첨부하세요.");
		fm.careerFileNm.focus();
		return;
	}

	if(confirm("우수기업선정 신청을 하시겠습니까?") == true) {
		document.Form.action = "<c:url value='/show/InfoCenter/InsertBestCompanyReqstInfo.do'/>";
		document.Form.submit();
	}
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="6"/>
	<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="wrter" name="wrter" id="wrter" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="writngDe" name="writngDe" id="writngDe" value="${toDay}"/>

	<form:input type="hidden" path="eventGb" name="eventGb" id="eventGb" value=""/>
	<form:input type="hidden" path="eventCd" name="eventCd" id="eventCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>우수기업선정 신청서 작성</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
					<!-- 회원정보 시작 { -->
					<h4 class=""><i class="fas fa-edit"></i> 신청하시고 다시 수정할 수 없으니 신중히 기입하시기 바랍니다.</h4>
					<p>
						<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
					</p>
					<div class="container mt-30 mb-30" >
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/bestCompanyRequestForm.jsp" />
					</div><!-- div class="container bg-light mt-30 mb-30 bo-w"  -->
					<!-- } 회원정보 끝 -->

					<div class="text-center mb-50">
						<a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="신청하기" >신청하기</a>
						<a class="btn btn-sm btn-secondary" href="<c:url value='/show/InfoCenter/List.do?bbsTy=6'/>" title="취소" >취소</a>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

	</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>