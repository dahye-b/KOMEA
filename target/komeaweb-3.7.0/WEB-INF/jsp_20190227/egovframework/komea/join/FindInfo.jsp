<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>

    <!-- ##### sub-title Area Start ##### -->
    <section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center">
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section>
    <!-- ##### sub-title Area End ##### -->

		<!-- ##### Section-nav Area Start ##### -->
		<div class="section-nav sub-nav-line">
        <div class="container">
            <div class="row">
                <div class="col-12">
										<ul class="dropdown-line">
											<li class="dropdown-home">
												<button type="button" href="#" class="btn btn-home" ></button>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">KOMEA<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0101.do">KOMEA<small>(KOMEC)</small></a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0201.do">조합원사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.3.1.jsp">사업소개</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/show/WorkList.do">전시행사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >수출 및 A/S시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.7.1.jsp">자료실</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bbsTy=0">게시판</a></li>
												</ul>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">아이디/비밀번호찾기<span class="caret"><i class="fas fa-caret-down"></i></span></button>
                        <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
												</ul>
											</li>
										</ul>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Section-nav Area End ##### -->

    <!-- ##### Section Area Start ##### -->
    <section class="section-area findlogin">
        <div class="container">
            <div class="row">
							<div class="section-heading mb-5 col-12">
						<h2>아이디/비밀번호찾기</h2>
						<div class="dropdown-line-subtitle"></div>
            		</div>
            		<div class="section-text col-12 mb-100">
            				<div class="card bg-light" >
            						<div class="card-body findlogin-box">
														<div class="findlogin-box-Large">
																<div class="col-sm-12 col-md-6 col-lg-6 findlogin-box-middle">
																		<div class="findlogin-box-right-line">
																				<p>
																						<img src="/img/core-img/find-id.png" alt="아이디찾기">
																				</p>
																				<h4>아이디찾기</h4>
																				<p>
																						기업의 아이디는 <span class="font_blue">사업자 등록번호</span>를 사용합니다.<br>
		기관은 관리자에게 문의하시기 바랍니다.
																				</p>
																		</div>

																</div>
																<div class="col-sm-12 col-md-6 col-lg-6 findlogin-box-middle">
																		<div>
																				<p>
																						<img src="/img/core-img/find-pw.png" alt="비밀번호찾기">
																				</p>
																				<h4>비밀번호찾기</h4>
																				<p>
																						비밀번호를 잃어버리셨다면 <span class="font_gree">관리자에게 문의</span>하시기 바랍니다.<br>
		비밀번호를 최초 입력하시 이메일로 리셋 해드립니다
																				</p>
																		</div>

																</div>

														</div>

            						</div>
            				</div>
								</div><!--끝 "section-text col-12"-->

						</div><!--끝 "row"-->
				</div><!--끝 "container"-->



    </section>
    <!-- ##### Section Area End ##### -->


<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
