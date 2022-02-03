<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_PreExbiData(obj){
	document.Form.preExbiCd.value=obj;
	document.Form.action = "<c:url value='/show/suppBizManageExbiEdit.do'/>";
	document.Form.submit();
}
//저장
function fn_Save(){
	document.Form.action = "<c:url value='/show/UpdateSuppBizManageExbi.do'/>";
	document.Form.submit();
}
//목록으로
function fn_List(){
	document.Form.action = "<c:url value='/show/SuppBizManage.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>지원사업관리</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
					<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiRegistForm.jsp" />
					<div class="text-center mt-10">
						<a href="javascript:fn_Save();" class="btn btn-sm btn-primary" role="button">저장</a>
						<a href="javascript:fn_List();" class="btn btn-sm btn-secondary" role="button">취소</a>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>