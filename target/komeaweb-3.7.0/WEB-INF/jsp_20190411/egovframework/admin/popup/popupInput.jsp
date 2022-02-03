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
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace('editorTextArea');
});
function fn_Save(){
	document.Form.contents.value=CKEDITOR.instances.editorTextArea.getData();
	document.Form.action = "<c:url value='/admin/InsertPopup.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="popup" method="post"> <!-- enctype="multipart/form-data" -->
<form:input type="hidden" path="insertUserId" name="insertUserId" id="insertUserId" value="${loginInfo.id}"/>
<form:input type="hidden" path="contents" name="contents" id="contents" value=""/>

<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>팝업관리<small>신규입력</small></h3>
	</div>
	<!-- 게시물 쓰기 시작 { -->

		<!-- 입력양식 시작 { -->
		<div >
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
							<label class="col-form-label">제목</label>
						</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="subject" name="subject" id="subject" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">시작일</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="startDt" name="startDt" id="startDt" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">종료일</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="endDt" name="endDt" id="endDt" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">가로</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="width" name="width" id="width" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">세로</label>
						</th>
						<td>
							<form:input type="text" class="form-control" path="height" name="height" id="height" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">설명</label>
						</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="description" name="description" id="description" value="" maxlength="100"/>
						</td>
					</tr>

					<tr>
						<th>
							<label class="col-form-label">내용</label>
						</th>
						<td colspan="3" >
							<textarea id="editorTextArea" class="i_text txt_box" title="텍스트입력" rows="10" cols="1" required ></textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">게시여부</label>
						</th>
						<td colspan="3">
							<form:select class="form-control form-control-sm mr-1" path="openYn">
								<form:option value="" label="--- 선택 ---"/>
								<form:option value="Y" label="게시"/>
								<form:option value="N" label="미게시"/>
							</form:select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- } 입력양식 끝 -->

	    <!-- 게시물 상단 버튼 시작 { -->
	    <div class="clearfix mb-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/popupList.do'/>" class="btn btn-sm btn-secondary text-white">목록</a>
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