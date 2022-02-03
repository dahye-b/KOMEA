<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Save(){
	if ($('#password').val() != $('#cfm_password').val()) {
		alert("비밀번호 와 비밀번호 확인 값이 일치 하지 않습니다.");
		return;
	}
	document.Form.action = "<c:url value='/show/UpdateMber.do'/>";
	document.Form.submit();
}
</script>
<body>

<!-- ##### Section-nav Area End ##### -->
<form:form name="Form" commandName="mberVO" method="post" enctype="multipart/form-data">
	<form:input type="hidden" name="ssbyp" path="ssbyp" id="ssbyp" value=""/>
	<form:input type="hidden" name="mberCd" path="mberCd" id="mberCd" value=""/>
	<form:input type="hidden" name="sbscrbConfmYn" path="sbscrbConfmYn" id="sbscrbConfmYn" value=""/>
	<form:input type="hidden" name="insertUserId" path="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
	<form:input type="hidden" name="updateUserId" path="updateUserId" id="updateUserId" value="${loginInfo.id}"/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>기본정보관리</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">

						<!-- 회원정보 시작 { -->
						<h4 class=""><i class="fas fa-user-edit"></i> 회사정보</h4>
						<p>
							<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
						</p>
						<div class="container mt-10" >
							<c:choose>
								<c:when test="${mberVO.ssbyp eq '1'}">
									<!-- 기관회원 -->
									<!-- 기관회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/orgRegistForm.jsp">
									<jsp:param value="Edit" name="flag"/>
									</jsp:include>
									<!-- 기관회원입력 끝 -->
								</c:when>
								<c:when test="${mberVO.ssbyp eq '2'}">
									<!-- 기업회원 -->
									<!-- 기업회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/compRegistForm.jsp">
									<jsp:param value="Edit" name="flag"/>
									</jsp:include>
									<!-- 기업회원입력 끝 -->
								</c:when>
								<c:otherwise>
									<!-- 기타 -->
									<!-- 기타회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/othersRegistForm.jsp">
									<jsp:param value="Edit" name="flag"/>
									</jsp:include>
									<!-- 기타회원입력 끝 -->
								</c:otherwise>
							</c:choose>

						</div><!-- div class="container bg-light mt-30 mb-30 bo-w"  -->
						<!-- } 회원정보 끝 -->

						<div class="text-center mt-10">
							<a href="javascript:fn_Save();" class="btn btn-sm btn-primary" role="button">기본정보저장</a>
						</div>

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

	</form:form>


<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
