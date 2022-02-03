<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_downloadFile(obj1, obj2){
	document.Form.fileCours.value = obj1;
	document.Form.fileNm.value = obj2;
	document.Form.action = "<c:url value='/komea/show/downloadFile.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="mberVO" method="post">
<form:input type="hidden" path="fileCours" name="fileCours" id="fileCours" value=""/>
<form:input type="hidden" path="fileNm" name="fileNm" id="fileNm" value=""/>

	<!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>회원사목록</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">

						<!-- 회원정보 시작 { -->
						<h4 class=""><i class="fas fa-user-edit"></i> ${mberVO.cmpnyNm}</h4>
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


						<h5 class="mt-50 mb-1" >성과누적현황</h5>
						<div class="container mb-10">
							<div class="bo-v-row border-top-1 row">
									<div class="col-md-6 fth py-10 bg-light">행사명</div>
									<div class="col-md-3 fth py-10 bg-light">상담액</div>
									<div class="col-md-3 fth py-10 bg-light">계약액</div>
							</div>
							<c:choose>
								<c:when test="${fn:length(ResultAccList) > 0}">
									<c:forEach var="ResultAccList" items="${ResultAccList}" varStatus="status">
										<div class="bo-v-row row">
											<div class="col-md-6 text-center"><c:out value="${ResultAccList.eventNm}" /></div>
											<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccList.acCnsltAmt}" type="number"/></div>
											<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccList.acCntrctAmt}" type="number"/></div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="bo-v-row row">
										<div class="col-md-12 text-center" >조회된 결과가 없습니다.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<h5 class="mt-50 mb-1" >성과누적현황 합계표</h5>
						<div class="container mb-10">
							<div class="bo-v-row border-top-1 row">
								<div class="col-md-6 fth py-10 bg-light">합계</div>
								<div class="col-md-3 text-center py-10"><fmt:formatNumber value="${ResultAccSum.acCnsltAmt}" type="number"/></div>
								<div class="col-md-3 text-center py-10"><fmt:formatNumber value="${ResultAccSum.acCntrctAmt}" type="number"/></div>
							</div>
						</div>

					    <!-- 버튼 시작 { -->
					    <div class="clearfix mb-30 text-right" >
					        	<a href="<c:url value='/show/CompanyList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
					    </div>
					    <!-- } 버튼 끝 -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
