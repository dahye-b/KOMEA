<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>
<form:form name="Form" commandName="show" method="post">

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>해외 바이어 소개</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v">

						<h4 class="mb-1" >해외 바이어 소개</h4>
						<div class="container mb-10">
									<div class="bo-v-row border-top-1 row">
										<div class="col-md-2 fth">주요서비스(상세)</div>
										<div class="col-md-10" >${BuyerInfo.mainSrvc}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">회사소개</div>
										<div class="col-md-10" >${BuyerInfo.buyerIntro}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">관심품목</div>
										<div class="col-md-4">${BuyerInfo.interestItem}</div>
										<div class="col-md-2 fth">참여행사이력</div>
										<div class="col-md-4">${BuyerInfo.partcptnEvent}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자명</div>
										<div class="col-md-4">${BuyerInfo.chargerNm}</div>
										<div class="col-md-2 fth">담당자부서</div>
										<div class="col-md-4">${BuyerInfo.chargerDept}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자직책</div>
										<div class="col-md-4">${BuyerInfo.chargerOfcps}</div>
										<div class="col-md-2 fth">담당자연락처</div>
										<div class="col-md-4">${BuyerInfo.chargerCttpc}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자이메일</div>
										<div class="col-md-4">${BuyerInfo.chargerEmail}</div>
										<div class="col-md-2 fth">첨부파일</div>
										<div class="col-md-4">${BuyerInfo.catalFileNm1}</div>
									</div>
						</div>


						<h5 class="mt-50 mb-1" >성과누적현황</h5>
						<div class="container mb-10">
							<div class="bo-v-row border-top-1 row">
									<div class="col-md-6 fth">행사명</div>
									<div class="col-md-3 fth">상담액</div>
									<div class="col-md-3 fth">계약액</div>
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
								<div class="col-md-6 fth">합계</div>									
								<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccSum.acCnsltAmt}" type="number"/></div>
								<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccSum.acCntrctAmt}" type="number"/></div>					
							</div>
						</div>

					    <!-- 버튼 시작 { -->
					    <div class="clearfix mb-30 text-right" >
					        	<a href="<c:url value='/show/BuyerList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
					    </div>
					    <!-- } 버튼 끝 -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
