<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Insert(){
	var fm = document.Form;
	
	if(fm.ssbypGb.value == ""){
		alert("기업유형을 선택하세요.");
		fm.ssbypGb.focus();
		return;
	}
	if(fm.cmpnyNm.value == ""){
		alert("상호명을 입력하세요.");
		fm.cmpnyNm.focus();
		return;
	}
	if(fm.rprsntv.value == ""){
		alert("대표자를 입력하세요.");
		fm.rprsntv.focus();
		return;
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
	if(fm.reprsntEmail.value == ""){
		alert("이메일을 입력하세요.");
		fm.reprsntEmail.focus();
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
	if(fm.chargerTlphon.value == ""){
		alert("담당자연락처를 입력하세요.");
		fm.chargerTlphon.focus();
		return;
	}
	if(fm.chargerHp.value == ""){
		alert("담당자휴대폰을 입력하세요.");
		fm.chargerHp.focus();
		return;
	}
	if(fm.chargerEmail.value == ""){
		alert("담당자이메일을 입력하세요.");
		fm.chargerEmail.focus();
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
	if(fm.mainSkll.value == ""){
		alert("주요업무를 입력하세요.");
		fm.mainSkll.focus();
		return;
	}
	if(fm.etcMatter.value == ""){
		alert("기타사항을 입력하세요.");
		fm.etcMatter.focus();
		return;
	}
	if(fm.bsnmRsctftFileNm.value == ""){
		alert("사업자등록증을 첨부하세요.");
		fm.bsnmRsctftFileNm.focus();
		return;
	}
	if(fm.biddingFileNm.value == ""){
		alert("사업관련자료를 첨부하세요.");
		fm.biddingFileNm.focus();
		return;
	}

	if(confirm("입찰신청을 하시겠습니까?") == true) {
		document.Form.action = "<c:url value='/show/InfoCenter/InsertBiddingReqstInfo.do'/>";
		document.Form.submit();
	}
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="2"/>
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
					<h2>입찰공고 신청서 작성</h2>
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
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/biddingRequestForm.jsp" />
					</div><!-- div class="container bg-light mt-30 mb-30 bo-w"  -->
					<!-- } 회원정보 끝 -->

					<div class="text-center mb-50">
						<a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="등록" >등록</a>
						<a class="btn btn-sm btn-secondary" href="<c:url value='/show/InfoCenter/List.do'/>" title="목록" >목록</a>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

	</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>