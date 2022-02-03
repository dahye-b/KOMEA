<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 우수기업선정 신청서</h5>
					<div class="container mb-10">

							<div class="bo-v-row border-top-3 row">
								<div class="col-md-2 fth">회사명</div>
								<div class="col-md-4"><c:out value="${resultList.cmpnyNm}" /></div>
								<div class="col-md-2 fth">회사명 영문</div>
								<div class="col-md-4"><c:out value="${resultList.cmpnyNmEng}" /></div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">대표자</div>
								<div class="col-md-4"><c:out value="${resultList.rprsntv}" /></div>
								<div class="col-md-2 fth">설립일</div>
								<div class="col-md-4"><c:out value="${resultList.fondDe}" /></div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">사업자등록번호</div>
								<div class="col-md-4"><c:out value="${resultList.bizNum}" /></div>
								<div class="col-md-2 fth">법인등록번호</div>
								<div class="col-md-4"><c:out value="${resultList.corNum}" /></div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">주소</div>
								<div class="col-md-4">
									<c:out value="${resultList.postCode}" /> &nbsp;
									<c:out value="${resultList.locplc}" />
								</div>
								<div class="col-md-2 fth">상시근로자수</div>
								<div class="col-md-4"><c:out value="${resultList.workCnt}" /></div>
							</div>

							<div class="bo-v-row row">
								<div class="col-md-2 fth">최근2년간 매출액</div>
								<div class="col-md-10">
									<c:out value="${resultList.salamtStdyy1}" />년 : <c:out value="${resultList.salamt1}" />(백만원)<br/>
									<c:out value="${resultList.salamtStdyy2}" />년 : <c:out value="${resultList.salamt2}" />(백만원)
								</div>
							</div>

							<div class="bo-v-row row">
								<div class="col-md-2 fth">홈페이지 주소</div>
								<div class="col-md-10"><c:out value="${resultList.hmpg}" /></div>
							</div>

							<div class="bo-v-row row">
								<div class="col-md-2 fth">담당자이름</div>
								<div class="col-md-4"><c:out value="${resultList.chargerNm}" /></div>
								<div class="col-md-2 fth">담당자부서</div>
								<div class="col-md-4">
									<c:out value="${resultList.chargerDept}" />&nbsp;
									<c:out value="${resultList.chargerOfcps}" />
								</div>
							</div>
							
							<div class="bo-v-row row">
								<div class="col-md-2 fth">담당자 직통번호</div>
								<div class="col-md-4"><c:out value="${resultList.chargerTlphon}" /></div>
								<div class="col-md-2 fth">담당자 이메일</div>
								<div class="col-md-4"><c:out value="${resultList.chargerEmail}" /></div>
							</div>

							<div class="bo-v-row row">
								<div class="col-md-2 fth">주요 생산품목</div>
								<div class="col-md-10"><c:out value="${resultList.mainPrduct}" />
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">신청서<span class="required"></span></div>
								<div class="col-md-10"><c:out value="${resultList.applyFileNm}" />
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">주요생산품목<span class="required"></span></div>
								<div class="col-md-10"><c:out value="${resultList.mainProductFileNm}" />
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">사업자등록증 사본<span class="required"></span></div>
								<div class="col-md-10"><c:out value="${resultList.rsctftFileNm}" />
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">대표자이력서<span class="required"></span></div>
								<div class="col-md-10"><c:out value="${resultList.careerFileNm}" />
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">개인정보수집 및 동의서<span class="required"></span></div>
								<div class="col-md-10"><c:out value="${resultList.agreeFileNm}" />
								</div>
							</div>
					</div>
					
				    <!-- 버튼 시작 { -->
				    <div class="clearfix text-right" >
				        	<a href="<c:url value='/show/bestCompManage.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
				    </div>
				    <!-- } 버튼 끝 -->

				</div>