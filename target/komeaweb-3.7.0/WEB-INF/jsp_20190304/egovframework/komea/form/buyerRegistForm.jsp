<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top-popup.jsp" %>
<script type="text/javascript">
//저장
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

	var array = new Array();
	array[0] = $('#cnsltexhbCd').val();
	array[1] = $('#insttMberCd').val();
	array[2] = $('#insertUserId').val();
	array[3] = $('#updateUserId').val();
	array[4] = $('#nationNm').val();
	array[5] = $('#entrpsNm').val();
	array[6] = $('#rprsntv').val();
	array[7] = $('#gb').val();
	array[8] = $('#gbEtcDesc').val();
	array[9] = $('#adres').val();
	array[10] = $('#cttpc').val();
	array[11] = $('#employeeCn').val();
	array[12] = $('#fax').val();
	array[13] = $('#yearSales').val();
	array[14] = $('#hmpg').val();
	array[15] = $('#email').val();
	array[16] = $('#chargerNm').val();
	array[17] = $('#chargerCttpc').val();
	array[18] = $('#chargerDept').val();
	array[19] = $('#chargerOfcps').val();
	array[20] = $('#chargerEmail').val();
	array[21] = $('#partcptnEvent').val();
	array[22] = $('#mainSrvc').val();
	array[23] = $('#buyerIntro').val();
	array[24] = $('#interestItem').val();

	$.ajax({
		url : "/buyer/InsertBuyerInfo.do", 
		type : "POST",  
		data : "arr="+array,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert(msg);
				window.opener.location.reload();
				self.close();
			}
		},
		error:function(request,status,er){
			var errorMsg= "요청 도중 오류가 발생하였습니다.\n";
			
			if(request.status == 0){errorMsg+="네트워크 연결을 확인해주십시오.";}
			else if(request.status == 401){errorMsg+="권한이 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 403){errorMsg+="접근이 거부되었습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 404){errorMsg+="요청한 페이지를 찾을 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 500){errorMsg+="서버 내 오류가 발생하였습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'parsererror'){errorMsg+="응답 본문을 정상적으로 가져올 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'timeout'){errorMsg+="응답 제한 시간을 초과하였습니다. 다시 조회해 주세요";}
			else {errorMsg+="관리자에게 문의해주세요.";}
			alert(errorMsg);
		}
	});
}
function fn_Search(){
	var pop_title = "BuyerSearch";
	// var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=no";
	var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=yes,width=1000,height=800";
	window.open("", pop_title, status);

	document.Form.target = pop_title;
	document.Form.action = "<c:url value='/show/BuyerSearchPopup.do'/>";
	document.Form.submit();
}
</script>
<body>
<div class="container-fluid nospacing">
<form:form name="Form" commandName="buyer" method="post">
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value=""/>
<form:input type="hidden" path="insttMberCd" name="insttMberCd" id="insttMberCd" value="${loginInfo.mberCd}"/>
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.id}"/>

	<div class="popup-dialog" >
		<div class="popup-content">
			<div class="popup-header">
				<h5>바이어정보 등록</h5>
				<button type="button" class="close" onClick="window.close();" >
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="popup-body">

				<!-- ##### Popup Write Section Start ##### -->
            	<div class="section-text bo-w">

					<!-- 게시판 edit시작 { -->
					<div class="container-fluid">

						<div class="bo-w-row border-top-3 row">
							<div class="col-md-2 fth">
								<label for="companyname" class="col-form-label required">국가</label>
							</div>
							<div class="col-md-4">
								<form:select class="form-control form-control-sm" path="nationNm" id="nationNm" name="nationNm">
									<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
										<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
									</c:forEach>
								</form:select>
							</div>
							<div class="col-md-4">
								<a href="javascript:fn_Search();" class="btn btn-sm btn-primary mr-5" role="button">바이어검색</a>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="cmpnyNm" class="col-form-label required">업체명</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="entrpsNm" id="entrpsNm" name="entrpsNm" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="cmpnyNmEng" class="col-form-label required">대표자</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="rprsntv" id="rprsntv" name="rprsntv" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="companyname" class="col-form-label required">구분</label>
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
								<label for="companyname" class="col-form-label">주소</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" path="adres" id="adres" name="adres" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">연락처</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="cttpc" id="cttpc" name="cttpc" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">종업원</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="employeeCn" id="employeeCn" name="employeeCn" class="form-control" value="0"/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">팩스</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="fax" id="fax" name="fax" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">연간매출액($)</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="yearSales" id="yearSales" name="yearSales" class="form-control" value="0"/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">홈페이지</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="hmpg" id="hmpg" name="hmpg" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">대표메일</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="email" id="email" name="email" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">담당자명</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerNm" id="chargerNm" name="chargerNm" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">담당자연락처</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerCttpc" id="chargerCttpc" name="chargerCttpc" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">담당자부서</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerDept" id="chargerDept" name="chargerDept" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">담당자직책</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerOfcps" id="chargerOfcps" name="chargerOfcps" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="rprsntv" class="col-form-label">담당자이메일</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="chargerEmail" id="chargerEmail" name="chargerEmail" class="form-control" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label for="rprsntvEng" class="col-form-label">참여행사이력</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" path="partcptnEvent" id="partcptnEvent" name="partcptnEvent" class="form-control" value=""/>
							</div>
						</div>
						
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="mainPrduct" class="col-form-label">주요서비스</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="mainSrvc" id="mainSrvc" rows="3"></textarea>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="mainPrductEng" class="col-form-label">회사소개</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="buyerIntro" id="buyerIntro" rows="3"></textarea>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="patentCrtfc" class="col-form-label">관심품목</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="interestItem" id="interestItem" rows="3"></textarea>
							</div>
						</div>

					</div><!-- div class="container" -->
				</div><!-- div class="section-text bo-w" -->
			    <!-- ##### Popup Write Section End ##### -->

			</div>

			<div class="popup-footer">
				<a href="javascript:fn_Save();" class="btn btn-sm btn-primary mr-5" role="button">저장</a>
				<button type="button" class="btn btn-sm btn-secondary" onClick="window.close();" >닫기</button>
			</div>
			
		</div>
	</div>
	</form:form>
</div>
<%@ include file="/WEB-INF/include/include-bottom-popup.jsp" %>