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
//진행사항 업데이트
function fn_ChangeStatus(obj1, obj2, obj3){
	document.Form.gubun.value = obj1;
	document.Form.code.value = obj2;
	document.Form.progrsSttus.value = obj3;
	document.Form.action = "<c:url value='/show/UpdateProgressStatus.do'/>";
	document.Form.submit();
}
//삭제
function fn_Delete(obj1, obj2){
	document.Form.gubun.value = obj1;
	document.Form.code.value = obj2;
	if(confirm("삭제 하시겠습니까? \n삭제 시 모든 내용이 삭제됩니다.")) {
		document.Form.action = "<c:url value='/show/DeleteBusiness.do'/>";
		document.Form.submit();
	}
}
//수정화면이동
function fn_Modify(obj1, obj2){
	document.ListForm.gubun.value = obj1;
	document.ListForm.code.value = obj2;
	if(obj == "0"){
		document.Form.action = "<c:url value='/show/UpdateProgressStatus.do'/>";
	}else{
		document.Form.action = "<c:url value='/show/UpdateProgressStatus.do'/>";
	}
	document.Form.submit();
}
/*
function fn_BuyerInert(obj){
	var pop_title = "BuyerInert";
	// var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=no";
	var status = "menubar=no,toolbar=no,location=no,status=no,scrollbars=yes,width=1000,height=800";
	window.open("", pop_title, status);

	document.Form.cnsltexhbCd.value = obj;
	document.Form.target = pop_title;
	document.Form.action = "<c:url value='/show/BuyerWritePopup.do'/>";
	document.Form.submit();
}*/
function fn_BuyerInert(obj){
	document.Form.cnsltexhbCd.value = obj;
	document.Form.action = "<c:url value='/show/suppBizManageBuyerInput.do'/>";
	document.Form.submit();
}
//참가업체
function consEnterCompList(obj1, obj2){
	$.ajax({
		url : "/show/SelectExbiAndCnsltCompanyList.do", 
		type : "POST",  
		data : "gubun="+obj1+"&eventCd="+obj2,
		success : function(data) {
			console.log(data);
			var resultData = data.data;
			//alert("조회성공"+resultData[0].title);
			
			$("#totalCnt1").empty();
			if(data != null ){
				$("#totalCnt1").append(data.totalCnt);
			}else{
				$("#totalCnt1").append("0");
			}
			
			var contents = '';
			 $("#pointTable1").empty();
			 contents += '<thead><tr><th scope="col">업체명</th><th scope="col">주소</th><th scope="col">연락처</th><th scope="col">홈페이지</th></tr></thead><tbody>';
			
			$.each(resultData, function(index, value){
				contents += '<tr><td class="text-center">'+value.cmpnyNm+'</td><td>'+value.locplc+'</td><td class="text-center" >'+value.telno+'</td><td class="text-center"><a href='+value.hmpgUrl+'>'+value.hmpg+'</a></td></tr>';
			});
			contents += '</tbody>';
			$("#pointTable1").html(contents);

			$('#Modal1').modal('show');
		}
	});
}
//일정확인
function resultFileList(obj1, obj2){
	$.ajax({
		url : "/show/SelectExbiAndCnsltResultFileList.do", 
		type : "POST",  
		data : "eventGb="+obj1+"&eventCd="+obj2,
		success : function(data) {
			//console.log(data);
			var resultData = data.data;
			//alert("조회성공"+resultData[0].title);
			
			$("#totalCnt3").empty();
			if(data != null ){
				$("#totalCnt3").append(data.totalCnt);
			}else{
				$("#totalCnt3").append("0");
			}
			
			var contents = '';
			 $("#pointTable3").empty();
			 contents += '<thead><tr><th scope="col">업체명</th><th scope="col">주소</th><th scope="col">연락처</th><th scope="col">홈페이지</th></tr></thead><tbody>';
			
			$.each(resultData, function(index, value){
				contents += '<tr><td class="text-center">'+value.cmpnyNm+'</td><td>'+value.locplc+'</td><td class="text-center" >'+value.telno+'</td><td class="text-center"><a href='+value.hmpgUrl+'>'+value.hmpg+'</a></td></tr>';
			});
			contents += '</tbody>';
			$("#pointTable3").html(contents);

			$('#Modal3').modal('show');
		}
	});
}
</script>
<body>
<form:form name="Form" commandName="show" method="post">
<form:input type="hidden" name="code" path="code" id="code" value=""/>
<form:input type="hidden" name="progrsSttus" path="progrsSttus" id="progrsSttus" value=""/>
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value=""/>


<form:input type="hidden" path="fileCours" name="fileCours" id="fileCours" value=""/>
<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>지원사업관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v show">
				<c:choose>
					<c:when test="${ViewGb eq '0'}">
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiDetail1.jsp" />
						<c:if test="${ExbiRegistInfo.resultViewYn eq 'Y'}">
							<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiDetail2.jsp" />
						</c:if>
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiDetail3.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/consDetail.jsp" />
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/buyerList.jsp" />
					</c:otherwise>
				</c:choose>
				    <!-- 버튼 시작 { -->
				    <div class="text-right" >
						<c:if test="${ViewGb eq '1'}">
							<a href="javascript:fn_BuyerInert('${CnsltexhbRegistInfo.cnsltexhbCd}');" class="btn btn-sm btn-warning" role="button">바이어등록</a>
						</c:if>
				        <a href="<c:url value='/show/SuppBizManage.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
				    </div>
				    <!-- } 버튼 끝 -->
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<!-- Modal1 : 참여업체리스트 -->
<div class="modal" id="Modal1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">참여업체리스트</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h5 class="text-center">
					<span id="totalCnt1" class="text-primary"></span>건이 검색되었습니다.
				</h5>
				<div class="table-responsive text-nowrap table-wrapper-scroll-y" >
					<table class="table table-bordered border-top-2" summary="게시판 자료" id="pointTable1" >
					</table>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- Modal1 : 참여업체리스트 끝 -->
<!-- Modal2 : 바이어상세정보 -->
<div class="modal" id="Modal2">
	<div class="modal-dialog modal-md">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title" id="buyerTitle">바이어 정보</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<!-- div class="modal-body">
				<div class="table-responsive text-nowrap table-wrapper-scroll-y" >
					<table class="table table-bordered table-form" summary="게시판 자료" width="600" id="detailTable" >
					</table>
				</div>
			</div -->
			<!-- use by form/buyerList.jsp -->
			<div class="modal-body">
				<div class="container bo-v" id="detailTable">
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- Modal2 : 바이어상세정보 끝 -->
<!-- Modal3 : 일정확인리스트 -->
<div class="modal" id="Modal3">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">일정등록현황</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h5 class="text-center">
					<span id="totalCnt3" class="text-primary"></span>건이 검색되었습니다.
				</h5>
				<div class="table-responsive text-nowrap table-wrapper-scroll-y" >
					<table class="table table-bordered border-top-2" summary="게시판 자료" id="pointTable3" >
					</table>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- Modal3 : 일정확인리스트 끝 -->
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>