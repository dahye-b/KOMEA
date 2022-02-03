<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">회원가입<span class="caret"><i class="fas fa-caret-down"></i></span></button>
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
    <section class="section-area join">
        <div class="container">
            <div class="row">

							<div class="section-heading mb-5 col-12">
						<h2>회원가입</h2>
						<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12">
					<!-- 회원정보 { -->
					<h3 class="card-title"><i class="fas fa-user-check"></i> 회원가입</h3>
					<div class="card mb-100 bg-light" >
						<div class="card-body mt-30 mb-30 text-center">
								<h3 class="thin">회원가입이 완료 되었습니다.</h3>
								<p class="mb-50 px-30">
										<br>
										회원가입을 축하합니다.<br>
										소중한 회원님의 개인정보는 안전하게 보관, 관리 됩니다.<br />
								</p>

					    		<div class="clearfix text-center" >
							            <a href="<c:url value='/komeaMain.do'/>" class="btn btn-secondary mr-10">처음으로</a>
							            <a href="<c:url value='/komea/login.do'/>" class="btn btn-primary">로그인</a>
							    </div>

						</div>
					</div>
					<!-- } 회원정보 -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
