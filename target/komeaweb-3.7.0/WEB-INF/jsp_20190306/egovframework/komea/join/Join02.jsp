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
		if(fm.insttNm.value==""){
			alert("기관명을 입력하세요.");
			fm.insttNm.focus();
			return;
		}
		if(fm.rprsntv.value==""){
			alert("대표자를 입력하세요.");
			fm.rprsntv.focus();
			return;
		}
		if(fm.id.value==""){
			alert("아이디를 입력하세요.");
			fm.id.focus();
			return;
		}
		if(fm.password.value==""){
			alert("비밀번호를 입력하세요.");
			fm.password.focus();
			return;
		}
		if(fm.cfm_password.value==""){
			alert("비밀번호확인을 입력하세요.");
			fm.cfm_password.focus();
			return;
		}
		if(fm.telno.value==""){
			alert("대표전화를 입력하세요.");
			fm.telno.focus();
			return;
		}
		if(fm.reprsntEmail.value==""){
			alert("이메일을 입력하세요.");
			fm.reprsntEmail.focus();
			return;
		}
		if(fm.mainSkll.value==""){
			alert("주요기능을 입력하세요.");
			fm.mainSkll.focus();
			return;
		}
	}else if(ssbyp == "2"){
		if(fm.cmpnyNm.value==""){
			alert("회사명을 입력하세요.");
			fm.cmpnyNm.focus();
			return;
		}
		if(fm.rprsntv.value==""){
			alert("대표자를 입력하세요.");
			fm.rprsntv.focus();
			return;
		}
		if(fm.id.value==""){
			alert("사업자등록번호(아이디)를 입력하세요.");
			fm.id.focus();
			return;
		}
		if(fm.password.value==""){
			alert("비밀번호를 입력하세요.");
			fm.password.focus();
			return;
		}
		if(fm.cfm_password.value==""){
			alert("비밀번호확인을 입력하세요.");
			fm.cfm_password.focus();
			return;
		}
		if(fm.locplc.value==""){
			alert("소재지를 입력하세요.");
			fm.locplc.focus();
			return;
		}
		if(fm.fondDe.value==""){
			alert("설립일자를 선택하세요.");
			fm.fondDe.focus();
			return;
		}
		if(fm.emplyCo.value==""){
			alert("종업원수를 입력하세요.");
			fm.emplyCo.focus();
			return;
		}
		if(fm.beforeYearSalamt.value==""){
			alert("전년도매출액을 입력하세요.");
			fm.beforeYearSalamt.focus();
			return;
		}
		if(fm.beforeYearXportAcmslt.value==""){
			alert("전년도 수출실적을 입력하세요.");
			fm.beforeYearXportAcmslt.focus();
			return;
		}
		if(fm.telno.value==""){
			alert("대표전화를 입력하세요.");
			fm.telno.focus();
			return;
		}
		if(fm.fax.value==""){
			alert("팩스를 입력하세요.");
			fm.fax.focus();
			return;
		}
		if(fm.reprsntEmail.value==""){
			alert("이메일을 입력하세요.");
			fm.reprsntEmail.focus();
			return;
		}
		if(fm.mfcrtrYn.value==""){
			alert("제조업여부를 선택하세요.");
			fm.mfcrtrYn.focus();
			return;
		}
		if(fm.smlpzYn.value==""){
			alert("중소기업여부를 선택하세요.");
			fm.smlpzYn.focus();
			return;
		}
		if(fm.mainPrduct.value==""){
			alert("메인제품(국문)을 입력하세요.");
			fm.mainPrduct.focus();
			return;
		}
		if(fm.mainPrductEng.value==""){
			alert("메인제품(영문)을 입력하세요.");
			fm.mainPrductEng.focus();
			return;
		}
		if(fm.fileNm.value==""){
			alert("제품사진을 첨부하세요.");
			fm.fileNm.focus();
			return;
		}
	}else if(ssbyp == "3"){
		if(fm.ssbypGb.value==""){
			alert("가입유형을 선택하세요.");
			fm.ssbypGb.focus();
			return;
		}
		if(fm.cmpnyNm.value==""){
			alert("상호명을 입력하세요.");
			fm.cmpnyNm.focus();
			return;
		}
		if(fm.rprsntv.value==""){
			alert("대표자를 입력하세요.");
			fm.rprsntv.focus();
			return;
		}
		if(fm.telno.value==""){
			alert("대표전화를 입력하세요.");
			fm.telno.focus();
			return;
		}
		if(fm.fax.value==""){
			alert("팩스를 입력하세요.");
			fm.fax.focus();
			return;
		}
		if(fm.id.value==""){
			alert("아이디를 입력하세요.");
			fm.id.focus();
			return;
		}
		if(fm.fileNm.value==""){
			alert("이메일을 입력하세요.");
			fm.fileNm.focus();
			return;
		}
		if(fm.password.value==""){
			alert("비밀번호를 입력하세요.");
			fm.password.focus();
			return;
		}
		if(fm.cfm_password.value==""){
			alert("비밀번호확인을 입력하세요.");
			fm.cfm_password.focus();
			return;
		}
		if(fm.chargerNm.value==""){
			alert("담당자이름을 입력하세요.");
			fm.chargerNm.focus();
			return;
		}
		if(fm.chargerDept.value==""){
			alert("담당자부서를 입력하세요.");
			fm.chargerDept.focus();
			return;
		}
		if(fm.chargerOfcps.value==""){
			alert("담당자직책을 입력하세요.");
			fm.chargerOfcps.focus();
			return;
		}
		if(fm.chargerTlphon.value==""){
			alert("담당자연락처를 입력하세요.");
			fm.chargerTlphon.focus();
			return;
		}
		if(fm.chargerHp.value==""){
			alert("담당자휴대폰을 입력하세요.");
			fm.chargerHp.focus();
			return;
		}
		if(fm.chargerEmail.value==""){
			alert("담당자이메일을 입력하세요.");
			fm.chargerEmail.focus();
			return;
		}
		/*
		if(fm.fileNm.value==""){
			alert("우편번호를 입력하세요.");
			fm.fileNm.focus();
			return;
		}
		*/
		if(fm.locplc.value==""){
			alert("소재지를 입력하세요.");
			fm.locplc.focus();
			return;
		}
		if(fm.mainSkll.value==""){
			alert("주요업무를 입력하세요.");
			fm.mainSkll.focus();
			return;
		}
		if(fm.etcMatter.value==""){
			alert("기타사항을 입력하세요.");
			fm.etcMatter.focus();
			return;
		}
		if(fm.fileNm.value==""){
			alert("회사소개서를 첨부하세요.");
			fm.fileNm.focus();
			return;
		}
		if(fm.fileNm2.value==""){
			alert("최근 2년간 재무제표를 첨부하세요.");
			fm.fileNm2.focus();
			return;
		}
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
    <!-- section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center">
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section -->
    <!-- ##### sub-title Area End ##### -->

	<!-- ##### Section-nav Area Start ##### -->
	<!-- div class="section-nav sub-nav-line">
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
    </div -->
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
