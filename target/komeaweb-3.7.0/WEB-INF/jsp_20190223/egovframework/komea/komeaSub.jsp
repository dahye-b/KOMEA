<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-1.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                                <h2 data-animation="fadeInUp" data-delay="500ms">Korea Marine Equipment Association</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">A Successful Business Partner to communicate Live with the World</p>
                                <!--<a href="#" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">Read More</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-2.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="500ms">Korea Marine Equipment Association</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">A Successful Business Partner to communicate Live with the World</p>
                                <!--<a href="#" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">Read More</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-3.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="500ms">Korea Marine Equipment Association</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">A Successful Business Partner to communicate Live with the World</p>
                                <!--<a href="#" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">Read More</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->


    <!-- ##### Rooms Area Start ##### -->
    <section class="rooms-area section-padding-100-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-6">
                    <div class="section-heading text-center">
                        <h2>News Room</h2>
                        <p>주요소식과 유용한 정보들을 신속하게 전해드립니다.</p>
                    </div>
                </div>
            </div>
						<div class="row">
						<!-- ##### Tabs ##### -->
						<div class="col-12 no-padding">
								<div class="palatin-tabs-content">
										<ul class="nav nav-tabs" id="myTab" role="tablist">
												<li class="nav-item col-12 col-md-6 col-lg-3 ">
														<a class="nav-link active" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">공지사항</a>
												</li>
												<li class="nav-item col-12 col-md-6 col-lg-3 ">
														<a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">전시행사</a>
												</li>
												<li class="nav-item col-12 col-md-6 col-lg-3 ">
														<a class="nav-link" id="tab--3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">A/S 네트워크</a>
												</li>
												<li class="nav-item col-12 col-md-6 col-lg-3 ">
														<a class="nav-link" id="tab--4" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false">기자재정보</a>
												</li>
										</ul>

										<div class="tab-content" id="myTabContent">
												<div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab--1">
														<div class="row no-margin">
																<!-- Single Blog Post Area -->
																<!-- 반복 -->
																<c:choose>
																	<c:when test="${fn:length(B001List) > 0}">
																		<c:forEach var="B001List" items="${B001List}" varStatus="status">
																			<c:choose>
																			<c:when test="${B001List.rnum eq 1}">
																				<div class="col-12 col-md-6 col-lg-3" >
																			</c:when>
																			<c:otherwise>
																				<div class="col-12 col-md-6 col-lg-3" >
																			</c:otherwise>
																			</c:choose>
																					<div class="single-blog-post mb-50" >
																							<div class="post-content">
																									<a href="single-post.html" class="post-title">
																											<h5><c:out value="${B001List.title}" /></h5>
																									</a>
																									<p class="post-excerpt"><c:out value="${B001List.contents}" /></p>
																									<div class="post-meta">																											<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i><c:out value="${B001List.indate}" /></a>
																											<a href="#"><i class="fa fa-user" aria-hidden="true"></i><c:out value="${B001List.uName}" /></a>
																									</div>
																							</div>
																					</div>
																			</div>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																	</c:otherwise>
																</c:choose>
																<!-- 반복 -->
																<div class="col-12">
																		<div class="load-more-btn text-center wow fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
																				<a href="#" class="btn mre-btn"></a>
																		</div>
																</div>
														</div>
												</div>

												<div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
														<div class="row no-margin">
																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>No 2. KOMEA, 해외 지사화 사업 업체 모집 공고</h5>
																						</a>
																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Alan Jackson</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>2018 조선해양 우수기자재업체 인정서 수여 대상업체 모집</h5>
																						</a>
																						<p class="post-excerpt">
																								1. 귀사의 일익 번창하심을 기원합니다.<br>
																								2. 우리 조합과 한국조선해양플랜트협회에서는 세계적 경쟁력을 갖춘 견실한 조선
																						</p>

																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Christina Aguilera</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>[농림축산검역본부] 뉴질랜드 수입위생 요건 강화 공지</h5>
																						</a>

																						<p class="post-excerpt">
																										2017년 4월, 우리나라 송도에서 개최된 제12차 국제식물보호협약(IPPC) 총회에서는 회원국의 동의를 거쳐 "중고 차량, 기계,
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>

																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>비즈니스 플랫폼 기반 친환경·스마트선박 기자재 기업지원 사업</h5>
																						</a>
																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>
																				</div>
																		</div>
																</div>

																<div class="col-12">
																		<div class="load-more-btn text-center fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
																				<a href="#" class="btn mre-btn"></a>
																		</div>
																</div>
														</div>
												</div>

												<div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
														<div class="row no-margin">
																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>No 3.  KOMEA, 해외 지사화 사업 업체 모집 공고</h5>
																						</a>

																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>

																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Alan Jackson</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>2018 조선해양 우수기자재업체 인정서 수여 대상업체 모집</h5>
																						</a>
																						<p class="post-excerpt">
																								1. 귀사의 일익 번창하심을 기원합니다.<br>
																								2. 우리 조합과 한국조선해양플랜트협회에서는 세계적 경쟁력을 갖춘 견실한 조선
																						</p>

																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Christina Aguilera</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>[농림축산검역본부] 뉴질랜드 수입위생 요건 강화 공지</h5>
																						</a>

																						<p class="post-excerpt">
																										2017년 4월, 우리나라 송도에서 개최된 제12차 국제식물보호협약(IPPC) 총회에서는 회원국의 동의를 거쳐 "중고 차량, 기계,
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>

																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>비즈니스 플랫폼 기반 친환경·스마트선박 기자재 기업지원 사업</h5>
																						</a>
																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>
																				</div>
																		</div>
																</div>
																<div class="col-12">
																		<div class="load-more-btn text-center fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
																				<a href="#" class="btn mre-btn"></a>
																		</div>
																</div>
														</div>

												</div>
												<div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="tab--4">
														<div class="row no-margin justify-content-center">
																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>No 4.  KOMEA, 해외 지사화 사업 업체 모집 공고</h5>
																						</a>

																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>

																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Alan Jackson</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>2018 조선해양 우수기자재업체 인정서 수여 대상업체 모집</h5>
																						</a>
																						<p class="post-excerpt">
																								1. 귀사의 일익 번창하심을 기원합니다.<br>
																								2. 우리 조합과 한국조선해양플랜트협회에서는 세계적 경쟁력을 갖춘 견실한 조선
																						</p>

																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 20 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Christina Aguilera</a>
																						</div>
																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>[농림축산검역본부] 뉴질랜드 수입위생 요건 강화 공지</h5>
																						</a>

																						<p class="post-excerpt">
																										2017년 4월, 우리나라 송도에서 개최된 제12차 국제식물보호협약(IPPC) 총회에서는 회원국의 동의를 거쳐 "중고 차량, 기계,
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>

																				</div>
																		</div>
																</div>

																<!-- Single Blog Post Area -->
																<div class="col-12 col-md-6 col-lg-3">
																		<div class="single-blog-post mb-50">
																				<div class="post-content">
																						<a href="single-post.html" class="post-title">
																								<h5>비즈니스 플랫폼 기반 친환경·스마트선박 기자재 기업지원 사업</h5>
																						</a>
																						<p class="post-excerpt">
																								한국조선해양기자재글로벌지원센터에서 ‘KOMEA 해외 지사화 사업’참가 업체를 아래와 같이 모집하오니 많은 관심과 신청을 바랍니다.
																						</p>
																						<div class="post-meta">
																								<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2018</a>
																								<a href="#"><i class="fa fa-user" aria-hidden="true"></i> Mason Jenkins</a>
																						</div>
																				</div>
																		</div>
																</div>

																<div class="col-12">
																		<div class="load-more-btn text-center fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
																				<a href="#" class="btn mre-btn"></a>
																		</div>
																</div>

														</div>

												</div>
										</div>
								</div>
						</div>
						<!-- ##### Tabs ##### -->
				</div>

        </div>
    </section>
    <!-- ##### Rooms Area End ##### -->

    <!-- ##### Grids Area Start ##### -->
    <section class="rooms-area section-padding-100-100 bg-img" style="background-image: url(img/bg-img/bg-3.jpg);">
        <div class="container">
            <div class="row">

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-6">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="100ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-1.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-blue" style="cursor:pointer;" onClick=";" >
                            <h4 class="rooms-text-h4-1">KOMEA</h4>
                            <p class="rooms-text-p-left">
								한국조선해양기자재공업협동조합은 조선산업 발전에 기여하며,
								조선해양기자재산업의 효율적인 사업 환경 조성에 이바지 하고 있습니다.
							</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="200ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" ></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text" style="cursor:pointer;" onClick=";" > 
                            <h4 class="rooms-text-h4-2">사업소개</h4>
                            <p class="rooms-text-p-left-100">
                            	<a href="about.html">공동구매사업</a>
                            </p>
							<p class="rooms-text-p-left-100">
								<a href="about.html">조선기자재 수출 및 <br>AS 거점기지 구축 및 운영</a>
							</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="300ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-2.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-black" style="cursor:pointer;" onClick=";">
                            <h4 class="rooms-text-h4-2">뉴스레터</h4>
                            <p class="rooms-text-p-left-100">메일링 서비스를 통해 조선해양기자재 소식과 다양한 이야기를 만나보세요</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="100ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-3.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-black" style=" cursor: pointer;" onClick=";">
                            <h4 class="rooms-text-h4-2">간행물</h4>
                            <p class="rooms-text-p-left-100">
                            	한국조선해양기자재 공업협동조합의
								정기간행물 등의 최신발간물 정보를 알려드립니다
							</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="200ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img"></div>

                        <!-- Rooms Text -->
                        <div class="rooms-text">
                            <h4 class="rooms-text-h4-2">A/S관리시스템</h4>
                            <p class="rooms-text-p-left-100">
									<a href="about.html">기자재정보</a>
							</p>
							<p class="rooms-text-p-left-100">
									<a href="about.html">제품정보</a>
							</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-6 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="300ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-4.jpg);"></div>

                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-green" style=" cursor: pointer;" onClick="location.href='about.html';">
                            <h4 class="rooms-text-h4-1">KOMEC</h4>
                            <p class="rooms-text-p-left">눈부신 기회의 바다
The Ocean Of Opportunity
글로벌 해양 비즈니스 시대가 열립니다.</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="100ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img"></div>

                        <!-- Rooms Text -->
                        <div class="rooms-text">
                            <h4 class="rooms-text-h4-2">해외규격인증정보</h4>
                            <p class="rooms-text-p-left-100">
									<a href="about.html">국가별 주요인증 정보소개</a>
							</p>
							<p class="rooms-text-p-left-100">
									<a href="about.html">해외인증 획득지원</a>
							</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="200ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-5.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-pink" style=" cursor: pointer;" onClick="location.href='about.html';">
                            <h4 class="rooms-text-h4-2">전시포털 </h4>
                            <p class="rooms-text-p-left-100">글로벌한 조선해양 기자재 전시포털사이트로
맞춤형 전시 상담을 해드립니다</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="300ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-6.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-purple" style=" cursor: pointer;" onClick="location.href='about.html';">
                            <h4 class="rooms-text-h4-2">홍보센터</h4>
                            <p class="rooms-text-p-left-100">최신 보도 자료를 전해드립니다</p>
                        </div>
                    </div>
                </div>

                <!-- Single Rooms Area -->
                <div class="col-12 col-md-6 col-lg-3 lpadding">
                    <div class="single-rooms-area wow fadeInUp" data-wow-delay="400ms">
                        <!-- Thumbnail -->
                        <div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-7.jpg);"></div>
                        <!-- Rooms Text -->
                        <div class="rooms-text rooms-text-bg-black">
                            <h4 class="rooms-text-h4-2">자료실</h4>
                            <p class="rooms-text-p-left-100">통계자료</p>
							<p class="rooms-text-p-left-100">전시회자료</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Grids Area End ##### -->

    <!-- ##### Milestones Area Start ##### -->
    <section class="our-milestones section-padding-100-100 bg-img">
        <div class="container">
            <div class="row">
				<div class="nav">
						<button class="btn-scrolling-left" onClick="moveType=0;"></button>
						<button class="btn-scrolling-stop" onClick="movePause=true;"></button>
						<button class="btn-scrolling-play" onClick="goMove();"></button>
						<button class="btn-scrolling-right"onClick="moveType=1;"></button>
				</div>
				<div class="RollDiv">
					<div>
						<a href=""><img src="img/rolling-img/bnnr1.gif"></a>
						<a href=""><img src="img/rolling-img/bnnr2.gif" /></a>
						<a href=""><img src="img/rolling-img/bnnr3.gif" /></a>
						<a href=""><img src="img/rolling-img/bnnr4.gif" /></a>
						<a href=""><img src="img/rolling-img/bnnr5.gif" /></a>
						<a href=""><img src="img/rolling-img/bnnr1.gif"></a>
						<a href=""><img src="img/rolling-img/bnnr2.gif" /></a>
						<a href=""><img src="img/rolling-img/bnnr3.gif" /></a>
					</div>
				</div>
            </div>

        </div>
    </section>
    <!-- ##### Milestones Area End ##### -->

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>