<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function goJoin(obj){
	document.Form.ssbyp.value = obj;
	document.Form.action = "<c:url value='/komea/Join02.do'/>";
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

	<form:form name="Form" commandName="mber" method="post">
		<form:input type="hidden" path="ssbyp" name="ssbyp" id="ssbyp" value=""/>

    <!-- ##### Section Area Start ##### -->
    <section class="section-area join">
        <div class="container">
            <div class="row">
					<div class="section-heading mb-5 col-12">
						<h2>회원가입</h2>
						<div class="dropdown-line-subtitle"></div>
            		</div>
            		<div class="section-text col-12 mb-100 ">
            				<div class="card bg-light" >
            						<div class="card-body text-center mb-30 mt-30">
										<h3>회원유형선택</h3>
										<p class="mb-30">
												고객님께서 해당하시는 구분을 선택해주세요.<br>
												회원성격에 따라 가입방법이 다르니 유의하시기 바랍니다.
										</p>
										<div class="join-box-Large">
												<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
														<p><img src="/img/core-img/company-member.png" alt="기업회원"></p>
														<h4>기업회원</h4>
														<p>
																기업회원으로 가입시 행사참여 및<br> 바이어정보들을 볼 수 있습니다.
														</p>
														<button type="button" class="btn btn-bluee" onClick="javascript:goJoin('2');" title="기업회원가입">
																<span>회원가입</span>
														</button>
												</div>
												<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
														<p><img src="/img/core-img/govern-member.png" alt="기관회원"></p>
														<h4>기관회원</h4>
														<p>
																기관회원 가입시 행사의 주최 및<br> 기업과의 매칭 시스템을 이용할 수 있습니다
														</p>
														<button type="button" class="btn btn-bluee" onClick="javascript:goJoin('1');" title="기관회원가입">
																<span>회원가입</span>
														</button>
												</div>
												<div class="col-sm-12 col-md-4 col-lg-4 join-box-middle">
														<p><img src="/img/core-img/general-member.png" alt="기타회원"></p>
														<h4>기타회원</h4>
														<p>
																기관,기업 외의 회원은 기타회원으로<br> 가입하여 입찰 신청 시스템 이용이 가능합니다.
														</p>
														<button type="button" class="btn btn-bluee" onClick="javascript:goJoin('3');" title="기타회원가입">
																<span>회원가입</span>
														</button>
												</div>
										</div>
            						</div>
            				</div>
						</div><!--끝 "section-text col-12"-->

						</div><!--끝 "row"-->
				</div><!--끝 "container"-->
    </section>
    <!-- ##### Section Area End ##### -->
</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
