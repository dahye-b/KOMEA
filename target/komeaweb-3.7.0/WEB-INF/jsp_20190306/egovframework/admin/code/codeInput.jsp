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
function fn_Save(){
	if(document.Form.cdDec.value==""){
		alert("코드대분류를 입력 하세요.");
		document.Form.cdDec.focus();
		return;
	}
	if(document.Form.cdItem.value==""){
		alert("코드소분류를 입력 하세요.");
		document.Form.cdItem.focus();
		return;
	}
	document.Form.action = "<c:url value='/admin/InsertCode.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="code" method="post"> <!-- enctype="multipart/form-data" -->

<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>공통코드관리<small>신규입력</small></h3>
	</div>
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
							<label class="col-form-label">대분류(컬럼명)</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdDec" name="cdDec" id="cdDec" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">소분류(코드값)</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdItem" name="cdItem" id="cdItem" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">코드명</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdKor" name="cdKor" id="cdKor" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">정렬</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="sortOrder" name="sortOrder" id="sortOrder" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">사용여부</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="useYn" name="useYn" id="useYn" value="Y" readonly="true"/>
						</td>
						<th>
							<label class="col-form-label">코드참조1</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdRef1" name="cdRef1" id="cdRef1" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">코드참조2</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdRef2" name="cdRef2" id="cdRef2" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">코드참조3</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="cdRef3" name="cdRef3" id="cdRef3" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">숫자참조1</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="numRef1" name="numRef1" id="numRef1" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">숫자참조2</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="numRef2" name="numRef2" id="numRef2" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">숫자참조3</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="numRef3" name="numRef3" id="numRef3" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">비고</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="remarks" name="remarks" id="cmpnyNm" value="" maxlength="100"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- } 입력양식 끝 -->

	    <!-- 게시물 상단 버튼 시작 { -->
	    <div class="clearfix mb-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/codeList.do'/>" class="btn btn-sm btn-secondary text-white">목록</a>
	            <a href="javascript:fn_Save();" class="btn btn-sm btn-primary text-white">저장</a>
	        </div>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->


	<!-- } 게시판 쓰기 끝 -->

</div>

						</div><!-- div class="content" -->
<!-- //######################################## } content 영역 끝 -->


				</div>
		</div>
		
</form:form>
				</div>
		</div>

<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>