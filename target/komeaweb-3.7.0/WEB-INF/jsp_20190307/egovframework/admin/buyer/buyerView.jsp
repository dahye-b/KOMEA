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
			<jsp:include page="/WEB-INF/include/admin-menu.html" flush="true"></jsp:include>
<!-- //######################################## content 영역 시작 { -->
<script type="text/javascript">
function fn_List(){
	document.Form.action = "<c:url value='/admin/buyerList.do'/>";
	document.Form.submit();
}
function fn_Edit(){
	document.Form.action = "<c:url value='/admin/buyerEdit.do'/>";
	document.Form.submit();
}
function fn_Delete(){
	document.Form.action = "<c:url value='/admin/DeleteBuyer.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="buyer" method="post"> <!-- enctype="multipart/form-data" -->
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value="${buyerVO.buyerCd}"/>
<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>바이어관리<small>상세보기</small></h3>
		</div>


		<!-- 게시물 읽기 시작 { -->

	    <!-- 버튼 시작 { -->
	    <h6 class="d-none">버튼</h6>
	    <div class="clearfix my-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="javascript:fn_List();" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <a href="javascript:fn_Edit();" class="btn btn-sm btn-primary text-white" >수정</a>
	            <a href="javascript:fn_Delete();" class="btn btn-sm btn-primary text-white">삭제</a>
	        </div>
	    </div>
	    <!-- } 버튼 끝 -->

		<!-- 입력양식 시작 { -->
		<div >
			<table class="table table-form table-sm" >
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>
							<label class="col-form-label">국가</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.nationNm}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">업체명</label>
						</th>
						<td><c:out value="${buyerVO.entrpsNm}" /></td>
						<th>
							<label class="col-form-label">대표자</label>
						</th>
						<td><c:out value="${buyerVO.rprsntv}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">구분</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.gb}" /> (<c:out value="${buyerVO.gbEtcDesc}" />)</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">주소</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.adres}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">연락처</label>
						</th>
						<td><c:out value="${buyerVO.cttpc}" /></td>
						<th>
							<label class="col-form-label">종업원</label>
						</th>
						<td><fmt:formatNumber value="${buyerVO.employeeCn}" type="number"/> 명</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">팩스</label>
						</th>
						<td><c:out value="${buyerVO.fax}" /></td>
						<th>
							<label class="col-form-label">연간매출액($)</label>
						</th>
						<td><fmt:formatNumber value="${buyerVO.yearSales}" type="number"/></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">홈페이지</label>
						</th>
						<td><c:out value="${buyerVO.hmpg}" /></td>
						<th>
							<label class="col-form-label">대표메일</label>
						</th>
						<td><c:out value="${buyerVO.email}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자명</label>
						</th>
						<td><c:out value="${buyerVO.chargerNm}" /></td>
						<th>
							<label class="col-form-label">담당자연락처</label>
						</th>
						<td><c:out value="${buyerVO.chargerCttpc}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자부서</label>
						</th>
						<td><c:out value="${buyerVO.chargerDept}" /></td>
						<th>
							<label class="col-form-label">담당자직책</label>
						</th>
						<td><c:out value="${buyerVO.chargerOfcps}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자이메일</label>
						</th>
						<td><c:out value="${buyerVO.chargerEmail}" /></td>
						<th>
							<label class="col-form-label">행사참가이력</label>
						</th>
						<td><c:out value="${buyerVO.partcptnEvent}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">주요서비스</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.mainSrvc}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">회사소개</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.buyerIntro}" /></td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">관심품목</label>
						</th>
						<td colspan="3"><c:out value="${buyerVO.interestItem}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- } 입력양식 끝 -->
</div>
</div><!-- div class="content" -->
<!-- //######################################## } content 영역 끝 -->

</form:form>
		</div>
</div>
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>