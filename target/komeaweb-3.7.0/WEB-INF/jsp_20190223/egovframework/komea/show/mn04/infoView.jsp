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
</script>
<body>
<form:form name="Form" commandName="show" method="post">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="4"/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
	<form:input type="hidden" path="filePath" name="filePath" id="filePath" value=""/>
	<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value="0"/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading col-12">
					<h2>정보마당</h2>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시판  view시작 { -->

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="javascript:fn_List();" class="btn btn-sm btn-secondary" >목록</a>
				            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit();" class="btn btn-sm btn-primary" >수정</a>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

				    <!-- 제목 시작 { -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" >${showVO.sj}</h4>
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
				            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary" >삭제</a>
				            <a href="javascript:fn_Edit();" class="btn btn-sm btn-primary" >수정</a>
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
