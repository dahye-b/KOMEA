<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function showAExbiResearch() {
/*
	var url = "/research/research_E.html?cd=" + detailData.EXBI_CD;
	window.open(url);
*/
}
function showAfterResultResearch() {
/*
	var url = "/research/research_S.html?cd=" + detailData.CNSLTEXHB_CD;
	window.open(url);
*/
}
//첨부파일 다운로드
function fn_downloadFile(obj1, obj2){
	document.Form.fileCours.value = obj1;
	document.Form.fileNm.value = obj2;
	document.Form.action = "<c:url value='/komea/show/downloadFile.do'/>";
	document.Form.submit();
}
//floor파일 
function viewFloorPlan(obj1, obj2) {
	if(obj1 == ""){
		alert("등록된 PLAN 파일이 없습니다.");
		return;
	}else{
		document.Form.fileCours.value = obj1;
		document.Form.fileNm.value = obj2;
		document.Form.action = "<c:url value='/komea/show/downloadFile.do'/>";
		document.Form.submit();
	}
}
//참가업체
function consEnterCompList(obj1, obj2){
	$.ajax({
		url : "/show/SelectExbiAndCnsltCompanyList.do", 
		type : "POST",  
		data : "gubun="+obj1+"&eventCd="+obj2,
		success : function(data) {
			//console.log(data);
			var resultData = data.data;
			//alert("조회성공"+resultData[0].title);
			
			$("#totalCnt1").empty();
			if(data.totalCnt > 0 ){
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
			if(undefined != null ){
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

<form:input type="hidden" path="fileCours" name="fileCours" id="fileCours" value=""/>
<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value=""/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>참여입찰관리</h2>
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
				        <a href="<c:url value='/show/WorkList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
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
			<div class="modal-body">
				<div class="table-responsive" >
				<!--<table class="table table-bordered table-form" summary="게시판 자료" width="600" id="detailTable" ></table>-->
				<div class="container mb-10" id="detailTable"></div>
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