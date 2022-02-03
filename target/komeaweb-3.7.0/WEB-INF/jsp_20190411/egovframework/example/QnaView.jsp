<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Reply(){
	document.Form.action = "<c:url value='/komea/bbs/QnaReplyWrite.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="gulIdx" name="gulIdx" id="gulIdx" value=""/>
	<form:input type="hidden" path="srsn" name="srsn" id="srsn" value=""/>
	<form:input type="hidden" path="password" name="password" id="password" value=""/>

    <!-- ##### Board View Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>열린제안</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시판  view시작 { -->

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/QnaList.do'/>" class="btn btn-sm btn-secondary" >목록</a>
				            <c:if test="${loginInfo.compLevel eq 'A'}">
				            	<a href="javascript:fn_Reply();" class="btn btn-sm btn-primary" >답변</a>
				            </c:if>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

				    <!-- 제목 시작 { -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" >${bbs.title}</h4>
						<div class="row justify-content-end" >
							<div class="col-auto" >
								<span class="text-secondary" >&middot; 작성자 : </span><strong>${bbs.name}</strong>
							</div>
							<div class="col-auto" >
								<span class="text-secondary" >&middot; 작성일 : </span><strong>${bbs.insertDt}</strong>
							</div>
						</div>
				    </div>
				    <!-- } 제목끝 -->
				    <!-- 본문 내용 시작 { -->
				    <div class="bo-v-content">
						<c:out value="${bbs.contents}" escapeXml="false" />
				    </div>
				    <!-- } 본문 내용 끝 -->
				    <div class="bo-v-navi">
				    </div>

		    		<!-- 버튼 시작 { -->
				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/QnaList.do'/>" class="btn btn-sm btn-secondary" >목록</a>
				            <c:if test="${loginInfo.compLevel eq 'A'}">
				            <a href="javascript:fn_Reply();" class="btn btn-sm btn-primary" >답변</a>
				            </c:if>
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
