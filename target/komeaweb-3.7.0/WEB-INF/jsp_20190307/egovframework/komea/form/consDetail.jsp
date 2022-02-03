<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<h2 class="show-title" >${CnsltexhbRegistInfo.eventNm}</h2>
					<div class="mb-30" >
								<div class="row" >
									<div class="col-lg-5 text-center">

										<div class="slides">
											<div id="myCarousel" class="carousel slide" data-ride="carousel">
												<div class="carousel-inner">
														<div class="carousel-item active">
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1 != null}">
																	<img class="w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1}' />" alt="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileNm1}' />">
																</c:when>
																<c:otherwise>
																	<img class="w-100" src="/img/core-img/noimg.jpg" alt="No Image">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="carousel-item">
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2 != null}">
																	<img class="w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2}' />" alt="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileNm2}' />">
																</c:when>
																<c:otherwise>
																	<img class="w-100" src="/img/core-img/noimg.jpg" alt="No Image">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="carousel-item">
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3 != null}">
																	<img class="w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3}' />" alt="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileNm3}' />">
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
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1 != null}">
																	<img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours1}' />" >
																</c:when>
																<c:otherwise>
																	<img class="d-block w-100" src="/img/core-img/noimg.jpg" >
																</c:otherwise>
															</c:choose>
														</li>
														<li data-target="#myCarousel" data-slide-to="1">
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2 != null}">
																	<img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours2}' />" >
																</c:when>
																<c:otherwise>
																	<img class="d-block w-100" src="/img/core-img/noimg.jpg" >
																</c:otherwise>
															</c:choose>
														</li>
														<li data-target="#myCarousel" data-slide-to="2">
															<c:choose>
																<c:when test="${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3 != null}">
																	<img class="d-block w-100" src="<c:out value='${CnsltexhbRegistInfo.cnsltexhbPhotoFileCours3}' />" >
																</c:when>
																<c:otherwise>
																	<img class="d-block w-100" src="/img/core-img/noimg.jpg" >
																</c:otherwise>
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
														<div class="col-md-3 fth">행사명</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.eventNm}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">행사기간</div>
														<div class="col-md-9">
															<fmt:parseDate value="${CnsltexhbRegistInfo.eventBeginDe}" var="eventBeginDe" pattern="yyyyMMdd"/>
															<fmt:parseDate value="${CnsltexhbRegistInfo.eventClosDe}" var="eventClosDe" pattern="yyyyMMdd"/>
															<fmt:formatDate value="${eventBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${eventClosDe}" pattern="yyyy.MM.dd"/>
														</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">접수기간</div>
														<div class="col-md-9">
															<fmt:parseDate value="${CnsltexhbRegistInfo.rceptBeginDe}" var="rceptBeginDe" pattern="yyyyMMdd"/>
															<fmt:parseDate value="${CnsltexhbRegistInfo.rceptClosDe}" var="rceptClosDe" pattern="yyyyMMdd"/>
															<fmt:formatDate value="${rceptBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${rceptClosDe}" pattern="yyyy.MM.dd"/>
														</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">장소</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.place}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">주관기관</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.mngeInstt}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">주최기관</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.insttNm}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">후원기관</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.suprtInstt}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">주요내용</div>
														<div class="col-md-9">${CnsltMainCn}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">지원내용</div>
														<div class="col-md-9">${CnsltSportCn}</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">총 상담실적</div>
														<div class="col-md-9">${CnsltexhbRegistInfo.cnsltCnt}건 / <fmt:formatNumber value="${CnsltexhbRegistInfo.cnsltAmtSum}" type="number"/></div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth">전년도 지원사업<br/>실적내용</div>
														<div class="col-md-9 no-padding">
															<div class="container">
																<div class="bo-v-row row">
																	<div class="col-md-3 fth no-b-border">상담액</div>
																	<div class="col-md-3 no-b-border"><fmt:formatNumber value="${CnsltexhbRegistInfo.prevYearCnsltSum}" type="number"/></div>
																	<div class="col-md-3 fth no-b-border">참가업체수<br/>(국내업체/바이어)</div>
																	<div class="col-md-3 no-b-border">${CnsltexhbRegistInfo.prevYearCompEnter} / ${CnsltexhbRegistInfo.domPrevYearCompEnter}</div>
																</div>
															</div>
														</div>
													</div>
													<div class="bo-v-row row">
														<div class="col-md-3 fth" >문의처</div>
														<div class="col-md-9 no-padding">
															<div class="container">
																<div class="bo-v-row row">
																	<div class="col-md-3 fth">담당자</div>
																	<div class="col-md-3">${CnsltexhbRegistInfo.chargerNm}</div>
																	<div class="col-md-3 fth">이메일</div>
																	<div class="col-md-3">${CnsltexhbRegistInfo.chargerEmail}</div>
																</div>
																<div class="bo-v-row row">
																	<div class="col-md-3 fth">전화</div>
																	<div class="col-md-3">${CnsltexhbRegistInfo.chargerTlphon}</div>
																	<div class="col-md-3 fth">팩스</div>
																	<div class="col-md-3">${CnsltexhbRegistInfo.chargerFax}</div>
																</div>
																<div class="bo-v-row row">
																	<div class="col-md-3 fth no-b-border">부서</div>
																	<div class="col-md-3 no-b-border">${CnsltexhbRegistInfo.cnsltChargerDept}</div>
																	<div class="col-md-3 fth no-b-border">직책</div>
																	<div class="col-md-3 no-b-border">${CnsltexhbRegistInfo.cnsltChargerOfcps}</div>
																</div>
															</div>
														</div>
													</div>
											</div><!-- div class="container mb-10" -->


											<div class="row" >
												<div class="col-sm-6" >
											        <div class="btn-group btn-group-justified">
														<a href="javascript:consEnterCompList('${ViewGb}','${CnsltexhbRegistInfo.cnsltexhbCd}');" class="btn btn-sm btn-secondary" role="button">참가업체리스트</a>
														<a href="javascript:resultFileList('${ViewGb}', '${CnsltexhbRegistInfo.cnsltexhbCd}');" class="btn btn-sm btn-secondary" role="button">일정확인</a>
											      	</div>
												</div>
												<div class="col-sm-6 text-right" >
												<!--
													<a href="javascript:showAfterResultResearch();" class="btn btn-sm btn-primary" role="button">행사 통계 분석 보기</a>
												-->
												</div>
											</div>

									</div><!-- div class="col-md-7" -->
								</div><!-- div class="row" -->

					</div><!-- div class="mb-30 container" -->
