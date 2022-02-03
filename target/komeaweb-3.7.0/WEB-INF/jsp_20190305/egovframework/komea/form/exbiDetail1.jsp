<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<h2 class="show-title" >${ExbiRegistInfo.exbiNm}</h2>
					<div class="mb-30" >
								<div class="row" >
									<div class="col-lg-5 text-center">

										<div class="slides">
											<div id="myCarousel" class="carousel slide" data-ride="carousel">
												<div class="carousel-inner">
														<div class="carousel-item active">
															<c:choose>
																<c:when test="${not empty ExbiRegistInfo.exbiPhotoFilePath1}">
																	<img class="w-100" src="<c:out value='${ExbiRegistInfo.exbiPhotoFilePath1}' />" alt="<c:out value='${ExbiRegistInfo.exbiPhotoFileNm1}' />">
																</c:when>
																<c:otherwise>
																	<img class="w-100" src="/img/core-img/noimg.jpg" alt="No Image">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="carousel-item">
															<c:choose>
																<c:when test="${not empty ExbiRegistInfo.exbiPhotoFilePath2}">
																	<img class="w-100" src="<c:out value='${ExbiRegistInfo.exbiPhotoFilePath2}' />" alt="<c:out value='${ExbiRegistInfo.exbiPhotoFileNm2}' />">
																</c:when>
																<c:otherwise>
																	<img class="w-100" src="/img/core-img/noimg.jpg" alt="No Image">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="carousel-item">
															<c:choose>
																<c:when test="${not empty ExbiRegistInfo.exbiPhotoFilePath3}">
																	<img class="w-100" src="<c:out value='${ExbiRegistInfo.exbiPhotoFilePath3}' />" alt="<c:out value='${ExbiRegistInfo.exbiPhotoFileNm3}' />">
																</c:when>
																<c:otherwise>
																	<img class="w-100" src="/img/core-img/noimg.jpg" alt="No Image">
																</c:otherwise>
															</c:choose>
														</div>
														<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
															<span class="carousel-control-prev-icon" aria-hidden="true"></span>
															<span class="sr-only">Previous</span>
														</a>
														<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
															<span class="carousel-control-next-icon" aria-hidden="true"></span>
															<span class="sr-only">Next</span>
														</a>
												</div>
												<ol class="carousel-indicators imgs">
														<li data-target="#myCarousel" data-slide-to="0" class="active">
															<c:choose><c:when test="${not empty CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1}"><img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1}' />" ></c:when>
																<c:otherwise><img class="d-block w-100" src="/img/core-img/noimg.jpg" ></c:otherwise>
															</c:choose>
														</li>
														<li data-target="#myCarousel" data-slide-to="1">
															<c:choose><c:when test="${not empty CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2}"><img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2}' />" ></c:when>
																<c:otherwise><img class="d-block w-100" src="/img/core-img/noimg.jpg" ></c:otherwise>
															</c:choose>
														</li>
														<li data-target="#myCarousel" data-slide-to="2">
															<c:choose><c:when test="${not empty CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3}"><img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3}' />" ></c:when>
																<c:otherwise><img class="d-block w-100" src="/img/core-img/noimg.jpg" ></c:otherwise>
															</c:choose>
														</li>
												</ol>
											</div>
										</div><!-- div class="slides" -->

									</div>
									<div class="col-lg-7">
											<div class="d-lg-none mt-30" ></div>
											<h5 class="mb-1" ><i class="fas fa-bars text-info"></i> 전시개요</h5>
											<div class="container mb-10">
														<div class="bo-v-row border-top-3 row">
															<div class="col-md-4 fth">전시회명</div>
															<div class="col-md-8">${ExbiRegistInfo.exbiNm}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">개최기간</div>
															<div class="col-md-8">
																<fmt:parseDate value="${ExbiRegistInfo.opmtBeginDe}" var="opmtBeginDe" pattern="yyyyMMdd"/>
																<fmt:parseDate value="${ExbiRegistInfo.opmtClosDe}" var="opmtClosDe" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${opmtBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${opmtClosDe}" pattern="yyyy.MM.dd"/>
															</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">개최장소</div>
															<div class="col-md-8">${ExbiRegistInfo.opmtPlace}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">지원기관</div>
															<div class="col-md-8">${ExbiRegistInfo.supportOrganNm}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">주최기관</div>
															<div class="col-md-8">${ExbiRegistInfo.mainInsttNm}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">홈페이지</div>
															<div class="col-md-8"><a href="${ExbiRegistInfo.homepage}">${ExbiRegistInfo.homepage}</a></div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">참가규모</div>
															<div class="col-md-8">${ExbiRegistInfo.totalPartcptScale} /
																${ExbiRegistInfo.spceByUnit} /
																참가업체수 : ${ExbiRegistInfo.totalPartcptCnt}개사 /
																참관객 : ${ExbiRegistInfo.totalPartcptPeople}명
															</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">한국관 참가규모</div>
															<div class="col-md-8">${ExbiRegistInfo.korPartcptScaleNum}  /
																${ExbiRegistInfo.spceByUnit} /
																참가업체수 : ${ExbiRegistInfo.korPartcptCompCnt}개사 / ${ExbiRegistInfo.korPartcptSpceCnt}부스
															</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">상담실적</div>
															<div class="col-md-8">${ExbiRegistInfo.cnsltCnt}건 / US$ ${ExbiRegistInfo.cnsltMoney}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">계약(추진)액</div>
															<div class="col-md-8">${ExbiRegistInfo.contractCnt}건 / US$ ${ExbiRegistInfo.contractMoney}</div>
														</div>
														<div class="bo-v-row row">
															<div class="col-md-4 fth">기타성과</div>
															<div class="col-md-8">${ExbiRegistInfo.etcResult}</div>
														</div>
											</div>

											<div class="row" >
												<div class="col-sm-6" >
											        <div class="btn-group btn-group-justified">
														<a href="javascript:consEnterCompList('${ViewGb}','${ExbiRegistInfo.exbiCd}');" class="btn btn-sm btn-secondary" role="button">참가업체리스트</a>
														<a href="javascript:viewFloorPlan(event);" class="btn btn-sm btn-secondary" role="button">Floor Plan</a>
														<a href="javascript:resultFileList('${ViewGb}', '${ExbiRegistInfo.exbiCd}');" class="btn btn-sm btn-secondary" role="button">일정확인</a>
											      	</div>
												</div>
												<div class="col-sm-6 text-right" >
													<a href="javascript:showAExbiResearch();" class="btn btn-sm btn-primary" role="button">행사 통계 분석 보기</a>
												</div>
											</div>

									</div>
								</div>
					</div>
