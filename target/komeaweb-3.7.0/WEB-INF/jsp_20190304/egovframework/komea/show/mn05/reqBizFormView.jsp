<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
</script>
<body>
<form:form name="Form" commandName="show" method="post">

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>사업참여관리</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v show">
				<c:choose>
					<c:when test="${ViewGb eq '0'}">
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiRequestRegistDetail.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/cnsltRequestRegistDetail.jsp" />
					</c:otherwise>
				</c:choose>
				    <!-- 버튼 시작 { -->
				    <div class="text-right" >
				        <a href="<c:url value='/show/ReqBizList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
				    </div>
				    <!-- } 버튼 끝 -->
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>