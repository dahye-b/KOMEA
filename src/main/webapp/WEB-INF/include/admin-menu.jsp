<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<!-- //######################################## Navbar 영역 시작 -->
            <!-- nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top bg-primary " -->
            <nav class="navbar navbar-expand-lg navbar-absolute fixed-top bg-primary ">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="#pablo">관리자페이지</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
					<!--
                        <form>
                            <div class="input-group no-border">
								<div class="input-group-append">
	                                <input type="text" value="" class="form-control" placeholder="검색...">
	                                <span class="input-group-text">
	                                	<i class="fas fa-search"></i>
	                                </span>
								</div>
                            </div>
                        </form>
						-->
                        <ul class="navbar-nav">
                            <!-- li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <i class="fas fa-signal"></i>
                                    <p><span class="d-lg-none d-md-block">Stats</span></p>
                                </a>
                            </li -->
                            <li class="nav-item">
                                <a class="text-14 nav-link" href="/komeaMain.do" title="KOMEA 바로가기" ><i class="fas fa-share"></i> KOMEA 바로가기</a>
							<!--
                                <a class="text-14 nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="메뉴바로가기" >
                                    <i class="fas fa-thumbtack"></i> 바로가기
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">중요메뉴 바로가기 1</a>
                                    <a class="dropdown-item" href="#">중요메뉴 바로가기 2</a>
                                    <a class="dropdown-item" href="#">중요메뉴 바로가기 3</a>
                                </div>
							-->
                            </li>
							<li class="nav-item">
                                <!-- <a class="text-14 nav-link" href="#" title="정보수정" ><i class="fas fa-user"></i> 정보수정</a> -->
                            </li>
                            <li class="nav-item">
                                <a class="text-14 nav-link" href="<%=request.getContextPath()%>/logout" title="로그아웃" ><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
                            </li>
                            <!-- li class="nav-item">
                                <a class="nav-link" href="#" >
                                    <i class="fas fa-user"></i>
                                    <p><span class="d-lg-none d-md-block">사용자계정</span></p>
                                </a>
                            </li -->
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- //######################################## Navbar 영역 끝 -->

            <!-- //######################################## panel header 영역 시작 -->
            <div class="panel-header">
            </div>
            <!-- //######################################## panel header 영역 끝 -->
