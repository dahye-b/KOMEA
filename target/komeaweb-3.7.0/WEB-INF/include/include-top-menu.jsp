<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	var mnCd = "${mnCd}";
	var mnCdS = "${mnCdS}";
	mnCdS = mnCdS.substr(0,4);
//	alert(mnCdS.substr(0,4));

	$("#menu1").empty();
	$("#menu2").empty();
	$("#menu3").empty();

	if(mnCd == "mn01"){
		$("#menu1").append("KOMEA<small>(KOMEC)</small><span class='caret'><i class='fas fa-caret-down'></i></span>");
		$("#menu2").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}else if(mnCd == "mn02"){
		$("#menu1").append("조합원사<span class='caret'><i class='fas fa-caret-down'></i></span>");
		$("#menu2").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}else if(mnCd == "mn03"){
		$("#menu1").append("사업소개<span class='caret'><i class='fas fa-caret-down'></i></span>");
		$("#menu2").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}else if(mnCd == "mn04"){
		$("#menu1").append("전시상담포털<span class='caret'><i class='fas fa-caret-down'></i></span>");
		if(mnCdS == "mn01"){
			$("#menu2").append("마린엑스포<span class='caret'><i class='fas fa-caret-down'></i></span>");
		}else if(mnCdS == "mn02"){
			$("#menu2").append("전시행사<span class='caret'><i class='fas fa-caret-down'></i></span>");
		}else if(mnCdS == "mn03"){
			$("#menu2").append("상담행사<span class='caret'><i class='fas fa-caret-down'></i></span>");
		}else if(mnCdS == "mn04"){
			$("#menu2").append("정보센터<span class='caret'><i class='fas fa-caret-down'></i></span>");
		}else if(mnCdS == "mn05"){
			$("#menu2").append("MyDesk<span class='caret'><i class='fas fa-caret-down'></i></span>");
		}
		$("#menu3").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}else if(mnCd == "mn08"){
		$("#menu1").append("자료실<span class='caret'><i class='fas fa-caret-down'></i></span>");
		$("#menu2").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}else if(mnCd == "mn09"){
		$("#menu1").append("게시판<span class='caret'><i class='fas fa-caret-down'></i></span>");
		$("#menu2").append("${mnNm}<span class='caret'><i class='fas fa-caret-down'></i></span>");
	}
});
</script>

    <!-- ##### sub-title Area Start ##### -->
	<c:if test="${mnCd eq 'mn01'}"><!-- KOMEA -->
		<section class="sub-title-area bg-img bg-img1 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>KOMEA</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'mn02'}"><!-- 조합원사 -->
		<section class="sub-title-area bg-img bg-img2 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>조합원사</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'mn03'}"><!-- 사업소개 -->
		<section class="sub-title-area bg-img bg-img3 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>사업소개</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'mn04'}"><!-- 전시상담포털 -->
		<section class="sub-title-area bg-img bg-img4 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>전시상담포털</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'mn08'}"><!-- 자료실 -->
		<section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>자료실</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'mn09'}"><!-- 게시판 -->
		<section class="sub-title-area bg-img bg-img9 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>게시판</h2>
			</div>
		</section>
	</c:if>
	<c:if test="${mnCd eq 'join'}"><!-- 회원가입/수정 -->
		<section class="sub-title-area bg-img bg-img9 d-flex align-items-center justify-content-center" >
			<div class="sub-title-Content">
				<h2>회원가입</h2>
			</div>
		</section>
	</c:if>
    <!-- ##### sub-title Area End ##### -->

	<!-- ##### Section-nav Area Start #####-->
    <div class="section-nav sub-nav-line">
        <div class="container">
            <div class="row">
                <div class="col-12">
					<ul class="dropdown-line">
						<li class="dropdown-home">
							<button type="button" onClick="javascript:document.location='/';" class="btn btn-home" ></button>
						</li>
						<!-- 대메뉴 -->
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">KOMEA<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0101.do'/>">KOMEA<small>(KOMEC)</small></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0201.do'/>">조합원사</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0301.do'/>">사업소개</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/WorkList.do'/>">전시상담포털</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="http://komea.webidas.co.kr" target="_blank" >기자재 수요예측 시스템</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="http://shipsol.honorgy.co.kr" target="_blank" >수출 및 A/S시스템</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="http://kosmedia.net" target="_blank" >Kosmedia</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0801.do'/>">자료실</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B001'/>">게시판</a></li>
							</ul>
						</li>
						<!-- 중메뉴 -->
						<c:if test="${mnCd eq 'mn01'}">
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn01<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0101.do'/>">비전</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0102.do'/>">인사말</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0103.do'/>">연혁</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0104.do'/>">조직도</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0105.do'/>">오시는길</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${mnCd eq 'mn02'}">
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn02<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0201.do'/>">가입인사</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0202.do'/>">회원사</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${mnCd eq 'mn03'}">
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn03<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0301.do'/>">권익도모</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0302.do'/>">정보공유</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0303.do'/>">코마린전시회</a></li>
								<!-- li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0304.do'/>">공제사업</a></li -->
								<!-- li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0305.do'/>">공동구매</a></li -->
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0306.do'/>">조선기자재 수출 및 AS 거점기지 구축 및 운영</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0307.do'/>">해양플랜트 기자재수출 기반구축</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${mnCd eq 'mn04'}">
						 <li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn04<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ShowList.do'/>">마린엑스포</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/DisplayList.do'/>">전시행사</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ConsultList.do'/>">상담행사</a></li>
								<!-- 
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do'/>">정보센터</a></li>
								 -->
								<c:choose>
									<c:when test="${loginInfo.ssbyp eq '2'}"><!-- 기업회원 -->
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ReqBizList.do'/>">My Desk</a></li>
									</c:when>
									<c:when test="${loginInfo.ssbyp eq '3'}"><!-- 기타회원 -->
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ReqBiddingList.do'/>">My Desk</a></li>
									</c:when>
									<c:otherwise>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/SuppBizManage.do'/>">My Desk</a></li>
									</c:otherwise>
								</c:choose>


							 </ul>
						 </li>
						</c:if>
						<c:if test="${mnCd eq 'mn08'}">
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn08<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0801.do'/>">통계자료</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B002'/>">간행물</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B007'/>">국문뉴스레터</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B008'/>">영문뉴스레터</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B009'/>">보도자료</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${mnCd eq 'mn09'}">
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">Mn09<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B001'/>">공지사항</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/List.do?bCode=B010'/>">사업공고</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/bbs/QnaList.do'/>">열린제안</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=2'/>" >입찰공고</a></li>
							</ul>
						</li>
						</c:if>
						<!-- 소메뉴 -->
						<c:if test="${fn:substring(mnCdS,0,4) eq 'mn01'}">
					 	<li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu3" data-toggle="dropdown">Mn0401<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ShowList.do'/>" >행사보기</a></li>
								<c:if test="${loginInfo.compLevel eq 'A'}">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/BuyerList.do'/>" >해외바이어소개</a></li>
								</c:if>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/CompanyList.do'/>" >회원사목록</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/WorkList.do'/>" >지난행사보기</a></li>
							 </ul>
						 </li>
						</c:if>
						<c:if test="${fn:substring(mnCdS,0,4) eq 'mn02'}">
					 	<li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu3" data-toggle="dropdown">Mn0402<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/DisplayList.do'/>" >전시행사</a></li>
							 </ul>
						 </li>
						</c:if>
						<c:if test="${fn:substring(mnCdS,0,4) eq 'mn03'}">
					 	<li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu3" data-toggle="dropdown">Mn0403<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ConsultList.do'/>" >상담행사</a></li>
							 </ul>
						 </li>
						</c:if>
						<!-- 
						<c:if test="${fn:substring(mnCdS,0,4) eq 'mn04'}">
					 	<li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu3" data-toggle="dropdown">Mn0404<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=0'/>" >행사안내</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=1'/>" >성공사례</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=2'/>" >입찰공고</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=3'/>" >보도자료</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=4'/>" >정보마당</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=5'/>" >상담문의</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoCenter/List.do?bbsTy=6'/>" >우수기업선정</a></li>
							 </ul>
						 </li>
						</c:if>
						 -->
						<c:if test="${fn:substring(mnCdS,0,4) eq 'mn05'}">
					 	<li class="dropdown dropdown-sub-nvi">
							 <button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu3" data-toggle="dropdown">Mn0405<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							 <ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
								<c:choose>
									<c:when test="${loginInfo.ssbyp eq '2'}"><!-- 기업회원 -->
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoManage.do'/>">기본정보관리</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ReqBizList.do'/>">사업참여관리</a></li>
									</c:when>
									<c:when test="${loginInfo.ssbyp eq '3'}"><!-- 기타회원 -->
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoManage.do'/>">기본정보관리</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ReqBiddingList.do'/>">입찰신청관리</a></li>
									</c:when>
									<c:otherwise>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoManage.do'/>">기본정보관리</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/BestCompManage.do'/>">우수기업선정관리</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/SuppBizManage.do'/>">지원사업관리</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/ReqCompManage.do'/>">참가신청업체</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/BiddingAppManage.do'/>">입찰신청관리</a></li>
									</c:otherwise>
								</c:choose>
							 </ul>
						 </li>
						</c:if>
					</ul>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Section-nav Area End ##### -->
