<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_IdCheck(){
	if(document.Form.id.value == ""){
		alert("아이디를 입력하세요.");
		return;
	}else{
		//alert(document.Form.id.value);
	}
	document.Form.action = "<c:url value='/komea/Join02.do'/>";
	document.Form.submit();
}

function fn_Insert(){
	var fm = document.Form;
	var ssbyp = "${ssbyp}";

	if(ssbyp == "1"){

	}else if(ssbyp == "2"){
		if(document.Form.fileNm.value==""){
			alert("제품사진 첨부 파일 업로드는 필수 입니다.");
			document.Form.fileNm.focus();
			return;
		}
		if(document.Form.mfcrtrYn.value==""){
			alert("제조업 여부는 필수 선택입니다.");
			document.Form.mfcrtrYn.focus();
			return;
		}
		if(document.Form.smlpzYn.value==""){
			alert("중소기업 여부는 필수 선택입니다.");
			document.Form.smlpzYn.focus();
			return;
		}
	}else if(ssbyp == "3"){
		if(document.Form.fileNm.value==""){
			alert("회사소개서 첨부 파일 업로드는 필수 입니다.");
			document.Form.fileNm.focus();
			return;
		}
		if(document.Form.fileNm2.value==""){
			alert("최근 2년간 재무제표 첨부 파일 업로드는 필수 입니다.");
			document.Form.fileNm2.focus();
			return;
		}
	}

	if(fm.id == "") {
		alert("아이디는 필수 입력 항목 입니다.");
		fm.id.focus();
		return;
	}
	if(fm.password.length < 5 ) {
		alert("비밀번호는 6자리 이상 입력해 주세요.");
		return;
	}
	var pw = document.getElementById("password").value;
    var pwck = document.getElementById("cfm_password").value;

	if(pw != pwck) {
		alert(pw);
		alert(pwck);
		alert("비밀번호 와 비밀번호 확인 값이 일치 하지 않습니다.");
		return false;
	}

	document.Form.action = "<c:url value='/komea/JoinMber.do'/>"
	document.Form.submit();
}
</script>
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
	<form:form name="Form" commandName="mber" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
	<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="ssbyp" id="ssbyp" name="ssbyp" value="${ssbyp}" />
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
				<div class="section-heading mb-5 col-12">
					<h2>회원가입</h2>
					<div class="dropdown-line-subtitle"></div>
					<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 mb-100 bo-w">

						<!-- 회원정보 시작 { -->
						<h4 class=""><i class="fas fa-user-edit"></i> 회사정보</h4>
						<p>
							<span class="required"></span> 표시의 항목은 필수 입력 항목입니다.
						</p>
						<div class="container mt-30 mb-30" >

							<c:choose>
								<c:when test="${ssbyp eq '1'}">
									<!-- 기관회원 -->
									<!-- 기관회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/orgRegistForm.jsp">
									<jsp:param value="Join" name="flag"/>
									</jsp:include>
									<!-- 기관회원입력 끝 -->
								</c:when>
								<c:when test="${ssbyp eq '2'}">
									<!-- 기업회원 -->
									<!-- 기업회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/compRegistForm.jsp">
									<jsp:param value="Join" name="flag"/>
									</jsp:include>
									<!-- 기업회원입력 끝 -->
								</c:when>
								<c:otherwise>
									<!-- 기타 -->
									<!-- 기타회원입력 -->
									<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/othersRegistForm.jsp">
									<jsp:param value="Join" name="flag"/>
									</jsp:include>
									<!-- 기타회원입력 끝 -->
								</c:otherwise>
							</c:choose>

						</div><!-- div class="container bg-light mt-30 mb-30 bo-w"  -->
						<!-- } 회원정보 끝 -->

						<div class="text-center mb-50">
							<a href="javascript:fn_Insert();" class="btn btn-secondary mr-10">회원가입</a>
							<a href="<c:url value='/komeaMain.do'/>" class="btn btn-secondary mr-10">취소</a>
						</div>

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

	</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
