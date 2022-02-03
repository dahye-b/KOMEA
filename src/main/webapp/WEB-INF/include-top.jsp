<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>한국조선해양기자재공업협동조합</title>

    <!-- Favicon -->
    <link rel="icon" href="/img/core-img/favicon.ico">

	<!-- jquery { -->
	<script src="/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
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

	<!-- Search Modal Start { -->
	<!-- div class="modal fade" id="SearchModal" tabindex="-1" role="dialog" aria-labelledby="SearchModalLabel" aria-hidden="true" -->
	<div class="modal fade" id="SearchModal" role="dialog" aria-labelledby="SearchModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-index" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title big" id="exampleModalLabel">검색</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<fieldset>
						<!-- Sign In Form -->
						<!-- Text input-->
						<div class="control-group">
								<input type="text" id="searchkey" name="searchkey" class="form-control form-control-md" placeholder="검색어를 입력하세요." required="" />
						</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-sm btn-primary">검색</button>
					<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- } Search Modal End -->

	<!-- Full Menu  Modal Start { -->
	<!-- div class="modal fade" id="MenusModal" tabindex="-1" role="dialog" aria-labelledby="SearchModalLabel" aria-hidden="true" -->
	<div class="modal fade" id="MenusModal" role="dialog" aria-labelledby="MenusModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-index modal-fullsize" role="document">
			<div class="modal-content modal-fullsize">
					<div class=" container">
							<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">
											<span class="all-meun-logo-span" style=""><img src="/img/core-img/logo.gif" alt="한국조선해양기자재공업협동조합"></span>전체메뉴
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
										<div class="mb-100">
												<h6>KOMEA<small>(KOMEC)</small></h6>
												<div class="palatin-buttons-area">
														<a href="<c:url value='/komea/mn0101.do'/>" class="btn palatin-btn">비전</a>
														<a href="<c:url value='/komea/mn0102.do'/>" class="btn palatin-btn">인사말</a>
														<a href="<c:url value='/komea/mn0103.do'/>" class="btn palatin-btn">연혁</a>
														<a href="<c:url value='/komea/mn0105.do'/>" class="btn palatin-btn">조직도</a>
														<a href="<c:url value='/komea/mn0106.do'/>" class="btn palatin-btn">오시는길</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>조합원사</h6>
												<div class="palatin-buttons-area">
														<a href="/sub.2.1.jsp" class="btn palatin-btn">가입안내</a>
														<a href="/sub.2.2.jsp" class="btn palatin-btn">회원사</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>사업소개</h6>
												<div class="palatin-buttons-area">
														<a href="/sub.3.1.jsp" class="btn palatin-btn">권익도모</a>
														<a href="/sub.3.2.jsp" class="btn palatin-btn">정보공유</a>
														<a href="/sub.3.3.jsp" class="btn palatin-btn">코마린 전시회</a>
														<a href="/sub.3.4.jsp" class="btn palatin-btn">공제사업</a>
														<a href="/sub.3.5.jsp" class="btn palatin-btn">공동구매</a>
														<a href="/sub.3.6.jsp" class="btn palatin-long-btn palatin-long-btn-mbtxt">조선기자재 수출 및 AS 거점기지 구축 및 운영</a>
														<a href="/sub.3.7.jsp" class="btn palatin-long-btn">해양플랜트 기자재수출 기반구축</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>전시행사</h6>
												<div class="palatin-buttons-area">
														<a href="/show/WorkList.do" class="btn palatin-btn">마린엑스포</a>
														<a href="/show/DisplayList.do" class="btn palatin-btn">전시행사</a>
														<a href="/sub.4.3.jsp" class="btn palatin-btn">상담행사</a>
														<a href="/sub.4.4.1.jsp" class="btn palatin-btn">정보센터</a>
														<a href="/sub.4.5.jsp" class="btn palatin-btn">My Desk</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>기자재 수요예측 시스템</h6>
												<div class="palatin-buttons-area">
														<a href="www.daum.net" target="_blank" class="btn palatin-btn">기자재 수요예측 시스템</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>수출 및 A/S시스템</h6>
												<div class="palatin-buttons-area">
														<a href="www.daum.net" target="_blank" class="btn palatin-btn">수출 및 A/S시스템</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>Kosmedia</h6>
												<div class="palatin-buttons-area">
														<a href="www.daum.net" target="_blank" class="btn palatin-btn">Kosmedia</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>자료실</h6>
												<div class="palatin-buttons-area">
														<a href="/sub.7.1.jsp" class="btn palatin-btn">통계자료</a>
														<a href="/sub.7.2.jsp" class="btn palatin-btn">간행물</a>
														<a href="/sub.7.3.jsp" class="btn palatin-btn">국문뉴스레터</a>
														<a href="/sub.7.4.jsp" class="btn palatin-btn">영문뉴스레터</a>
														<a href="/sub.7.5.jsp" class="btn palatin-btn">보도자료</a>
												</div>
										</div>
										<div class="mb-100">
												<h6>게시판</h6>
												<div class="palatin-buttons-area">
														<a href="/sub.8.1.jsp" class="btn palatin-btn">공지시항</a>
														<a href="/sub.8.2.jsp" class="btn palatin-btn">사업공고</a>
														<a href="/sub.8.3.jsp" class="btn palatin-btn">열린제안</a>
												</div>
										</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
								</div>
						</div>
			</div>
		</div>
	</div>
	<!-- } Full Menu  Modal End -->

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
					<div class="col-lg-6 col-sm-6 col-4">
						<div class="header-top-left">
							<button class="btn-all" data-toggle="modal" data-target="#MenusModal" ></button><button class="btn-search" data-toggle="modal" data-target="#SearchModal" ></button>
							<!-- Search Icon -->
							<div id="searchIcon"><i class="fa fa-search" aria-hidden="true"></i></div>
							<!-- Large modal -->
						</div>
					</div>
					<div class="col-lg-6 col-sm-6 col-8 header-top-right">
						<ul>
							<li><a href="<c:url value='/komea/login.do'/>">로그인</a></li>
							<li><a href="/sub.login.jsp">★로그인</a></li>
							<li><a href="/sub.register.jsp">회원가입</a></li>
							<li><a href="#">사이트맵</a></li>
						</ul>
						<ul class="ul-lang">
							<li><button type="button" class="btn btn-primary btn-rounded btn-lang">KOR</button></li>
							<li><button type="button" class="btn btn-primary btn-rounded btn-lang">ENG</button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Search Form
		<div class="search-form">
				<form action="#" method="get">
						<input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
						<button type="submit" class="d-none"></button>
				</form>
				<!-- Close Icon
				<div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
		</div>
		-->

        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="/" class="nav-brand"><img src="/img/core-img/logo.gif" alt="한국조선해양기자재공업협동조합"></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
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
											<li><a href="<c:url value='/komea/mn0105.do'/>">조직도</a></li>
											<li><a href="<c:url value='/komea/mn0106.do'/>">오시는길</a></li>
										</ul>
									</li>
									<li><a href="/sub.2.1.jsp">조합원사</a>
                     				<ul class="dropdown">
											<li><a href="/sub.2.1.jsp">가입안내</a></li>
											<li><a href="/sub.2.2.jsp">회원사</a></li>
										</ul>
									</li>
									<li><a href="/sub.3.1.jsp">사업소개</a>
										<ul class="dropdown">
											<li><a href="/sub.3.1.jsp">권익도모</a></li>
											<li><a href="/sub.3.2.jsp">정보공유</a></li>
											<li><a href="/sub.3.3.jsp">코마린 전시회</a></li>
											<li><a href="/sub.3.4.jsp">공제사업</a></li>
											<li><a href="/sub.3.5.jsp">공동구매</a></li>
											<li><a href="/sub.3.6.jsp">조선기자재 수출 및 AS 거점기지 구축 및 운영</a></li>
											<li><a href="/sub.3.7.jsp">해양플랜트 기자재수출 기반구축</a></li>
										</ul>
									</li>
									<li><a href="/show/WorkList.do">전시행사</a>
										<ul class="dropdown">
											<li><a href="/show/WorkList.do">마린엑스포</a></li>
											<li><a href="/show/DisplayList.do">전시행사</a></li>
											<li><a href="/sub.4.3.jsp">상담행사</a></li>
											<li><a href="/sub.4.4.1.jsp">정보센터</a></li>
											<li><a href="/sub.4.5.jsp">My Desk</a></li>
										</ul>
									</li>
									<li><a href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a>
									</li>
									<li><a href="www.daum.net" target="_blank" >수출 및 A/S시스템</a>
									</li>
									<li><a href="www.daum.net" target="_blank" >Kosmedia</a>
									</li>
									<li><a href="/sub.7.1.jsp">자료실</a>
										<ul class="dropdown">
											<li><a href="/sub.7.1.jsp">통계자료</a></li>
											<li><a href="/sub.7.2.jsp">간행물</a></li>
											<li><a href="/sub.7.3.jsp">국문뉴스레터</a></li>
											<li><a href="/sub.7.4.jsp">영문뉴스레터</a></li>
											<li><a href="/sub.7.5.jsp">보도자료</a></li>
										</ul>
									</li>
									<li><a href="<c:url value='/komea/bbs/List.do'/>">게시판</a>
										<ul class="dropdown">
											<li><a href="<c:url value='/komea/bbs/List.do'/>">공지시항</a></li>
											<li><a href="/sub.8.2.jsp">사업공고</a></li>
											<li><a href="/sub.8.3.jsp">열린제안</a></li>
										</ul>
									</li>
								</ul>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>

			<div class="allmegamenu">
				<div class="container">
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">KOMEA<small>(KOMEC)</small></li>
							<li><a href="/sub.1.1.jsp">비전</a></li>
							<li><a href="/sub.1.2.jsp">인사말</a></li>
							<li><a href="/sub.1.3.jsp">연혁</a></li>
							<li><a href="/sub.1.4.jsp">조직도</a></li>
							<li><a href="/sub.1.5.jsp">오시는길</a></li>
					</ul>
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">조합원사</li>
							<li><a href="/sub.2.1.jsp">가입안내</a></li>
							<li><a href="/sub.2.2.jsp">회원사</a></li>
					</ul>
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">사업소개</li>
							<li><a href="/sub.3.1.jsp">권익도모</a></li>
							<li><a href="/sub.3.2.jsp">정보공유</a></li>
							<li><a href="/sub.3.3.jsp">코마린 전시회</a></li>
							<li><a href="/sub.3.4.jsp">공제사업</a></li>
							<li><a href="/sub.3.5.jsp">공동구매</a></li>
							<li><a href="/sub.3.6.jsp">조선기자재 수출 및 AS 거점기지 구축 및 운영</a></li>
							<li><a href="/sub.3.7.jsp">해양플랜트 기자재수출 기반구축</a></li>
					</ul>
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">전시행사</li>
							<li><a href="/show/WorkList.do">마린엑스포</a></li>
							<li><a href="/show/DisplayList.do">전시행사</a></li>
							<li><a href="/sub.4.3.jsp">상담행사</a></li>
							<li><a href="/sub.4.4.1.jsp">정보센터</a></li>
							<li><a href="/sub.4.5.jsp">My Desk</a></li>
					</ul>
					<ul class="menu-mega float-left">
							<a href="www.daum.net" target="_blank" ><li class="menu-mega-menuname">기자재 수요예측 시스템</li></a>
					</ul>
					<ul class="menu-mega float-left">
							<a href="www.daum.net" target="_blank" ><li class="menu-mega-menuname">수출 및 A/S시스템</li></a>
					</ul>
					<ul class="menu-mega float-left">
							<a href="www.daum.net" target="_blank" ><li class="menu-mega-menuname">Kosmedia</li></a>
					</ul>
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">자료실</li>
							<li><a href="/sub.7.1.jsp">통계자료</a></li>
							<li><a href="/sub.7.2.jsp">간행물</a></li>
							<li><a href="/sub.7.3.jsp">국문뉴스레터</a></li>
							<li><a href="/sub.7.4.jsp">영문뉴스레터</a></li>
							<li><a href="/sub.7.5.jsp">보도자료</a></li>
					</ul>
					<ul class="menu-mega float-left">
							<li class="menu-mega-menuname">게시판</li>
							<li><a href="<c:url value='/komea/bbs/List.do'/>">공지시항</a></li>
							<li><a href="/sub.8.2.jsp">사업공고</a></li>
							<li><a href="/sub.8.3.jsp">열린제안</a></li>
					</ul>
				</div>
			</div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->