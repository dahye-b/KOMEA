<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>한국조선해양기자재공업협동조합</title>

    <!-- Favicon -->
    <link rel="icon" href="/img/core-img/favicon.ico">

	<!-- jquery { -->
	<script src="/js/jquery/jquery-2.2.4.min.js"></script>
	<script src="/js/jquery/common.js"></script>
	<!-- } jquery -->

	<!-- bootstrap { -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- } bootstrap -->

	<!-- font awesome v5.5.0 { -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<!-- } font awesome -->

	<link rel="stylesheet" href="/css/style.css">

	<!-- datetime picker  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <!-- Preloader -->
    <!-- div class="preloader d-flex align-items-center justify-content-center" -->
    <div class="preloader d-none align-items-center justify-content-center">    
        <div class="cssload-container">
            <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
	<header class="header-area">
		
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-6">
						<div class="header-top-left">
							<c:choose>
								<c:when test="${authYn == 'Y'}">
									<i class="fas fa-user"></i> ${loginInfo.id}님 환영합니다!
								</c:when>
								<c:otherwise>
									<span class="dsp-sm" >한국조선해양기자재공업협동조합(글로벌지원센터)에 오신걸 환영합니다!</span>
									<span class="dsp-xs" >KOMEA에 오신걸 환영합니다!</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="col-lg-6 col-sm-6 col-6 header-top-right">
						<ul>
							<c:choose>
								<c:when test="${authYn == 'Y'}">
									<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
									<li><a href="<c:url value='/show/InfoManage.do'/>">기본정보관리</a></li>
									<c:if test="${loginInfo.compLevel eq 'A'}">
										<li><a href="<c:url value='/admin/mberList.do'/>">관리자</a></li>
									</c:if>
								</c:when>
								<c:otherwise>
									<li><a href="<c:url value='/komea/login.do'/>">로그인</a></li>
									<li><a href="<c:url value='/komea/JoinInit.do'/>">회원가입</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="#" class="btn-comm-modal" data-url="/common/sitemap.html" data-title="사이트맵"  >사이트맵</a></li>
						</ul>
						<!--
						<ul class="ul-lang">
							<li><button type="button" class="btn btn-primary btn-rounded btn-lang">KOR</button></li>
							<li><button type="button" class="btn btn-primary btn-rounded btn-lang">ENG</button></li>
						</ul>
						-->
					</div>
				</div>
			</div>
		</div>

        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            
            <div class="classy-nav-container breakpoint-off">
            	<div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="/" class="nav-brand"><img src="/img/core-img/logo.gif" alt="한국조선해양기자재공업협동조합"></a>

                        <!-- Menu Start -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li class="active" ><a href="<c:url value='/komea/mn0101.do'/>" >KOMEA<small>(KOMEC)</small></a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/mn0101.do'/>">비전</a></li>
											<li><a href="<c:url value='/komea/mn0102.do'/>">인사말</a></li>
											<li><a href="<c:url value='/komea/mn0103.do'/>">연혁</a></li>
											<li><a href="<c:url value='/komea/mn0104.do'/>">조직도</a></li>
											<li><a href="<c:url value='/komea/mn0105.do'/>">오시는길</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/komea/mn0201.do'/>">조합원사</a>
                     					<ul class="dropdown">
											<li><a href="<c:url value='/komea/mn0201.do'/>">가입안내</a></li>
											<li><a href="<c:url value='/komea/mn0202.do'/>">회원사</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/komea/mn0301.do'/>">사업소개</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/mn0301.do'/>">권익도모</a></li>
											<li><a href="<c:url value='/komea/mn0302.do'/>">정보공유</a></li>
											<li><a href="<c:url value='/komea/mn0303.do'/>">코마린 전시회</a></li>
											<!-- li><a href="<c:url value='/komea/mn0304.do'/>">공제사업</a></li -->
											<!-- li><a href="<c:url value='/komea/mn0305.do'/>">공동구매</a></li -->
											<li><a href="<c:url value='/komea/mn0306.do'/>">조선기자재 수출 및 AS 거점기지 구축 및 운영</a></li>
											<li><a href="<c:url value='/komea/mn0307.do'/>">해양플랜트 기자재수출 기반구축</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/show/ShowList.do'/>">전시상담포털</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/show/ShowList.do'/>">마린엑스포</a></li>
											<li><a href="<c:url value='/show/DisplayList.do'/>">전시행사</a></li>
											<li><a href="<c:url value='/show/ConsultList.do'/>">상담행사</a></li>
											<!-- 
											<li><a href="<c:url value='/show/InfoCenter/List.do'/>">정보센터</a></li>
											 -->
											<c:choose>
												<c:when test="${loginInfo.ssbyp eq '2'}"><!-- 기업회원 -->
													<li><a href="<c:url value='/show/ReqBizList.do'/>">My Desk</a></li>									
												</c:when>
												<c:when test="${loginInfo.ssbyp eq '3'}"><!-- 기타회원 -->
													<li><a href="<c:url value='/show/ReqBiddingList.do'/>">My Desk</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="<c:url value='/show/SuppBizManage.do'/>">My Desk</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</li>
									<li><a href="http://komea.webidas.co.kr" target="_blank" >기자재 수요예측 시스템</a></li>

									<!-- kbh0007, 2019-11-29 오전 11:02:48 :Start -->
									<li><a href="http://shipsol.honorgy.co.kr" target="_blank" >수출지원 시스템</a>
										<ul class="dropdown">
											<li><a href="http://komec.devsys.co.kr:8080" target="_blank" >수출및a/s 시스템</a></li>
											<li><a href="http://kosmedia.net" target="_blank" >Kosmedia</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/komea/mn0701.do'/>">글로벌인증</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/mn0701.do'/>">글로벌인증정보</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B015'/>">글로벌인증NEWS</a></li>
										</ul>
									</li>
									<!-- kbh0007, 2019-11-29 오전 11:02:48 :End -->

									<li><a href="<c:url value='/komea/mn0801.do'/>">자료실</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/mn0801.do'/>">통계자료</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B002'/>">간행물</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B007'/>">국문뉴스레터</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B008'/>">영문뉴스레터</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B009'/>">보도자료</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B013'/>">해외 거점 기지 정보</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/komea/bbs/List.do?bCode=B001'/>">게시판</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B001'/>">공지시항</a></li>
											<li><a href="<c:url value='/komea/bbs/List.do?bCode=B010'/>">사업공고</a></li>
											<li><a href="<c:url value='/komea/bbs/QnaList.do'/>">열린제안</a></li>
											<li><a href="<c:url value='/show/InfoCenter/List.do?bbsTy=2'/>">입찰공고</a></li>
										</ul>
									</li>
								</ul>
                            </div>
                            <!-- Nav End -->
                        </div><!-- End Menu -->

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>
                        
                    </nav>
				
				</div>
            </div>

			<div class="allmegamenu">
				<div class="container" >
					<ul class="menu-mega float-left" >
						<li class="menu-mega-menuname">KOMEA<small>(KOMEC)</small></li>
						<li><a href="<c:url value='/komea/mn0101.do'/>">비전</a></li>
						<li><a href="<c:url value='/komea/mn0102.do'/>">인사말</a></li>
						<li><a href="<c:url value='/komea/mn0103.do'/>">연혁</a></li>
						<li><a href="<c:url value='/komea/mn0104.do'/>">조직도</a></li>
						<li><a href="<c:url value='/komea/mn0105.do'/>">오시는길</a></li>
					</ul>
					<ul class="menu-mega float-left">
						<li class="menu-mega-menuname">조합원사</li>
						<li><a href="<c:url value='/komea/mn0201.do'/>">가입안내</a></li>
						<li><a href="<c:url value='/komea/mn0202.do'/>">회원사</a></li>
					</ul>
					<ul class="menu-mega float-left">
						<li class="menu-mega-menuname">사업소개</li>
						<li><a href="<c:url value='/komea/mn0301.do'/>">권익도모</a></li>
						<li><a href="<c:url value='/komea/mn0302.do'/>">정보공유</a></li>
						<li><a href="<c:url value='/komea/mn0303.do'/>">코마린 전시회</a></li>
						<!-- li><a href="<c:url value='/komea/mn0304.do'/>">공제사업</a></li -->
						<!-- li><a href="<c:url value='/komea/mn0305.do'/>">공동구매</a></li -->
						<li><a href="<c:url value='/komea/mn0306.do'/>">조선기자재수출및 AS<br />거점기지 구축 및 운영</a></li>
						<li><a href="<c:url value='/komea/mn0307.do'/>">해양플랜트 기자재수출<br />기반구축</a></li>
					</ul>
					<ul class="menu-mega float-left">
						<li class="menu-mega-menuname">전시상담포털</li>
						<li><a href="<c:url value='/show/ShowList.do'/>">마린엑스포</a></li>
						<li><a href="<c:url value='/show/DisplayList.do'/>">전시행사</a></li>
						<li><a href="<c:url value='/show/ConsultList.do'/>">상담행사</a></li>
						<!-- 
						<li><a href="<c:url value='/show/InfoCenter/List.do'/>">정보센터</a></li>
						 -->
						<c:choose>
							<c:when test="${loginInfo.ssbyp eq '2'}"><!-- 기업회원 -->
								<li><a href="<c:url value='/show/ReqBizList.do'/>">My Desk</a></li>
							</c:when>
							<c:when test="${loginInfo.ssbyp eq '3'}"><!-- 기타회원 -->
								<li><a href="<c:url value='/show/ReqBiddingList.do'/>">My Desk</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="<c:url value='/show/SuppBizManage.do'/>">My Desk</a></li>
							</c:otherwise>
						</c:choose>						
					</ul>
					<ul class="menu-mega float-left">
						<li class="menu-mega-menuname">자료실</li>
						<li><a href="<c:url value='/komea/mn0801.do'/>">통계자료</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B002'/>">간행물</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B007'/>">국문뉴스레터</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B008'/>">영문뉴스레터</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B009'/>">보도자료</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B013'/>">해외 거점 기지 정보</a></li>
					</ul>
					<ul class="menu-mega float-left">
						<li class="menu-mega-menuname">게시판</li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B001'/>">공지시항</a></li>
						<li><a href="<c:url value='/komea/bbs/List.do?bCode=B010'/>">사업공고</a></li>
						<li><a href="<c:url value='/komea/bbs/QnaList.do'/>">열린제안</a></li>
						<li><a href="<c:url value='/show/InfoCenter/List.do?bbsTy=2'/>">입찰공고</a></li>
					</ul>
				</div>
			</div>

        </div><!-- div class="palatin-main-menu" -->
        	
    </header>
    <!-- ##### Header Area End ##### -->

<%@ include file="/WEB-INF/include/include-top-menu.jsp" %>