<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
		<div class="wrapper ">
		<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
				<div class="main-panel">
			<jsp:include page="/WEB-INF/include/admin-menu.jsp" flush="true"></jsp:include>
<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
function fn_uodate(){
	document.Form.action = "<c:url value='/admin/UpdateBanner.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="banner" method="post"> <!-- enctype="multipart/form-data" -->
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>배너관리<small>수정</small></h3>
		</div>
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">자료실</li>
			</ol>
		</nav>

		<!-- 게시물 읽기 시작 { -->

	    <!-- 버튼 시작 { -->
	    <h6 class="d-none">버튼</h6>
	    <div class="clearfix my-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/bannerList.do'/>" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <a href="javascript:fn_Update();" class="btn btn-sm btn-primary text-white">저장</a>
	        </div>
	    </div>
	    <!-- } 버튼 끝 -->

	    <!-- 제목 시작 { 
	    <div class="my-3 border-bottom border-color-2" >
	        <h5 class="" ><span class="text-secondary" >142. </span> 게시판 제목입니다.</h5>
	    </div>
	    <!-- } 제목끝 -->

		<!-- 입력양식 시작 { -->
		<div >
			<table class="table table-bordered table-sm" >
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>
							<label class="col-form-label">기업유형</label>
						</th>
						<td colspan="3" >
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">회사명</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cmpnyNm" name="cmpnyNm" id="cmpnyNm" value="${bannerVO.cmpnyNm}" maxlength="100"/>
							<form:input type="text" class="form-control" path="cmpnyNmEng" name="cmpnyNmEng" id="cmpnyNmEng" value="${bannerVO.cmpnyNmEng}" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">회사명 영문</label>
						</th>
						<td>
							${bannerVO.cmpnyNmEng}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">대표자</label>
						</th>
						<td>
							${bannerVO.rprsntv}
						</td>
						<th>
							<label class="col-form-label">대표자 영문</label>
						</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">사업자등록번호</label>
						</th>
						<td colspan="3" >
							${bannerVO.bizNum}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">비밀번호</label>
						</th>
						<td>

						</td>
						<th>
							<label class="col-form-label">비밀번호확인</label>
						</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">소재지</label>
						</th>
						<td colspan="3" >
							${bannerVO.locplc}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">설립일자</label>
						</th>
						<td>

						</td>
						<th>
							<label class="col-form-label">종업원수</label>
						</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">전년도 매출액</label>
						</th>
						<td>

						</td>
						<th>
							<label class="col-form-label">전년도 수출실적</label>
						</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">대표전화</label>
						</th>
						<td>
							${bannerVO.telno}
						</td>
						<th>
							<label class="col-form-label">팩스</label>
						</th>
						<td>
							${bannerVO.fax}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">홈페이지</label>
						</th>
						<td>
							${bannerVO.hmpg}
						</td>
						<th>
							<label class="col-form-label">이메일</label>
						</th>
						<td>
							${bannerVO.chargerEmail}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자 이름</label>
						</th>
						<td>
							${bannerVO.chargerNm}
						</td>
						<th>
							<label class="col-form-label">담당자 부서</label>
						</th>
						<td>
							${bannerVO.chargerDept} 
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자 직위</label>
						</th>
						<td>
							${bannerVO.chargerOfcps}
						</td>
						<th>
							<label class="col-form-label">담당자 전화</label>
						</th>
						<td>
							${bannerVO.chargerTlphon}
						</td>
					</tr>						
					<tr>
						<th>
							<label class="col-form-label">담당자 이메일</label>
						</th>
						<td colspan="3" >
							${bannerVO.chargerEmail}
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">제조업 여부</label>
						</th>
						<td>
							<label class="mr-3"><input type="radio" name="Radio" id="Radio1" value="1" checked >제조업</label>
							<label class="mr-3"><input type="radio" name="Radio" id="Radio2" value="2" >미제조업</label>
						</td>
						<th>
							<label class="col-form-label">중소기업여부</label>
						</th>
						<td>
							<label class="mr-3"><input type="radio" name="Radio" id="Radio1" value="1" checked >중소기업</label>
							<label class="mr-3"><input type="radio" name="Radio" id="Radio2" value="2" >기타</label>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- } 입력양식 끝 -->
<!--
	    <!-- 본문 내용 시작 { 
	    <h6 class="d-none">본문</h6>
	    <div class="py-3 border-bottom border-color-5 clearfix">

뷰화면 테이블로 만들어 주세요,,
**기관, 기타회원**<br/>
기업유형 : ${mberVO.ssbypNm}<br/>
회사명 : ${mberVO.cmpnyNm}/ 회사명 영문 :${mberVO.cmpnyNmEng}<br/> 
대표자 : ${mberVO.rprsntv}<br/>
아이디 : ${mberVO.id}<br/>
소재지 : ${mberVO.locplc}<br/>
대표전화 : ${mberVO.telno}/ 팩스 :${mberVO.fax}<br/> 
이메일 : ${mberVO.chargerEmail}<br/>
담당자이름 : ${mberVO.chargerNm} / 담당자부서 :${mberVO.chargerDept}<br/> 
담당자직책 :  ${mberVO.chargerOfcps}/ 담당자전화 :${mberVO.chargerTlphon}<br/>
담당자이메일 : ${mberVO.chargerEmail}/ 담당자휴대폰 : <br/>
주요업무 : <br/>
기타사항 : <br/>
회사소개서 : <br/>
재무재표 : <br/>
기타첨부 :  <br/><br/>
**기업회원**<br/>
기업유형 : ${mberVO.ssbypNm}<br/>
회사명 : ${mberVO.cmpnyNm}/ 회사명영문 :${mberVO.cmpnyNmEng}<br/> 
대표자 : ${mberVO.rprsntv}/ 대표자영문 :${mberVO.rprsntvEng} <br/>
아이디 : ${mberVO.id}<br/>
소재지 : ${mberVO.locplc}<br/>
설립일자 : / 종업원수 :<br/> 
전년도매출액 : / 전년도수출실적 :<br/> 
대표전화 : ${mberVO.telno} / 팩스 : ${mberVO.fax}<br/>
홈페이지 : ${mberVO.hmpg} / 이메일 : ${mberVO.chargerEmail}<br/>
담당자이름 : ${mberVO.chargerNm}/ 담당자부서 :${mberVO.chargerDept}<br/>
담당자직위 : ${mberVO.chargerOfcps}/ 담당자 전화 : ${mberVO.chargerTlphon}<br/>
담당자이메일 : ${mberVO.chargerEmail}<br/>
제조업여부 : / 중소기업여부 :<br/>
 <br/>
*제품 및 기타정보<br/>
메인제품(국문) : ${mberVO.mainPrduct}<br/>
메인제품(영문) : ${mberVO.mainPrductEng}<br/>
특허/인증 : ${mberVO.bizNum}<br/>
주요거래처 : <br/>
제품사진첨부 : <br/>
기타첨부 : <br/>


승인 : ${mberVO.sbscrbConfmYn}<br/>
등급현황 : ${mberVO.compLevelNm}<br/>
조합원사여부 : ${mberVO.unionCompYn}<br/>

// 상세 click: fn_view
//포인트이력  click: fn_point 
<br />
	    </div>
	    <!-- } 본문 내용 끝 -->

	    <!-- 관련링크 시작 { 
	    <h6 class="d-none">관련링크</h6>
	    <div class="clearfix text-right my-3 pb-3 border-bottom border-color-5">		        
		       <a href="#" target="_blank" title="www.daum.net" class="pl-3" ><i class="fas fa-link text-info"></i> <strong>http://www.daum.net</strong></a>
		       <a href="#" target="_blank" title="www.daum.net" class="pl-3" ><i class="fas fa-link text-info"></i> <strong>http://www.daum.net</strong></a>
	    </div>
	    <!-- } 관련링크 끝 -->

	    <!-- 버튼 시작 { 
	    <h6 class="d-none">버튼</h6>
	    <div class="clearfix my-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="#" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <a href="#" class="btn btn-sm btn-secondary text-white" >답변</a>
	            <a href="#" class="btn btn-sm btn-primary text-white" >글쓰기</a>
	        </div>
	    </div>
	    <!-- } 버튼 끝 -->

		<!-- } 게시판 읽기 끝 -->

</div>

						</div><!-- div class="content" -->
<!-- //######################################## } content 영역 끝 -->
</form:form>

				</div>
		</div>
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>