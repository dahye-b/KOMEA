<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function detail(obj1, obj2, obj3, obj4){
	document.Form.idx.value = obj1;
	document.Form.block.value = obj2;
	document.Form.rlevel.value = obj3;
	document.Form.boss.value = obj4;
	document.Form.action = "<c:url value='/komea/bbs/View.do'/>";
	document.Form.submit();
}
function fn_downloadFile(obj1, obj2){
	document.Form.idx.value = obj1;
	document.Form.fNo.value = obj2;
	document.Form.action = "<c:url value='/komea/bbs/downloadFile.do'/>";
	document.Form.submit();
}
function fn_Edit(){
	document.Form.action = "<c:url value='/komea/bbs/Edit.do'/>";
	document.Form.submit();
}
function fn_Delete(){
	document.Form.action = "<c:url value='/komea/bbs/DeleteKomeaBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value="B009"/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	<form:input type="hidden" path="fNo" name="fNo" id="fNo" value=""/>

    <!-- ##### Board View Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading col-12">
					<h2>${BoardName}</h2>
				</div>

            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시판  view시작 { -->

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/List.do?bCode=${bbsVO.bCode}'/>" class="btn btn-sm btn-secondary" >목록</a>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

				    <!-- 제목 시작 { -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" ><span class="text-secondary text-center" >${bbsVO.idx}. </span> ${bbsVO.title}</h4>
						<div class="row justify-content-end" >
								<div class="col-auto" >
									<span class="text-secondary" >&middot; 작성자 : </span><strong>${bbsVO.uName}</strong>
								</div>
						        <div class="col-auto" >
					        		<span class="text-secondary" >&middot; 작성일 : </span><strong>${bbsVO.indate}</strong>
					        	</div>
					        	<div class="col-auto" >
					            	<span class="text-secondary" >&middot; 조회 : </span><strong>${bbsVO.cnt}</strong>
					            </div>
						</div>
				    </div>
				    <!-- } 제목끝 -->

					<!-- 첨부파일 시작 { -->
					<div class="bo-v-file">
						<ul class="nav list-inline">
							<c:choose>
								<c:when test="${fn:length(uploadFileList) > 0}">
									<c:forEach var="uploadFileList" items="${uploadFileList}" varStatus="status">
									<li class="list-inline-item mr-15"><a href="javascript:fn_downloadFile(${uploadFileList.gulIdx},${uploadFileList.fNo});" title="<c:out value="${uploadFileList.fNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${uploadFileList.fNm}" /> <span class="text-muted" >(Size:${uploadFileList.fSize})</span></a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="list-inline-item">첨부파일이 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- } 첨부파일 끝 -->

				    <!-- 본문 내용 시작 { -->
				    <div class="bo-v-content">
						<c:out value="${bbsVO.contents}" escapeXml="false" />
				    </div>
				    <!-- } 본문 내용 끝 -->

					<div class="bo-v-navi">
							<c:choose>
							<c:when test="${fn:length(PreNextList) > 0}">
							<c:forEach var="PreNextList" items="${PreNextList}" varStatus="status">
							<div class="prev">
									<span class="font-light"><c:out value="${PreNextList.gb}" /></span>
									<a href="javascript:detail(${PreNextList.idx},${PreNextList.block},${PreNextList.rlevel},${PreNextList.boss});"><c:out value="${PreNextList.title}" /></a>
							</div>
							</c:forEach>
							</c:when>
							</c:choose>
					</div>

		    		<!-- 버튼 시작 { -->
				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/List.do?bCode=${bbsVO.bCode}'/>" class="btn btn-sm btn-secondary" >목록</a>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->


				</div><!--// bo_v-->

			</div>
		</div>
   	</section>
    <!-- ##### Board View Section End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
