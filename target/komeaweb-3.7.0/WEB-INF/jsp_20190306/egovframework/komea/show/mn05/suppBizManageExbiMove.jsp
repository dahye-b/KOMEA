<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
//저장
function fn_Save(){
	document.Form.action = "<c:url value='/show/UpdateSuppBizManageExbi.do'/>";
	document.Form.submit();
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
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>지원사업관리 지난행사이전</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiMoveView.jsp" />
					<div class="text-center mt-10">
						<a href="javascript:fn_Save();" class="btn btn-sm btn-primary" role="button">저장</a>
						<a href="/show/SuppBizManage.do" class="btn btn-sm btn-secondary" role="button">취소</a>
					</div>
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
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>