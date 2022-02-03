<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj){
	document.Form.registNo.value = obj;
	document.Form.action = "<c:url value='/show/InfoCenter/View.do'/>";
	document.Form.submit();
}
function fn_Edit(){
	document.Form.action = "<c:url value='/show/InfoCenter/Edit.do'/>";
	document.Form.submit();
}
function fn_Delete(){
	document.Form.action = "<c:url value='/show/InfoCenter/DeleteBoard.do'/>";
	document.Form.submit();
}
function fn_FileDownload(obj1, obj2){
	document.Form.filePath.value = obj1;
	document.Form.fileNm.value = obj2;
	document.Form.action = "<c:url value='/komea/downloadFile.do'/>";
	document.Form.submit();
}
function fn_List(){
	document.Form.action = "<c:url value='/show/InfoCenter/List.do'/>";
	document.Form.submit();
}
//참가하기
function fn_Inert(){

	var obj1 = document.Form.bbsTy.value;
	var obj2 = document.Form.registNo.value;
	var obj3 = document.Form.bbscttNo.value;
	var obj4 = document.Form.eventCd.value;
	var obj5 = document.Form.eventGb.value;
	
	$.ajax({
		url : "/show/isLoginAndBbsDataSet.do",
		type : "POST",
		data : "bbsTy="+obj1+"&registNo="+obj2+"&bbscttNo="+obj3+"&eventCd="+obj4+"&eventGb="+obj5,
		success : function(data) {
			if(!data.isLogin){
				if (confirm("로그인이 필요합니니다. 로그인 화면으로 이동하시겠습니까?")) {
					document.Form.action = "<c:url value='/komea/login.do'/>";
					document.Form.submit();
				}
			}else{
				if(data.ssbyp == "2"){
					if(data.preReq){
						alert("이미 우수기업선정 신청을 하였습니다.");
					}else{
						document.Form.action = "<c:url value='/show/InfoCenter/BestCompanyRequestWrite.do'/>";
						document.Form.submit();
					}
				}else{
					alert("기업회원이 아니면 신청 하실 수 없습니다.");
				}
			}
		}
	});
}
</script>
<body>
<form:form name="Form" commandName="show" method="post">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="6"/>
	<form:input type="hidden" path="bbscttNo" name="bbscttNo" id="bbscttNo" value=""/>
	<form:input type="hidden" path="eventCd" name="eventCd" id="eventCd" value=""/>
	<form:input type="hidden" path="eventGb" name="eventGb" id="eventGb" value=""/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
	<form:input type="hidden" path="filePath" name="filePath" id="filePath" value=""/>
	<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value="0"/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading col-12">
					<h2>우수기업선정</h2>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시판  view시작 { -->

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="javascript:fn_List();" class="btn btn-sm btn-secondary" >목록</a>
				            <c:if test="${loginInfo.ssbyp eq '2' && showVO.etc1 eq '진행'}">
				            <a href="javascript:fn_Inert()" class="btn btn-sm btn-primary" >신청하기</a>
				            </c:if>
				            <c:if test="${loginInfo.compLevel eq 'A'}">
				            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit();" class="btn btn-sm btn-primary" >수정</a>
				            </c:if>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

				    <!-- 제목 시작 {
					<div class="border-top-1">
						<h4 class="text-bold text-info mt-10 pl-10" >행사 : ${showVO.eventNm}</h4>
					</div>
					 -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" >${showVO.sj}<span class="btn btn-xs btn-success rounded-1">${showVO.etc1}</span></h4>
						<div class="row justify-content-end" >
								<div class="col-auto" >
									<span class="text-secondary" >&middot; 작성자 : </span><strong>${showVO.wrterNm}</strong>
								</div>
						        <div class="col-auto" >
					        		<span class="text-secondary" >&middot; 작성일 : </span>
					        		<strong>
										<fmt:parseDate value="${showVO.writngDe}" var="writngDe" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${writngDe}" pattern="yyyy.MM.dd"/>
									</strong>
					        	</div>
					        	<div class="col-auto" >
					            	<span class="text-secondary" >&middot; 조회 : </span><strong><fmt:formatNumber value="${showVO.rdcnt}" type="number"/></strong>
					            </div>
						</div>
				    </div>
				    <!-- } 제목끝 -->

					<!-- 첨부파일 시작 { -->
					<div class="bo-v-file">
						<ul class="nav list-inline">
							<c:if test="${showVO.atchFileNm != null}">
								<li class="list-inline-item mr-15"><a href="javascript:fn_FileDownload('${showVO.atchFileCours}','${showVO.atchFileNm}');"><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm}" /></a></li>
							</c:if>
							<c:if test="${showVO.atchFileNm2 != null}">
								<li class="list-inline-item mr-15"><a href="javascript:fn_FileDownload('${showVO.atchFileCours2}','${showVO.atchFileNm2}');"><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm2}" /></a></li>
							</c:if>
							<c:if test="${showVO.atchFileNm3 != null}">
								<li class="list-inline-item mr-15"><a href="javascript:fn_FileDownload('${showVO.atchFileCours3}','${showVO.atchFileNm3}');"><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm3}" /></a></li>
							</c:if>
						</ul>
					</div>
					<!-- } 첨부파일 끝 -->

				    <!-- 본문 내용 시작 { -->
				    <div class="bo-v-content">
						<c:out value="${showVO.cn}" escapeXml="false" />
				    </div>
				    <div class="bo-v-content-box">
						입찰선정업체 : <span class="text-danger"><c:out value="${showVO.etc2}" escapeXml="false" /></span>
				    </div>
				    <!-- } 본문 내용 끝 -->

					<div class="bo-v-navi">
							<c:choose>
							<c:when test="${fn:length(PreNextList) > 0}">
							<c:forEach var="PreNextList" items="${PreNextList}" varStatus="status">
							<div class="prev">
									<span class="font-light"><c:out value="${PreNextList.gb}" /></span>
									<a href="javascript:detail('${PreNextList.registNo}');"><c:out value="${PreNextList.sj}" /></a>
							</div>
							</c:forEach>
							</c:when>
							</c:choose>
					</div>

		    		<!-- 버튼 시작 { -->
				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="javascript:fn_List();" class="btn btn-sm btn-secondary" >목록</a>
				            <c:if test="${loginInfo.ssbyp eq '2' && showVO.etc1 eq '진행'}">
				            <a href="javascript:fn_Inert()" class="btn btn-sm btn-primary" >신청하기</a>
				            </c:if>
				            <c:if test="${loginInfo.compLevel eq 'A'}">
				            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit();" class="btn btn-sm btn-primary" >수정</a>
				            </c:if>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->


				</div><!--// bo_v-->
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>