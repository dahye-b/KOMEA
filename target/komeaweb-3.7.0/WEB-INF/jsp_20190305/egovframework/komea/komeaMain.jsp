<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">

$(document).ready(function(){
	//팝업창
	$.ajax({
		url : "/koema/SelectPopupList.do",
		type : "POST",
		data : "",
		success : function(data) {
			var resultData = data.data;
			$.each(resultData, function(index, value){
				window.open("/koema/MainPopup.do?popupNo="+value.popupNo, "popup"+value.popupNo, "width="+value.width+", height="+value.height+", toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			});
		}
	});
});

function detail(obj1, obj2, obj3, obj4, obj5){
	document.Form.bCode.value = obj1;
	document.Form.idx.value = obj2;
	document.Form.block.value = obj3;
	document.Form.rlevel.value = obj4;
	document.Form.boss.value = obj5;
	document.Form.action = "<c:url value='/komea/bbs/View.do'/>";
	document.Form.submit();
}
function detailExbi(obj1){
	document.Form.code.value = obj1;
	document.Form.action = "<c:url value='/show/DisplayView.do'/>";
	document.Form.submit();
}
</script>

<form name="Form" method="post">
	<input type="hidden" name="bCode" id="bCode" value=""/>
	<input type="hidden" name="idx" id="idx" value=""/>
	<input type="hidden" name="block" id="block" value=""/>
	<input type="hidden" name="rlevel" id="rlevel" value=""/>
	<input type="hidden" name="boss" id="boss" value=""/>
	<input type="hidden" name="code" id="code" value=""/>

		<!-- ##### Hero Area Start ##### -->
		<section class="hero-area">
				<div class="hero-slides owl-carousel">

						<!-- Single Hero Slide -->
						<!-- div class="single-hero-slide d-flex align-items-center justify-content-center" -->
						<div class="single-hero-slide align-items-center justify-content-center">
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
						<div class="single-hero-slide align-items-center justify-content-center">
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
						<div class="single-hero-slide align-items-center justify-content-center">
								<!-- Slide Img -->
								<div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-4.jpg);"></div>
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


		<!-- ##### News Area Start ##### -->
		<section class="rooms-area section-padding-50">
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
						<li class="nav-item col-3 col-md-3 col-lg-3 ">
								<a class="nav-link active" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">공지사항</a>
						</li>
						<li class="nav-item col-3 col-md-3 col-lg-3 ">
								<a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">전시행사</a>
						</li>
						<li class="nav-item col-3 col-md-3 col-lg-3 ">
								<a class="nav-link" id="tab--3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">보도자료</a>
						</li>
						<li class="nav-item col-3 col-md-3 col-lg-3 ">
								<a class="nav-link" id="tab--4" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false">사업공고</a>
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
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:when>
											<c:otherwise>
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:otherwise>
											</c:choose>
												<div class="single-blog-post mb-50" >
													<div class="post-content">
															<a href="javascript:detail('B001',${B001List.idx},${B001List.block},${B001List.rlevel},${B001List.boss});" class="post-title">
																<h5><c:out value="${B001List.title}" /></h5>
															</a>
															<p class="post-excerpt"><c:out value="${B001List.contents}"/></p>
															<div class="post-meta text-center">
																<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i><c:out value="${B001List.indate}" /></a>
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
								<!-- 반복 -->
								<c:choose>
									<c:when test="${fn:length(B002List) > 0}">
										<c:forEach var="B002List" items="${B002List}" varStatus="status">
											<c:choose>
											<c:when test="${B002List.rnum eq 1}">
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:when>
											<c:otherwise>
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:otherwise>
											</c:choose>
												<div class="single-blog-post mb-50" >
													<div class="post-content">
														<a href="javascript:detailExbi('${B002List.exbiCd}');" class="post-title">
															<h5><c:out value="${B002List.exbiNm}" /></h5>
														</a>
														<p class="post-excerpt">
															<span class="text-dark">주 최 :</span> <c:out value="${B002List.insttNm}" /><br />
															<span class="text-dark">기 간 :</span> <c:out value="${B002List.opmtBeginDe}" /> ~ <c:out value="${B002List.opmtClosDe}" /><br />
															<span class="text-dark">장 소 :</span> <c:out value="${B002List.opmtPlace}" /><br />
														</p>
														<div class="post-meta text-center">
															<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
															<a href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
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
									<div class="load-more-btn text-center fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
										<a href="#" class="btn mre-btn"></a>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
							<div class="row no-margin">
								<!-- Single Blog Post Area -->
								<!-- 반복 -->
								<c:choose>
									<c:when test="${fn:length(B003List) > 0}">
										<c:forEach var="B003List" items="${B003List}" varStatus="status">
											<c:choose>
											<c:when test="${B003List.rnum eq 1}">
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:when>
											<c:otherwise>
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:otherwise>
											</c:choose>
												<div class="single-blog-post mb-50" >
													<div class="post-content">
														<a href="javascript:detail('B009',${B003List.idx},${B003List.block},${B003List.rlevel},${B003List.boss});" class="post-title">
															<h5><c:out value="${B003List.title}" /></h5>
														</a>
														<p class="post-excerpt"><c:out value="${B003List.contents}"/></p><!--B001List.contents-->
														<div class="post-meta text-center">
															<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i><c:out value="${B003List.indate}" /></a>
															<a href="#"><i class="fa fa-user" aria-hidden="true"></i><c:out value="${B003List.uName}" /></a>
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
									<div class="load-more-btn text-center fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
										<a href="#" class="btn mre-btn"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="tab--4">
							<div class="row no-margin justify-content-center">
								<!-- Single Blog Post Area -->
								<!-- 반복 -->
								<c:choose>
									<c:when test="${fn:length(B004List) > 0}">
										<c:forEach var="B004List" items="${B004List}" varStatus="status">
											<c:choose>
											<c:when test="${B004List.rnum eq 1}">
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:when>
											<c:otherwise>
												<div class="tab-panes col-12 col-md-6 col-lg-3" >
											</c:otherwise>
											</c:choose>
												<div class="single-blog-post mb-50" >
													<div class="post-content">
														<a href="javascript:detail('B010',${B004List.idx},${B004List.block},${B004List.rlevel},${B004List.boss});" class="post-title">
															<h5><c:out value="${B004List.title}" /></h5>
														</a>
														<p class="post-excerpt"><c:out value="${B004List.contents}"/></p><!--B001List.contents-->
														<div class="post-meta text-center">
															<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i><c:out value="${B004List.indate}" /></a>
															<a href="#"><i class="fa fa-user" aria-hidden="true"></i><c:out value="${B004List.uName}" /></a>
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
		<!-- ##### News Area End ##### -->

		<!-- ##### Grids Area Start ##### -->
		<section class="rooms-area section-padding-100-100 bg-img" style="background-image: url(img/bg-img/bg-3-1.jpg);">
				<div class="container">
						<div class="row">

								<!-- Single Rooms Area -->
								<div class="col-12 col-md-6 col-lg-6">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="100ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-1.jpg);"></div>
												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-blue" style="cursor:pointer;" >
														<h4 class="grid-text-h4-1">KOMEA</h4>
														<p class="grid-text-p-left">
															한국조선해양기자재공업협동조합은 조선산업 발전에 기여하며,
															조선해양기자재산업의 효율적인 사업 환경 조성에 이바지 하고 있습니다.
														</p>
												</div>
										</div>
								</div>

								<!-- Single Rooms Area -->
								<div class="col-12 col-md-6 col-lg-3 lpadding">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="200ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-9.jpg);"></div>
												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-blue" style="cursor:pointer;" >
														<h4 class="grid-text-h4-2">조합소개</h4>
														<p class="grid-text-p-left-100"><a href="/komea/mn0101.do">한국조선해양기자재공업<br>협동조합의 비전, 연혁, <br>조직도 및 오시는길을 <br>안내해드립니다.</a></p>
												</div>
										</div>
								</div>

								<!-- Single Rooms Area -->
								<div class="col-12 col-md-6 col-lg-3 lpadding">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="300ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-2.jpg);"></div>
												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-blue" style="cursor:pointer;" >
														<h4 class="grid-text-h4-2">조합원사</h4>
														<p class="grid-text-p-left-100"><a href="/komea/mn0201.do">조합원 가입절차안내 및 현재 가입된 회원사를 소개해 드립니다.</a></p>
												</div>
										</div>
								</div>

								<!-- Single Rooms Area -->
								<div class="tab-panes col-12 col-md-6 col-lg-3">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="100ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-8.jpg);"></div>
												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-blue" style=" cursor: pointer;" >
														<h4 class="grid-text-h4-2">사업소개</h4>
														<p class="grid-text-p-left-100">
															Global Ocean Business를 앞장서는 한국조선해양 기자재공업협동조합에서 진행하는 사업을 안내합니다..</p>
												</div>
										</div>
								</div>

								<!-- Single Rooms Area -->
								<div class="col-12 col-md-6 col-lg-3 lpadding">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="200ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-10.jpg);"></div>

												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-blue" style=" cursor: pointer;" >
														<p class="grid-text-p-left-100">
									<a href="/komea/mn0301.do">권익도모, 정보공유<br>코마린전시회<br>조선기자재 수출 및<br>A/S거점기지 구축 및 운영<br>해양플랜트 기자재수출<br>기반구축</a>
							</p>
												</div>
										</div>
								</div>

								<!-- Single Rooms Area -->
								<div class="col-12 col-md-6 col-lg-6 lpadding">
										<div class="grid-rooms-area wow fadeInUp" data-wow-delay="300ms">
												<!-- Thumbnail -->
												<div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-4.jpg);"></div>

												<!-- Rooms Text -->
												<div class="grid-text grid-text-bg-green" style=" cursor: pointer;" onClick="location.href='about.html';">
														<h4 class="grid-text-h4-1">KOMEC</h4>
														<p class="grid-text-p-left">눈부신 기회의 바다<br>
The Ocean Of Opportunity<br>
글로벌 해양 비즈니스 시대가 열립니다.</p>
												</div>
										</div>
								</div>


						</div>
				</div>
		</section>
		<!-- ##### Grids Area End ##### -->

		<!-- ##### quick Area Start ##### -->
		<section class="quick-area">
			<div class="quicks section-heading text-center">
				<h2>QUICK SERVICE</h2>
		 		<p>주요컨텐츠를 빠르게 이용하실 수 있도록 소개해 드립니다.</p>
				<!-- ##### quick serviec 1 ##### --->
				<div class="container">
					<div class="row">
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/show/InfoManage.do">
						 				 <img src="/img/core-img/quick1.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick1-ov.png'" OnMouseOut="this.src='/img/core-img/quick1.png'">
						 				 <p><strong>MyDesk</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/show/BuyerList.do">
						 				 <img src="/img/core-img/quick2.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick2-ov.png'" OnMouseOut="this.src='/img/core-img/quick2.png'">
						 				 <p><strong>해외바이어</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/show/InfoCenter/List.do?bbsTy=2">
						 				 <img src="/img/core-img/quick3.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick3-ov.png'" OnMouseOut="this.src='/img/core-img/quick3.png'">
						 				 <p><strong>입찰공고</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/show/InfoCenter/List.do?bbsTy=5">
						 				 <img src="/img/core-img/quick4.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick4-ov.png'" OnMouseOut="this.src='/img/core-img/quick4.png'">
						 				 <p><strong>상담문의</strong></p>
						 			 </a>
								</div>
								<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/komea/mn0801.do">
						 				 <img src="/img/core-img/quick5.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick5-ov.png'" OnMouseOut="this.src='/img/core-img/quick5.png'">
						 				 <p><strong>통계자료</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/komea/bbs/List.do?bCode=B002">
						 				 <img src="/img/core-img/quick6.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick6-ov.png'" OnMouseOut="this.src='/img/core-img/quick6.png'">
						 				 <p><strong>간행물</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/komea/bbs/List.do?bCode=B007">
						 				 <img src="/img/core-img/quick7.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick7-ov.png'" OnMouseOut="this.src='/img/core-img/quick7.png'">
						 				 <p><strong>뉴스레터</strong></p>
						 			 </a>
								</div>
					 			<div class="col-lg col-md-3 col-sm-3 col-6 mt-20">
						 			 <a href="/show/InfoCenter/List.do?bbsTy=1">
						 				 <img src="/img/core-img/quick8.png" width="120" height="120" border="0" OnMouseOver="this.src='/img/core-img/quick8-ov.png'" OnMouseOut="this.src='/img/core-img/quick8.png'">
						 				 <p><strong>성공사례</strong></p>
						 			 </a>
								</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ##### quick Area End ##### -->

		<!-- ##### event Area Start ##### -->
		<section class="event-area bg-img" style="background-image: url(img/bg-img/bg-12-1.jpg);">
					<div class="event section-heading">
				 		<div class="container" >
							<div class="row">

								<div class="col-lg-10">
									<div class="mb-30 text-center">
										<h2 class="text-white">전시행사</h2>
										<p><span class="text-white text-center">KOMEA에서 진행되는 전시 및 상담 행사를 안내해 드립니다.</span></p>
									</div>
									<div class="container" >
										<div class="row" >
											<div class="event-banner col-md-4 col-lg-4">
													<!-- div class="grid-event-area wow fadeInUp" data-wow-delay="100ms"> 애니메이션 샘프 -->
													<div class="grid-event-area">
															<!-- div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-11.jpg);"></div -->
															<div class="bg-thumbnail" >
																<img src="/img/bg-img/m-img-icon-11.jpg" border="0" />
															</div>
															<div class="grid-text ">
																	<a href="/show/DisplayList.do"><h5>전시행사</h5></a>
																	<div class="event-info text-left"><h6 class="text-danger text-center">Korea Ocean Expo<br> 2018(국제해양안전대전)</h6>주최: 조합기관<br>기간:  20180620 ~ 20180622<br>
																	장소: 인천 송도컨벤시아</div>
															</div>

													</div>
											</div>
											<div class="event-banner col-md-4 col-lg-4">
													<div class="grid-event-area">
															<!-- div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-5.jpg);"></div -->
															<div class="bg-thumbnail" >
																<img src="/img/bg-img/m-img-icon-5.jpg" border="0" />
															</div>
															<div class="grid-text-1">
																	<a href="/show/WorkList.do"><h5>마린엑스포</h5></a>
																	<div class="event-info-1 text-left">마린엑스포에서는 한국조선해양기자재공업협동조합의 지난행사보기, 해외바이어리스트와 회원사목록을 확인하실 수 있습니다.<br><br></div>
															</div>
													</div>
											</div>
											<div class="event-banner col-md-4 col-lg-4">
													<div class="grid-event-area">
															<!-- Thumbnail -->
															<!-- div class="bg-thumbnail bg-img" style="background-image: url(img/bg-img/m-img-icon-12.jpg);"></div -->
															<div class="bg-thumbnail" >
																<img src="/img/bg-img/m-img-icon-12.jpg" border="0" />
															</div>
															<div class="grid-text">
																	<a href="/show/ConsultList.do"><h5>상담행사</h5></a>
																	<div class="event-info text-left"><h6 class="text-danger text-center">
2018 중국 광저우 <br>조선해양기자재 수출 상담회</h6>주최: 조합기관<br>기간: 20181211 ~ 20181211<br>
																	장소: 중국 광저우지역 조선소</div>

															</div>
													</div>
											</div>
										</div>
									</div><!-- div class="event-banner container" -->
								</div>

								<div class="col-lg-2 text-right">
									<div class="apply_t">
										<a href="/show/InfoCenter/List.do?bbsTy=2" ><img src="/img/core-img/btn1.png"></a>
									</div>
									<div class="apply_b">
										<a href="/komea/bbs/QnaWrite.do" ><img src="/img/core-img/btn2.png"></a>
									</div>
								</div>

							</div>
						</div>
					</div>
		</section>
		<!-- ##### event Area End ##### -->

		<!-- ##### Banner Area Start ##### -->
		<section class="banners-area">
				<div class="container">
					<div class="row">
						<div class="banners">
							<div class="banner-slides owl-carousel" >
							<c:choose>
								<c:when test="${fn:length(BannerList) > 0}">
									<c:forEach var="BannerList" items="${BannerList}" varStatus="status">
										<div class="item"><a href="${BannerList.bannerLink}" target="_blank"><img src="${BannerList.bannerFilePath}" /></a></div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- 배너없음 -->
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
				</div>
		</section>
		<!-- ##### Banner Area End ##### -->


</form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
