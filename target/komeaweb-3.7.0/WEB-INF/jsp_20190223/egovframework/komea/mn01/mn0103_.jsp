<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>

    <!-- ##### SUB-TITLE Area Start ##### -->
    <section class="sub-title-area bg-img bg-img1 d-flex align-items-center justify-content-center">
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

		<!-- ##### Section-nav Area Start #####-->
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
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">연혁<span class="caret"><i class="fas fa-caret-down"></i></span></button>
                        						<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0101.do">비전</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0102.do">인사말</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0103.do">연혁</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0104.do">조직도</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0105.do">오시는길</a></li>
												</ul>
											</li>
										</ul>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Section-nav Area End ##### -->
	<style>
	.nav-tabs .history {}
	.nav-tabs h4 {font-weight:300 !important;}
	.history {}
	.history h3 {border-bottom:1px solid #ccc;padding-bottom:20px;margin-bottom:20px;}
	.history li {margin:0px 0px 15px;}
	.history span {}
	</style>
    <!-- ##### Ssection Area Start ##### -->
    <section class="section-area history">
        <div class="container">
            <div class="row align-items-center">
            		<div class="section-heading mb-5 col-12">
										<h2>
												연혁
										</h2>
										<div class="dropdown-line-subtitle"></div>
								</div>
                <div class="col-12 mb-100">
										<ul class="nav nav-tabs nav-tabs-line history">
												<li class="nav-item history-nave-item"><a class="nav-link active" data-toggle="tab" href="#tab01"><h4>2013 ~ 2010</h4></a></li>
												<li class="nav-item history-nave-item"><a class="nav-link" data-toggle="tab" href="#tab02"><h4>2009 ~ 2001</h4></a></li>
												<li class="nav-item history-nave-item"><a class="nav-link" data-toggle="tab" href="#tab03"><h4>1999 ~ 1990</h4></a></li>
												<li class="nav-item history-nave-item"><a class="nav-link" data-toggle="tab" href="#tab04"><h4>1989 ~ 1980</h4></a></li>
												<li class="nav-item history-nave-item"><a class="nav-link" data-toggle="tab" href="#tab05"><h4>1979</h4></a></li>
										</ul>
										<div class="tab-content">
												<div id="tab01"role="tabpanel" class="tab-pane active" >
														<div class="card no-border" >
																<div class="card-body history">
																		<ul>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2013</span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">조선해양인 신년인사회 공동 주최 (한국조선협회 등 8개 기?)</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2012</span><span class="col-lg-1 col-sm-2 history-momth">12월</span><span class="col-lg-9 col-sm-7 history-contents">지식경제부 주력산업정책관 주재 조선해양기자재 CEO간담회 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">제6회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">해양 조선산업 발전을 위한 상생협력지원 MOU 체결 (경상남도 등 10개 단체 공동체결)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">9월</span><span class="col-lg-9 col-sm-7 history-contents">조선해양기자재 e뉴스레터 창간</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">6월</span><span class="col-lg-9 col-sm-7 history-contents">그린쉽 산업 기술협력 촉진 및 투자활성화를 위한</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">산학관 상생협력 지원 협약 체결 (전라북도 등 14개 단체 공동체결)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">4월</span><span class="col-lg-9 col-sm-7 history-contents">제 7회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">2월</span><span class="col-lg-9 col-sm-7 history-contents">제 6대 강재종 전무이사 선임 제 11대 박윤소 이사장 연임</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">조선해양인 신년하례회 공동 주최 (한국조선협회 등 8개 기관)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2011</span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">제5회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">6월</span><span class="col-lg-9 col-sm-7 history-contents">한 브라질 조선해양산업 비즈니스 네트워킹 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">브라질 주정부 FERGS와 MOU체결 </span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">조선해양인 신년하례회 공동 주최 (한국조선협회 등 8개 기관)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2010</span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">한국조선해양기자재 글로벌지원센터 개소식 (조선기자재 경쟁력 강화사업)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">중국 장수 조선협회와 MOU 체결</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">"한국조선해양기자재산업 발전사 및 조합 30년사" 출간</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">미국 휴스턴 해양박람회(OTC Offshore Techmology Conference) 한국관 구성(최초)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">4월</span><span class="col-lg-9 col-sm-7 history-contents">조합 명칭 변경(한국조선기자재공업협동조합에서 한국조선해양기자재공업협동조합'으로 변경)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 6회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">3월</span><span class="col-lg-9 col-sm-7 history-contents">스페인 조선기자재구매협회와 MOU 체결</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">Offshore Leaders Forum(OLF) 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">조선관련인사 신년인사회 공동 주최(한국조선협회 등 8개 기관)</span></li>
																				<li><hr></li>
																		</ul>
																</div>
														</div>
												</div>

												<div id="tab02"role="tabpanel" class="tab-pane" >
														<div class="card no-border" >
																<div class="card-body history">
																		<ul>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2009</span><span class="col-lg-1 col-sm-2 history-momth">12월</span><span class="col-lg-9 col-sm-7 history-contents">베트남 비나신그룹과 상호협력을 위한 MOU체결</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">제 5회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 4회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">9월</span><span class="col-lg-9 col-sm-7 history-contents">동남광역경제권??도산업 R&D사업 참여</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">- 해양플랜트 글로벌 허브 구축사업</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">7월</span><span class="col-lg-9 col-sm-7 history-contents">지식경제부와 조선기자재 경쟁력 강화사업'에 대한 협약 체결</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">(한국조선해양기자재 글로벌지원센터 설립)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">6월</span><span class="col-lg-9 col-sm-7 history-contents">노르웨이 오슬로 국제선박 전시회(Nor-Shipping) 한국관 구성</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">제 3회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">조선관련인사 신년인사회 공동 주최 (한국조선협회 등 8개 기관)</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2008</span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">제 2회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">터키/인도 조선협회와 상호협력을 위한 MOU체결</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">6월</span><span class="col-lg-9 col-sm-7 history-contents">제 1회 KOMEA FORUM 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">2월</span><span class="col-lg-9 col-sm-7 history-contents">제 10대 박윤소 이사장 취임</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2007</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 4회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2006</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">그리스 아테네 POSIDONIA 전시회 한국관 구성</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">해외 주요 선주사 초청 교류회 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">(이란 NITC사, 이태리 다미코사 회장 등 9개국 14명)</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2005</span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">조선정보 교환체계 구축을 위한 핵심기자재업계 시스템 구축사업 참여</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2004</span><span class="col-lg-1 col-sm-2 history-momth">2월</span><span class="col-lg-9 col-sm-7 history-contents">제 5대 김정호 전무이사 선임</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선기자재분야 기술로드맵 작성</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2003</span><span class="col-lg-1 col-sm-2 history-momth">12월</span><span class="col-lg-9 col-sm-7 history-contents">제 8대 시명선 이사장 취임</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2002</span><span class="col-lg-1 col-sm-2 history-momth">2월</span><span class="col-lg-9 col-sm-7 history-contents">한국조선기자재연구원 설립</span></li>
																				<li><hr></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">2001</span><span class="col-lg-1 col-sm-2 history-momth">12월</span><span class="col-lg-9 col-sm-7 history-contents">세계일류상품화 지정사업 수행(산업자원부 위임)</span></li>
																				<li><hr></li>
																		</ul>
																</div>
														</div>
												</div>


												<div id="tab03"role="tabpanel" class="tab-pane" >
														<div class="card no-border" >
																<div class="card-body history">
																		<ul>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1999</span><span class="col-lg-1 col-sm-2 history-momth">6월</span><span class="col-lg-9 col-sm-7 history-contents">제4대 황긍호 전무이사 선임</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1997</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">중국 상해 Marinter China 한국관 구성(최초)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1996</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">국제내연기관협의회(CIMAG회원 가입</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">(한국내연기관협의회 (KOMA) 개설)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1995</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">국제 조선해양 산업전시회 (KOMARINE) 주관</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제8회 조선기자재 국산화 촉진 세미나 개최 </span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1994</span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">제 5차 조선 및 기자재업계 합동회의 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제7회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1993</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제6회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1992</span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">제4차 조선 및 기자재업계 합동회의 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">2월</span></span><span class="col-lg-9 col-sm-7 history-contents">부산조선기자재사업조합 설립</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제5회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선기자재 국산화 심의회 운영</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1991</span><span class="col-lg-1 col-sm-2 history-momth">10월</span><span class="col-lg-9 col-sm-7 history-contents">제3차 조선 및 기자재업계 합동회의 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제4회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선기자재공업과 부산지역 산업발전 방향에 관한 세미나 개최</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1990</span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">제 2차 조선 및 기자재업계 합동회의 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 3회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">제 1차 조선 및 기자재업계 합동회의 개최</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제3회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li><hr></li>
																		</ul>
																</div>
														</div>
												</div>

												<div id="tab04"role="tabpanel" class="tab-pane" >
														<div class="card no-border" >
																<div class="card-body history">
																		<ul>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1989</span><span class="col-lg-1 col-sm-2 history-momth">9월</span><span class="col-lg-9 col-sm-7 history-contents"> 제 2회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제2회 조선기자재 국산화 촉진 세미나 개최</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1988</span><span class="col-lg-1 col-sm-2 history-momth">11월</span><span class="col-lg-9 col-sm-7 history-contents">제 1회 한-일 조선기자재 업계 교류 추진</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">2000년대 조선공업을 위한 종합토론회</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">(조선기자재 국산화 촉진 세미나' 개최(최초)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1987</span><span class="col-lg-1 col-sm-2 history-momth">7월</span><span class="col-lg-9 col-sm-7 history-contents">'조선기자재 조합보 창간</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1986</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제3대 윤재열 전무이사 선임</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents" style="height:auto;">조합 영문명 Korean Association of Ship's Machinery andEquipment Manufacturers (약칭 KASMEM)에서 현재의 Korea Marine Equipment Association(약칭 KOMEA)로 변경</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1985</span><span class="col-lg-1 col-sm-2 history-momth">12월</span><span class="col-lg-9 col-sm-7 history-contents">선박용 엔진부품,선박 건조수리용 기자재 수입추천업무기관 선정(상공부고시)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">제 2대 한인수 전무이사 선임</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1984</span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">중소기업 고유업종 지정 추천기관 선정</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">2월</span><span class="col-lg-9 col-sm-7 history-contents">제 2대 구자영 이사장 취임</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1983</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">상공부 위임업무수행, 국내외 시장개척 및 홍보 강화 공동구판매 사업확대</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth">7월</span><span class="col-lg-9 col-sm-7 history-contents">박용엔진공업협회와 합병 (현대엔진(주) 가입)</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1982</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선사업등록현황 자료집 발간</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">영문카탈로그 발행(최초)</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선기자재 국산화 추진위원회 설립</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1981</span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">조선용기자재 전문공장 지정업체 기관 선정</span></li>
																				<li><hr></li>

																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1980</span><span class="col-lg-1 col-sm-2 history-momth">5월</span><span class="col-lg-9 col-sm-7 history-contents">한국조선기자재공업협동조합 창립총회</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 1대 윤팔문 이사장 취임</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">제 1대 최충희 전무이사 선임</span></li>
																				<li><hr></li>
																		</ul>

																</div>
														</div>
												</div>

												<div id="tab05"role="tabpanel" class="tab-pane" >
														<div class="card no-border" >
																<div class="card-body">
																		<ul>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year">1979</span><span class="col-lg-1 col-sm-2 history-momth">1월</span><span class="col-lg-9 col-sm-7 history-contents">한국조선관련공업협의회 설립</span></li>
																				<li class="row"><span class="col-lg-2 col-sm-3 history-year"></span><span class="col-lg-1 col-sm-2 history-momth"></span><span class="col-lg-9 col-sm-7 history-contents">(발기인 부산포금공업(주) 김영렬</span></li>
																				<li><hr></li>
																		</ul>

																</div>
														</div>
												</div>
										</div>

                </div>
            </div>
        </div>
    </section>
    <!-- ##### Ssection Area End ##### -->


<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
