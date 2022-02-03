<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	document.ListForm.pageIndex.value = pageNo;
	document.ListForm.action = "<c:url value='/show/BiddingAppManage.do'/>";
	document.ListForm.submit();
}
function fn_Search(obj){
	document.ListForm.action = "<c:url value='/show/BiddingAppManage.do'/>";
	document.ListForm.submit();
}
</script>
<body>
<form:form name="ListForm" commandName="show" method="post">
<form:input type="hidden" name="bbsTy" path="bbsTy" id="bbsTy" value="2"/>
<form:input type="hidden" name="bbscttNo" path="bbscttNo" id="bbscttNo" value=""/>
<form:input type="hidden" name="mberCd" path="mberCd" id="mberCd" value=""/>
<form:input type="hidden" name="winnerStatus" path="winnerStatus" id="winnerStatus" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>입찰신청관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v show">
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/biddingRequestDetail.jsp" />
				    <!-- 버튼 시작 { -->
				    <div class="text-right" >
				        <a href="<c:url value='/show/BiddingAppManage.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
				    </div>
				    <!-- } 버튼 끝 -->
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
