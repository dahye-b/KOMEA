<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Save(){
	if(document.Form.nationNm.value == ""){
		alert("국가를 선택하세요.");
		document.Form.nationNm.focus();
		return;
	}
	if(document.Form.entrpsNm.value == ""){
		alert("업체명을 입력하세요.");
		document.Form.entrpsNm.focus();
		return;
	}
	if(document.Form.rprsntv.value == ""){
		alert("대표자를 입력하세요.");
		document.Form.rprsntv.focus();
		return;
	}
	if(document.Form.gb.value == ""){
		alert("구분을 선택하세요.");
		document.Form.gb.focus();
		return;
	}
	if(document.Form.adres.value == ""){
		alert("주소를 입력하세요.");
		document.Form.adres.focus();
		return;
	}
	if(document.Form.cttpc.value == ""){
		alert("연락처를 입력하세요.");
		document.Form.cttpc.focus();
		return;
	}
	if(document.Form.email.value == ""){
		alert("대표메일을 입력하세요.");
		document.Form.email.focus();
		return;
	}
	if(document.Form.mainSrvc.value == ""){
		alert("주요서비스를 입력하세요.");
		document.Form.mainSrvc.focus();
		return;
	}
	if(document.Form.buyerIntro.value == ""){
		alert("회사소개를 입력하세요.");
		document.Form.buyerIntro.focus();
		return;
	}
	document.Form.action = "<c:url value='/show/InsertBuyerInfo.do'/>";
	document.Form.submit();
}
function fn_Search(){
	var pop_title = "BuyerSearch";
	// var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=no";
	var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=yes,width=1000,height=800";
	window.open("", pop_title, status);

	var obj = document.Form.cnsltexhbCd.value;
	document.Form.target = pop_title;
	document.Form.action = "<c:url value='/show/BuyerSearchPopup.do?code="+obj+"'/>";
	document.Form.submit();
}
</script>
<body>
<div class="container-fluid nospacing">
<form:form name="Form" commandName="buyer" method="post">
<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value=""/>
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value=""/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>지원사업관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-w">

					<!-- 게시판 edit시작 { -->
					<h4 class=""><i class="fas fa-edit"></i> 바이어등록</h4>
					<p>
						<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
					</p>
					<div class="container mt-1 mb-30" >

						<div class="bo-w-row border-top-3 row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">국가</label>
							</div>
							<div class="col-md-4">
								<form:select class="form-control form-control-sm" path="nationNm" id="nationNm" name="nationNm">
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
							<div class="col-md-6">
								<a href="javascript:fn_Search();" class="btn btn-sm btn-secondary mr-5" role="button">바이어검색</a>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">업체명</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="entrpsNm" id="entrpsNm" name="entrpsNm" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label required">대표자</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">구분</label>
							</div>
							<div class="col-md-10">
								<div class="form-row pl-5 pr-5">
									<div class="form-group no-margin">
										<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Shipowner" /> Shipowner</label>
									</div>
									<div class="form-group no-margin">
										<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Shipyard" /> Shipyard</label>
									</div>
									<div class="form-group no-margin">
										<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Trading" /> Trading</label>
									</div>
									<div class="form-group no-margin">								
										<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Etc" /> Etc</label>
									</div>
									<div class="form-group no-margin ">
										<form:input type="text" path="gbEtcDesc" id="gbEtcDesc" name="gbEtcDesc" class="form-control" style="width: 322px !important;" placeholder="구분이 Etc 선택시입력하세요" value=""/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">주소</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" path="adres" id="adres" name="adres" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">연락처</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="cttpc" id="cttpc" name="cttpc" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label">종업원</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="employeeCn" id="employeeCn" name="employeeCn" class="form-control" value="0"/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">팩스</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="fax" id="fax" name="fax" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label">연간매출액($)</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="yearSales" id="yearSales" name="yearSales" class="form-control" value="0"/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">홈페이지</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label required">대표메일</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="email" id="email" name="email" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">담당자명</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label">담당자연락처</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerCttpc" id="chargerCttpc" name="chargerCttpc" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">담당자부서</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label">담당자직책</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">담당자이메일</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label">참여행사이력</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="partcptnEvent" id="partcptnEvent" name="partcptnEvent" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">주요서비스</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="mainSrvc" id="mainSrvc" rows="3"></textarea>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">회사소개</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="buyerIntro" id="buyerIntro" rows="3"></textarea>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">관심품목</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="interestItem" id="interestItem" rows="3"></textarea>
							</div>
						</div>

					</div><!-- div class="container mt-30 mb-30" -->

				    <!-- 버튼 시작 { -->
				    <div class="text-right">
							<a href="javascript:fn_Save();" class="btn btn-sm btn-warning" role="button">등록</a>
				        <a href="<c:url value='/show/SuppBizManage.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
				    </div>
				    <!-- } 버튼 끝 -->
						
	            </div>
	        </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
</div>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>