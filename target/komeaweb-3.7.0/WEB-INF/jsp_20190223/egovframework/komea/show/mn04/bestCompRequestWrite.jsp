<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function fn_Insert(){
	document.Form.action = "<c:url value='/show/InfoCenter/InsertBestCompanyReqstInfo.do'/>";
	document.Form.submit();
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="6"/>
	<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="wrter" name="wrter" id="wrter" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="writngDe" name="writngDe" id="writngDe" value="${toDay}"/>

	<form:input type="hidden" path="eventGb" name="eventGb" id="eventGb" value=""/>
	<form:input type="hidden" path="eventCd" name="eventCd" id="eventCd" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>우수기업선정 신청서 작성</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">
					<!-- 회원정보 시작 { -->
					<h4 class=""><i class="fas fa-edit"></i> 신청하시고 다시 수정할 수 없으니 신중히 기입하시기 바랍니다.</h4>
					<p>
						<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
					</p>
					<div class="container mt-30 mb-30" >
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/bestCompanyRequestForm.jsp" />
					</div><!-- div class="container bg-light mt-30 mb-30 bo-w"  -->
					<!-- } 회원정보 끝 -->

					<div class="text-center mb-50">
						<a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="등록" >등록</a>
						<a class="btn btn-sm btn-secondary" href="<c:url value='/show/InfoCenter/List.do'/>" title="목록" >목록</a>
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

	</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>