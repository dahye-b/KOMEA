<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/include/admin-head.html" flush="true"></jsp:include>
<div class="wrapper wrapper-full-page">
	<jsp:include page="/WEB-INF/include/admin-sidebar.html" flush="true"></jsp:include>
	<div class="main-panel">
		<jsp:include page="/WEB-INF/include/admin-menu.html" flush="true"></jsp:include>

<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
function fn_Edit(){
	document.Form.action = "<c:url value='/admin/mberView.do'/>";
	document.Form.submit();
}
function fn_UpdatePasswrod(){
	if(confirm("해당 회원의 비밀번호를 이메일주소로 변경합니다.\n초기화 하시겠습니까?") == true){
		document.Form.action = "<c:url value='/admin/UpdateMemberPass.do'/>";
		document.Form.submit();
	}
}
function fn_Delete(){
	if(confirm("해당 회원의 모든 정보는 삭제됩니다.\n삭제 하시겠습니까?") == true){
		document.Form.action = "<c:url value='/admin/DeleteMber.do'/>";
		document.Form.submit();
	}
}
</script>

<div class="content">
<div class="container_fluid">

	<form:form name="Form" commandName="mberVO" method="post"> <!-- enctype="multipart/form-data" -->
	<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
	<form:input type="hidden" path="mberCd" name="mberCd" id="mberCd" value="${mberVO.mberCd}"/>

		<div class="page-header"> 
			<h3>회원관리 <small>상세보기</small></h3>
		</div>
		
		
		<!-- nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">자료실</li>
			</ol>
		</nav -->

		<!-- 게시물 읽기 시작 { -->

	    <!-- 버튼 시작 { -->
	    <div class="clearfix mb-1" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/mberList.do'/>" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <!--<a href="<c:url value='/admin/mberEdit.do'/>" class="btn btn-sm btn-primary text-white" >수정</a>-->
	            <a href="javascript:fn_UpdatePasswrod();" class="btn btn-sm btn-secondary text-white" >비밀번호 초기화</a>
	            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary text-white">회원삭제</a>
	        </div>
	    </div>
	    <!-- } 버튼 끝 -->

	    <!-- 본문 제목1 시작 { -->
	    <!-- div class="my-3 border-bottom border-color-2" >
	        <h5 class="" ><span class="text-secondary" ><i class="far fa-building"></i> 회사정보</h5>
	    </div -->
        <h5 class="content-title" ><i class="far fa-list-alt"></i> 회사정보</h5>
	    <!-- } 본문 제목1 시작 -->

		<c:choose>
			<c:when test="${mberVO.ssbyp eq '1'}"><!-- 기관회원 -->
				<!-- 기관회원 입력양식 시작 -->
				<div>
					<table class="table table-bordered table-sm" >
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="col-form-label">기업유형</label></th>
								<td colspan="3" >${mberVO.ssbypNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">승인</label></th>
								<td>${mberVO.sbscrbConfmYn}</td>
								<th><label class="col-form-label">등급현황</label></th>
								<td>${mberVO.compLevelNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">기관명</label></th>
								<td>${mberVO.insttNm}</td>
								<th><label class="col-form-label">기관명 영문</label></th>
								<td>${mberVO.insttNmEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표자</label></th>
								<td>${mberVO.rprsntv}</td>
								<th><label class="col-form-label">대표자 영문</label></th>
								<td>${mberVO.rprsntvEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">아이디</label></th>
								<td colspan="3" >
									${mberVO.id}
								</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 이름</label></th>
								<td>${mberVO.chargerNm} / ${mberVO.chargerNmEng}</td>
								<th><label class="col-form-label">담당자 부서</label></th>
								<td>${mberVO.chargerDept} / ${mberVO.chargerDeptEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표전화</label></th>
								<td>${mberVO.telno}</td>
								<th><label class="col-form-label">팩스</label></th>
								<td>${mberVO.fax}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">이메일</label></th>
								<td colspan="3">${mberVO.reprsntEmail}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">주요기능</label></th>
								<td colspan="3">${mberVO.mainSkll}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">기타사항</label></th>
								<td colspan="3">${mberVO.etcMatter}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 기관회원 입력양식 끝 -->
			</c:when>
			<c:when test="${mberVO.ssbyp eq '2'}"><!-- 기업회원 -->
				<!-- 기업회원 입력양식 시작 -->
				<div>
					<table class="table table-bordered table-sm" >
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="col-form-label">기업유형</label></th>
								<td colspan="3" >${mberVO.ssbypNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">승인</label></th>
								<td>${mberVO.sbscrbConfmYn}</td>
								<th><label class="col-form-label">등급현황</label></th>
								<td>${mberVO.compLevelNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">회사명</label></th>
								<td>${mberVO.cmpnyNm}</td>
								<th><label class="col-form-label">회사명 영문</label></th>
								<td>${mberVO.cmpnyNmEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표자</label></th>
								<td>${mberVO.rprsntv}</td>
								<th><label class="col-form-label">대표자 영문</label></th>
								<td>${mberVO.rprsntvEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">사업자등록번호(아이디)</label></th>
								<td colspan="3" >
									${mberVO.id}
								</td>
							</tr>
							<tr>
								<th><label class="col-form-label">소재지</label></th>
								<td colspan="3" >
									${mberVO.locplc}<br/>
									${mberVO.locplcEng}
								</td>
							</tr>
							<tr>
								<th><label class="col-form-label">설립일자</label></th>
								<td>${mberVO.fondDe}</td>
								<th><label class="col-form-label">종업원수</label></th>
								<td>${mberVO.emplyCo}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">전년도 매출액</label></th>
								<td>￦ ${mberVO.beforeYearSalamt}(백만원)</td>
								<th><label class="col-form-label">전년도 수출실적</label></th>
								<td>$ ${mberVO.beforeYearXportAcmslt}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표전화</label></th>
								<td>${mberVO.telno}</td>
								<th><label class="col-form-label">팩스</label></th>
								<td>${mberVO.fax}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">홈페이지</label></th>
								<td>${mberVO.hmpg}</td>
								<th><label class="col-form-label">이메일</label></th>
								<td>${mberVO.chargerEmail}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 이름</label></th>
								<td>${mberVO.chargerNm} / ${mberVO.chargerNmEng}</td>
								<th><label class="col-form-label">담당자 부서</label></th>
								<td>${mberVO.chargerDept} / ${mberVO.chargerDeptEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 직위</label></th>
								<td>${mberVO.chargerOfcps} / ${mberVO.chargerOfcpsEng}</td>
								<th><label class="col-form-label">담당자 전화</label></th>
								<td>${mberVO.chargerTlphon}</td>
							</tr>						
							<tr>
								<th><label class="col-form-label">담당자 이메일</label></th>
								<td colspan="3">${mberVO.chargerEmail}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">제조업 여부</label></th>
								<td>
									<label class="form-check-label"><form:radiobutton path="mfcrtrYn" value="Y" /> 제조업&nbsp;</label>
									<label class="form-check-label"><form:radiobutton path="mfcrtrYn" value="N" /> 미제조업</label>
								</td>
								<th><label class="col-form-label">중소기업여부</label></th>
								<td>
									<label class="form-check-label"><form:radiobutton path="smlpzYn" value="Y" /> 중소기업&nbsp;</label>
									<label class="form-check-label"><form:radiobutton path="smlpzYn" value="N" /> 기타</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- } 입력양식 끝 -->
				
				<!-- 제목 시작 { -->
				<!-- div class="my-3  border-bottom border-color-2" >
					<h5 class="" ><span class="text-secondary" ><i class="far fa-list-alt"></i> 제품 및 기타정보</h5>
				</div -->
				<h5 class="content-title mt-4" ><i class="far fa-list-alt"></i> 제품 및 기타정보</h5>
				<!-- } 제목끝 -->

				<!-- 입력양식 시작 { -->
				<div>
					<table class="table table-bordered table-sm" >
						<colgroup>
							<col width="15%" />
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="4"><label class="col-form-label" rowspan="4">제품소개</label></th>
								<th><label class="col-form-label">메인제품(국문)</label></th>
								<td colspan="3" >${mberVO.mainPrduct}</td>
							</tr>
							<tr>
								<th ><label class="col-form-label">메인제품(영문)</label></th>
								<td colspan="3" >${mberVO.mainPrductEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">특허/인증</label></th>
								<td colspan="3" >${mberVO.patentCrtfc}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">주요거래처</label></th>
								<td colspan="3" >${mberVO.mainBcnc}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">제품사진첨부</label></th>
								<td colspan="4" ><img src="/komeaUpload/"${mberVO.fileNm}/></td>
							</tr>
							<tr>
								<th><label class="col-form-label">기타첨부</label></th>
								<td colspan="4" ><img src="/komeaUpload/"${mberVO.fileNm2}/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 기업회원 입력양식 끝 -->
			</c:when>
			<c:otherwise><!-- 기타 -->
				<!-- 기타회원 입력양식 시작 -->
				<div>
					<table class="table table-bordered table-sm" >
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th><label class="col-form-label">기업유형</label></th>
								<td colspan="3" >${mberVO.ssbypNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">승인</label></th>
								<td>${mberVO.sbscrbConfmYn}</td>
								<th><label class="col-form-label">등급현황</label></th>
								<td>${mberVO.compLevelNm}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">상호명</label></th>
								<td>${mberVO.cmpnyNm}</td>
								<th><label class="col-form-label">상호명 영문</label></th>
								<td>${mberVO.cmpnyNmEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표자</label></th>
								<td colspan="3" >
									${mberVO.rprsntv}
								</td>
							</tr>
							<tr>
								<th><label class="col-form-label">대표전화</label></th>
								<td>${mberVO.telno}</td>
								<th><label class="col-form-label">팩스</label></th>
								<td>${mberVO.fax}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">사업자등록번호</label></th>
								<td colspan="3" >
									${mberVO.bizNum}
								</td>
							</tr>
							<tr>
								<th><label class="col-form-label">아이디</label></th>
								<td>${mberVO.id}</td>
								<th><label class="col-form-label">이메일</label></th>
								<td>${mberVO.reprsntEmail}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 이름</label></th>
								<td>${mberVO.chargerNm} / ${mberVO.chargerNmEng}</td>
								<th><label class="col-form-label">담당자 부서</label></th>
								<td>${mberVO.chargerDept} / ${mberVO.chargerDeptEng}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 직책</label></th>
								<td>${mberVO.chargerOfcps}</td>
								<th><label class="col-form-label">담당자 연락처</label></th>
								<td>${mberVO.chargerTlphon}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">담당자 휴대폰</label></th>
								<td>${mberVO.chargerHp}</td>
								<th><label class="col-form-label">담당자 이메일</label></th>
								<td>${mberVO.chargerEmail}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">소재지</label></th>
								<td colspan="3">
									${mberVO.locplc}<br/>
									${mberVO.locplcEng}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- } 입력양식 끝 -->
				
				<!-- 제목 시작 { -->
				<!-- div class="my-3  border-bottom border-color-2" >
					<h5 class="" ><span class="text-secondary" ><i class="far fa-list-alt"></i> 제품 및 기타정보</h5>
				</div -->
				<h5 class="content-title mt-4" ><i class="far fa-list-alt"></i> 제품 및 기타정보</h5>
				<!-- } 제목끝 -->

				<!-- 입력양식 시작 { -->
				<div>
					<table class="table table-bordered table-sm" >
						<colgroup>
							<col width="15%" />
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="4"><label class="col-form-label" rowspan="4">제품소개</label></th>
								<th><label class="col-form-label">주요업무</label></th>
								<td colspan="3" >${mberVO.mainSkll}</td>
							</tr>
							<tr>
								<th ><label class="col-form-label">기타사항</label></th>
								<td colspan="3" >${mberVO.etcMatter}</td>
							</tr>
							<tr>
								<th><label class="col-form-label">회사소개서</label></th>
								<td colspan="4" ><img src="/komeaUpload/"${mberVO.fileNm}/></td>
							</tr>
							<tr>
								<th><label class="col-form-label">제무제표</label></th>
								<td colspan="4" ><img src="/komeaUpload/"${mberVO.fileNm2}/></td>
							</tr>
							<tr>
								<th><label class="col-form-label">기타첨부(선택)</label></th>
								<td colspan="4" ><img src="/komeaUpload/"${mberVO.fileNm3}/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 기타회원 입력양식 끝 -->
			</c:otherwise>
		</c:choose>

		
	    <!-- 버튼 시작 { -->
	    <div class="clearfix mb-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/mberList.do'/>" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <!--<a href="<c:url value='/admin/mberEdit.do'/>" class="btn btn-sm btn-primary text-white" >수정</a>-->
	            <a href="javascript:fn_UpdatePasswrod();" class="btn btn-sm btn-secondary text-white" >비밀번호 초기화</a>
	            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary text-white">회원삭제</a>
	        </div>
	    </div>
	    <!-- } 버튼 끝 -->

	</form:form>

</div><!-- div class="container_fluid" -->
</div><!-- div class="content" -->

<!-- //######################################## } content 영역 끝 -->

<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>
