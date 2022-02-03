<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj){
	document.ListForm.registNo.value = obj;
	document.ListForm.action = "<c:url value='/show/InfoCenter/View.do'/>";
	document.ListForm.submit();
}
function fn_Delete(obj){
	document.ListForm.registNo.value = obj;
	document.ListForm.action = "<c:url value='/show/InfoCenter/DeleteBoard.do'/>";
	document.ListForm.submit();
}
//참가하기
function fn_Inert(){

	var obj1 = $('#bbsTy').val;
	var obj2 = $('#registNo').val;
	var obj3 = $('#bbscttNo').val;
	var obj4 = $('#eventCd').val;
	var obj5 = $('#eventGb').val;

	$.ajax({
		url : "/show/isLoginAndBbsDataSet.do",
		type : "POST",
		data : "bbsTy"+obj1+"&registNo="+obj2+"&bbscttNo="+obj3+"&eventCd="+obj4+"&eventGb="+obj5,
		success : function(data) {
			if(!data.isLogin){
				if (confirm("로그인이 필요합니니다. 로그인 화면으로 이동하시겠습니까?")) {
					document.Form.action = "<c:url value='/komea/login.do'/>";
					document.Form.submit();
				}
			}else{
				if(data.ssbyp == "3"){
					if(data.preReq){
						alert("이미 입찰공고에 참가 하였습니다.");
					}else{
						document.Form.action = "<c:url value='/show/BiddingRequestWrite.do'/>";
						document.Form.submit();
					}
				}else{
					alert("기타회원이 아니면 신청 하실 수 없습니다.");
				}
			}
		}
	});
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="2"/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
	<form:input type="hidden" path="bbscttNo" name="bbscttNo" id="bbscttNo" value=""/>
	<form:input type="hidden" path="eventCd" name="eventCd" id="eventCd" value=""/>
	<form:input type="hidden" path="eventGb" name="eventGb" id="eventGb" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading col-12">
						<h2>입찰공고</h2>
						<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시판  view시작 { -->

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="javascript:fn_Delete('${showVO.registNo}')" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit('${showVO.registNo}')" class="btn btn-sm btn-primary" >수정</a>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

				    <!-- 제목 시작 { -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" >행사 : ${showVO.eventNm}</h4>
				        <h4 class="text-bold" >제목 : ${showVO.sj}</h4>
						<div class="row justify-content-end" >
								<div class="col-auto" >
									<span class="text-secondary" >&middot; 진행상태 : </span><strong>${showVO.etc1}</strong>
								</div>
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
								<li class="list-inline-item mr-15"><a href="<c:out value="${showVO.atchFileCours}" />" title="<c:out value="${showVO.atchFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm}" /></a></li>
							</c:if>
							<c:if test="${showVO.atchFileNm2 != null}">
								<li class="list-inline-item mr-15"><a href="<c:out value="${showVO.atchFileCours2}" />" title="<c:out value="${showVO.atchFileNm2}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm2}" /></a></li>
							</c:if>
							<c:if test="${showVO.atchFileNm3 != null}">
								<li class="list-inline-item mr-15"><a href="<c:out value="${showVO.atchFileCours3}" />" title="<c:out value="${showVO.atchFileNm3}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${showVO.atchFileNm3}" /></a></li>
							</c:if>
						</ul>
					</div>
					<!-- } 첨부파일 끝 -->

				    <!-- 본문 내용 시작 { -->
				    <div class="bo-v-content">
						<c:out value="${showVO.cn}" escapeXml="false" />
				    </div>
				    <div class="bo-v-content">
						입찰선정업체 : <c:out value="${showVO.etc2}" escapeXml="false" />
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
				            <a href="<c:url value='/show/InfoCenter/List.do?bbsTy=${showVO.bbsTy}'/>" class="btn btn-sm btn-secondary" >목록</a>
				            <a href="javascript:fn_Inert()" class="btn btn-sm btn-primary" >신청하기</a>
				            <a href="javascript:fn_Delete()" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit()" class="btn btn-sm btn-primary" >수정</a>
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
