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
function fn_Update(){
	document.Form.action = "<c:url value='/admin/UpdateBuyer.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="buyerVO" method="post"> <!-- enctype="multipart/form-data" -->
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="buyerCd" name="buyerCd" id="buyerCd" value=""/>
<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>바이어관리<small>수정</small></h3>
		</div>

		<!-- 게시물 읽기 시작 { -->

	    <!-- 버튼 시작 { -->
	    <h6 class="d-none">버튼</h6>
	    <div class="clearfix my-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/buyerList.do'/>" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <a href="javascript:fn_Update(this);" class="btn btn-sm btn-primary text-white">저장</a>
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
						<td colspan="3">
							<form:select class="form-control form-control-sm" path="nationNm" id="nationNm" name="nationNm">
								<c:forEach var="comboBox" items="${comboBox}" varStatus="status">
									<form:option value="${comboBox.data}"><c:out value="${comboBox.label}" /></form:option>
								</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">업체명</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="entrpsNm" name="entrpsNm" id="entrpsNm" value=""/>
						</td>
						<th>
							<label class="col-form-label">대표자</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="rprsntv" name="rprsntv" id="rprsntv" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">구분</label>
						</th>
						<td colspan="3">
							<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Shipowner" /> Shipowner</label>
							<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Shipyard" /> Shipyard</label>
							<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Trading" /> Trading</label>
							<label class="form-check-label mr-20"><form:radiobutton path="gb" value="Etc" /> Etc</label>
							<form:input type="text" path="gbEtcDesc" id="gbEtcDesc" name="gbEtcDesc" class="form-control" style="width: 322px !important;" placeholder="구분이 Etc 선택시입력하세요" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">주소</label>
						</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="adres" name="adres" id="adres" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">연락처</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cttpc" name="cttpc" id="cttpc" value=""/>
						</td>
						<th>
							<label class="col-form-label">종업원</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="employeeCn" name="employeeCn" id="employeeCn" value="0"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">팩스</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="fax" name="fax" id="fax" value=""/>
						</td>
						<th>
							<label class="col-form-label">연간매출액($)</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="yearSales" name="yearSales" id="yearSales" value="0"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">홈페이지</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="hmpg" name="hmpg" id="hmpg" value=""/>
						</td>
						<th>
							<label class="col-form-label">대표메일</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="email" name="email" id="email" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자명</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="chargerNm" name="chargerNm" id="chargerNm" value=""/>
						</td>
						<th>
							<label class="col-form-label">담당자연락처</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="chargerCttpc" name="chargerCttpc" id="chargerCttpc" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자부서</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="chargerDept" name="chargerDept" id="chargerDept" value=""/>
						</td>
						<th>
							<label class="col-form-label">담당자직책</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="chargerOfcps" name="chargerOfcps" id="chargerOfcps" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자이메일</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="chargerEmail" name="chargerEmail" id="chargerEmail" value=""/>
						</td>
						<th>
							<label class="col-form-label">행사참가이력</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="partcptnEvent" name="partcptnEvent" id="partcptnEvent" value=""/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">주요서비스</label>
						</th>
						<td colspan="3">
							<textarea class="form-control form-control-sm" name="mainSrvc" id="mainSrvc" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">회사소개</label>
						</th>
						<td colspan="3">
							<textarea class="form-control form-control-sm" name="buyerIntro" id="buyerIntro" rows="3"></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">관심품목</label>
						</th>
						<td colspan="3">
							<textarea class="form-control form-control-sm" name="interestItem" id="interestItem" rows="3"></textarea>
						</td>
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