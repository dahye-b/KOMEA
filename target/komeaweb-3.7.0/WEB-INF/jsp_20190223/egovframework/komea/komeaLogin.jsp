<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>

    <!-- ##### sub-title Area Start ##### -->
    <section class="sub-title-area bg-img d-flex align-items-center justify-content-center" style="background-image: url(/img/bg-img/bg-2.jpg);">
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
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoManage.do'/>">KOMEA<small>(KOMEC)</small></a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0101.do'/>">조합원사</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0201.do'/>">사업소개</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/WorkView.do'/>">전시행사</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >수출 및 A/S시스템</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0801.do'/>">자료실</a></li>
									 <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0901.do'/>">게시판</a></li>
								</ul>
							</li>
							<li class="dropdown dropdown-sub-nvi">
								<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">로그인<span class="caret"><i class="fas fa-caret-down"></i></span></button>
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
					<h2>로그인</h2>
					<div class="dropdown-line-subtitle"></div>
            	</div>
            	<div class="section-text col-12 mb-100 ">
            		<div class="card" id="login-form" >
						<div class="container mb-30 px-70">
							<div class="row">
								<div class="col-sm-6 py-30">
									<h1 class="text-center pt-30 ">
										<i class="fas fa-user-lock text-primary"></i>
									</h1>
									<h1 class="text-center">
										<span class="text-secondary">Membership</span><span class="text-thin">Login</span>
									</h1>
									<p class="text-center px-30">
										회원가입하시면 한국조선해양기자재공업협동조합의 다양한 정보를 이용하실 수 있습니다.
									</p>
								</div>
								<div class="loginbox col-sm-6 text-center mt-50 py-30 ">
									<c:url var="loginUrl" value="/login" />
									<form action="${loginUrl}" method="post" class="login-form">

									<div class="row  mt-10">
										<div class="col-sm-10">
												<div class="form-group row mb-1">
													<label for="username" class="col-form-label col-3 " ><strong>ID</strong></label>
													<div class="col-9">
														<input type="text" class="form-control rounded-0" id="username" name="username" placeholder="아이디" required >
													</div>
												</div>
												<div class="form-group row mb-0">
													<label for="password" class="col-form-label col-3 " ><strong>PW</strong></label>
													<div class="col-9">
														<input type="password" class="form-control rounded-0" id="password" name="password" placeholder="비밀번호" required >
													</div>
													<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
												</div>
										</div>
										<div class="col-sm-2 div-submit">
											<button type="submit" class="btn btn-sm btn-primary btn-block h-100 rounded-1">로그인</button>
										</div>
									</div>

									<div class="text-center mt-10">
											<label class="form-check-label text-14 mb-10 ">
											<input type="checkbox" class="form-check-input " value="" /> ID저장
											</label>
									</div>

									</form>
								</div>
							</div><!-- div class="row" -->
						</div>

            			<div class="card-body join-box bg-light">
							<div class="join-box-Large">
								<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
									<p><img src="/img/core-img/general-member.png" alt="회원가입"></p>
									<p>아직 회원가입을 하지 않으셨나요?</p>
									<button type="button" class="btn btn-sm btn-bluee " onClick="location.href='/komea/JoinInit.do' " title="회원가입"><span>회원가입</span></button>
								</div>
								<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
									<p><img src="/img/core-img/find-id.png" alt="아이디찾기"></p>
									<p>아이디가 기억나지 않으세요?</p>
									<button type="button" class="btn btn-sm btn-bluee " onClick="location.href='/sub.findlogin.jsp' " title="아이디찾기"><span>아이디찾기</span></button>
								</div>
								<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
									<p><img src="/img/core-img/find-pw.png" alt="기타회원"></p>
									<p>비밀번호가 기억나지 않으세요?</p>
									<button type="button" class="btn btn-sm btn-bluee " onClick="location.href='/sub.findlogin.jsp' " title="비밀번호찾기"><span>비밀번호찾기</span></button>
								</div>
							</div><!-- div class="join-box-Large" -->
            			</div><!-- div class="card-body join-box bg-light" -->
            		</div><!-- div class="card"  -->

				</div><!-- section-text col-12 -->

			</div><!-- row -->
		</div><!-- container -->
    </section>
    <!-- ##### Section Area End ##### -->

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
