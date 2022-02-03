<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>

    <!-- ##### SUB-TITLE Area Start ##### -->
    <section class="sub-title-area bg-img d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section>
    <!-- ##### SUB-TITLE Area End ##### -->

    <!-- ##### section-nav Area Start ##### -->
    <div class="section-nav sub-nav-line">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
										<div class="dropdown-line">
											<div class="dropdown dropdown-sub-nvi">
												<button class="btn btn-default dropdown-toggle btn-sub-nvi" type="button" id="menu1" data-toggle="dropdown">KOMEA
												<span class="caret"></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.1.jsp">KOMEA</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.2.1.jsp">KOMEC</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.3.1.jsp">사업소개</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.4.1.jsp">전시포털</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.5.1.jsp">A/S관리시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.6.1.jsp">해외규격인증정보</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.7.1.jsp">자료실</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.8.1.jsp">게시판</a></li>
												</ul>
											</div>
											<div class="dropdown dropdown-sub-nvi">
												<button class="btn btn-default dropdown-toggle btn-sub-nvi" type="button" id="menu1" data-toggle="dropdown">공지사항
												<span class="caret"></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.1.jsp">비전</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.2.jsp">인사말</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.3.jsp">연혁</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.4.jsp">조합원사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.5.jsp">조직도</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.1.6.jsp">오시는길</a></li>
												</ul>
											</div>
										</div>
                </div>
            </div>
    		</div>
    </div>

    <!-- ##### section-nav Area End ##### -->

    <!-- ##### About Us Area Start ##### -->
    <section class="about-us-area location">
    	<div class="container">
    			<div class="row align-items-center">
          		<div class="section-heading col-12">
					<h2>공시사항 - 게시판</h2>
				</div>
			</div>
		</div>
		<!--끝 container-->

		<div class="container">

				<!-- 공지사항 시작 { -->

				    <!-- 게시물 상단 버튼 시작 { -->
				    <form class="form-inline float-right brdBlue" role="form">
					    <div class="form-group mb-15 brdRed" >
				        	<input type="text" class="form-control form-control-sm mr-1" value="" placeholder="검색어" size="10" />
				            <a href="#" class="btn btn-sm btn-secondary text-white mr-2" >검색</a>			            
					        <div class="btn-group btn-group-justified float-right">
					            <a href="#" class="btn btn-sm btn-secondary text-white" >목록</a>
					            <a href="#" class="btn btn-sm btn-primary text-white" >글쓰기</a>
					        </div>				        
					    </div>
				    </form>
				    <!-- } 게시물 상단 버튼 끝 -->

					<!-- 게시물 읽기 시작 { -->
					<div class="table-responsive text-nowrap">
						<h6>전체 123건, <small>(1/12 페이지)</small></h6>
						<table class="table table-bordered table-form" summary="게시판 자료">
							<colgroup>
								<col style="width:5%;" />
								<col style="width:65%;" />
								<col style="width:15%;" />
								<col style="width:5%;" />
								<col style="width:5%;" />
								<col style="width:15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">조회</th>
									<th scope="col">파일</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center" >1</td>
									<td>KOMEA, 해외 지사화 사업 업체 모집 공고</td>
									<td>유신소프트</td>
									<td class="text-center" >2354</td>
									<td class="text-center" ><i class="far fa-file"></i> <small class="text-muted">(HWP)</small>
										<!--
										<i class="far fa-file-pdf"></i>
										<i class="far fa-file-word"></i>
										<i class="far fa-file-excel"></i>
										-->
									</td>
									<td>18.01.01</td>
								</tr>
								<tr>
									<td class="text-center" >2</td>
									<td>2018 조선해양 우수기자재업체 인정서 수여 대상업체 모집</td>
									<td>카트라</td>
									<td class="text-center" >2354</td>
									<td class="text-center" ><i class="far fa-file"></i></td>
									<td>18.01.02</td>
								</tr>
								<tr>
									<td class="text-center" >3</td>
									<td>[농림축산검역본부] 뉴질랜드 수입위생 요건 강화 공지.</td>
									<td>바른정보</td>
									<td class="text-center" >2354</td>
									<td class="text-center" ><i class="far fa-file"></i></td>
									<td>18.01.03</td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- } 게시판 목록 끝 -->

				    <!-- 게시물 상단 버튼 시작 { -->
				    <!--
				    <div class="clearfix" >
				        <ul class="list-inline float-left">
				            <li class="list-inline-item"><a href="#" class="btn btn-sm btn-secondary">이전글</a></li>
				            <li class="list-inline-item"><a href="#" class="btn btn-sm btn-secondary">다음글</a></li>
				        </ul>
				        <ul class="list-inline float-right">
				            <li class="list-inline-item" ><a href="#" class="btn btn-sm btn-secondary" >검색</a></li>
				            <li class="list-inline-item" ><a href="#" class="btn btn-sm btn-secondary" >목록</a></li>
				            <li class="list-inline-item" ><a href="#" class="btn btn-sm btn-secondary" >답변</a></li>
				            <li class="list-inline-item" ><a href="#" class="btn btn-sm btn-primary" >글쓰기</a></li>
				        </ul>
				    </div>
				    -->
				    <!-- } 게시물 상단 버튼 끝 -->

				    <!-- 게시물 상단 버튼 시작 { -->
				    <div class="clearfix" >
				        <div class="btn-group btn-group-justified float-left">
				            <a href="#" class="btn btn-sm btn-secondary">이전글</a>
				            <a href="#" class="btn btn-sm btn-secondary">다음글</a>
				        </div>
				        <div class="btn-group btn-group-justified float-right">
				            <a href="#" class="btn btn-sm btn-secondary" >목록</a>
				            <a href="#" class="btn btn-sm btn-primary" >글쓰기</a>
				        </div>
				    </div>
				    <!-- } 게시물 상단 버튼 끝 -->

					<div class="my-3 clearfix" >
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#">처음</a></li>
								<li class="page-item"><a class="page-link" href="#">이전</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">다음</a></li>
								<li class="page-item"><a class="page-link" href="#">끝</a></li>
							</ul>
						</nav>
					</div>

				<!-- } 공지사항 끝 -->

		</div>
   	</section>

    <!-- ##### About Us Area End ##### -->


<%@ include file="/WEB-INF/include/include-bottom.jsp" %>