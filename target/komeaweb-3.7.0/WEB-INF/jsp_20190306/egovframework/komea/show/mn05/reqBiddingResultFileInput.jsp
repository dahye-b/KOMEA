<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Insert(){
	var fm = document.Form;

	if(fm.resultFileNm1.value == ""){
		alert("일정첨부1을 첨부하세요.");
		fm.resultFileNm1.focus();
		return;
	}

	document.Form.action = "<c:url value='/show/InsertReqBiddingResultFile.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">
<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
<form:input type="hidden" path="bbscttNo" name="bbscttNo" id="bbscttNo" value=""/>
<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>참여입찰관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v show">
						<div class="bo-w-row border-top-3 row">
							<div class="col-md-2 fth">
								<label class="col-form-label required">일정첨부1</label>
							</div>
							<div class="col-md-10">
								<input type="file" name="resultFileNm1" id="resultFileNm1"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">일정첨부2</label>
							</div>
							<div class="col-md-10">
								<input type="file" name="resultFileNm2" id="resultFileNm2"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label">비고</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control form-control-sm" name="remarks" id="remarks" rows="3"></textarea>
							</div>
						</div>
				    <!-- 버튼 시작 { -->
				    <div class="text-right" >
				        <a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="등록" >등록</a>
				        <a href="<c:url value='/show/ReqBiddingList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
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