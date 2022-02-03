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
	if(document.Form.bannerFile.value==""){
		alert("배너파일을 선택 하세요.");
		document.Form.bannerFile.focus();
		return;
	}
	if(document.Form.bannerUseYn.value==""){
		alert("배너사용유무를 선택 하세요.");
		document.Form.bannerUseYn.focus();
		return;
	}
	if(document.Form.bannerLink.value==""){
		alert("배너링크를 입력 하세요.");
		document.Form.bannerLink.focus();
		return;
	}
	document.Form.action = "<c:url value='/admin/InsertBanner.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="banner" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->

<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>배너관리<small>신규입력</small></h3>
	</div>

	<!-- 게시물 쓰기 시작 { -->

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
							<label class="col-form-label">배너구분</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="bannerGb" name="bannerGb" id="bannerGb" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">정렬순서</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="bannerSort" name="bannerSort" id="bannerSort" value="" maxlength="10"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">배너</label>
						</th>
						<td colspan="3">
							<input type="file" name="bannerFile" id="bannerFile"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">배너설명</label>
						</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="bannerDesc" name="bannerDesc" id="bannerDesc" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">사용여부</label>
						</th>
						<td>
							<form:select class="form-control form-control-sm mr-1" path="bannerUseYn">
								<form:option value="" label="--- 선택 ---"/>
								<form:option value="Y" label="사용"/>
								<form:option value="N" label="사용안함"/>
							</form:select>
						</td>
						<th>
							<label class="col-form-label">링크</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="bannerLink" name="bannerLink" id="bannerLink" value="" maxlength="100"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- } 입력양식 끝 -->

	    <!-- 게시물 상단 버튼 시작 { -->
	    <div class="clearfix mb-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/bannerList.do'/>" class="btn btn-sm btn-secondary text-white">목록</a>
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