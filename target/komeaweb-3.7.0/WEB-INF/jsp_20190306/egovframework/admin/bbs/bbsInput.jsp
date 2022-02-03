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
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace('editorTextArea');
});
function fn_Save() {
	
	if(document.Form.bCode.value == ""){
		alert("게시판구분을 선택하세요.");
		return;
	}
	
	if(document.Form.title.value == ""){
		alert("제목을 입력하세요.");
		return;
	}
	
	document.Form.contents.value=CKEDITOR.instances.editorTextArea.getData();
	document.Form.action = "<c:url value='/admin/InsertBoard.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="bbs" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	
	<form:input type="hidden" path="contents" name="contents" id="contents" value=""/>

<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>게시판관리<small>신규입력</small></h3>
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
						<th>구분</th>
						<td colspan="3">
							<form:select class="form-control form-control-sm mr-1" path="bCode">
								<form:option value="" label="--- 게시판선택 ---"/>
								<form:option value="B001" label="공지사항"/>
								<form:option value="B002" label="간행물"/>
								<form:option value="B007" label="Komea뉴스레터"/>
								<form:option value="B008" label="Komea영문뉴스레터"/>
								<form:option value="B009" label="보도자료"/>
								<form:option value="B010" label="사업공고"/>
								<form:option value="B011" label="뉴스(국문)"/>
								<form:option value="B012" label="News(영문)"/>
							</form:select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="title" name="title" id="title" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<form:input type="text" class="form-control" path="uName" name="uName" id="uName" value="${loginInfo.id}" maxlength="100"/>
						</td>
						<th>공지글</th>
						<td>
							<form:select path="noticOn" class="form-control">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
					</tr>
					<!-- 
					<tr>
						<th>메인뷰</th>
						<td>
							<form:select path="mainOn" class="form-control">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
						<th>통합검색 노출</th>
						<td>
							<form:select path="secretOn" class="form-control">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
					</tr>
					<tr>
						<th>링크</th>
						<td colspan="3" >
						<!--
							<form:input type="text" path="linkOn" name="linkOn" id="linkOn" value=""/>
							<input type="checkbox" class="form-check-input" value=""> 새창에서 열림
						</td>
					</tr>
					<tr>
						<th>최하보기권한</th>
						<td colspan="3" >
						</td>
					</tr>
					 -->
					<tr>
						<th>내용</th>
						<td colspan="3" >
							<textarea id="editorTextArea" class="i_text txt_box" title="텍스트입력" rows="10" cols="1" required ></textarea>
						</td>
					</tr>
					<tr>
						<th>파일1</th>
						<td colspan="3" >
							<input type="file" class="form-control-file" name="file1" id="file1" placeholder="파일 선택" />
						</td>
					</tr>
					<tr>
						<th>파일2</th>
						<td colspan="3" >
							<input type="file" class="form-control-file" name="file2" id="file2" placeholder="파일 선택" />
						</td>
					</tr>
					<tr>
						<th>파일3</th>
						<td colspan="3" >
							<input type="file" class="form-control-file" name="file3" id="file3" placeholder="파일 선택" />
						</td>
					</tr>
					<tr>
						<th>파일4</th>
						<td colspan="3" >
							<input type="file" class="form-control-file" name="file4" id="file4" placeholder="파일 선택" />
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
	            <a href="javascript:fn_Save(this);" class="btn btn-sm btn-primary text-white">저장</a>
	        </div>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->


	<!-- } 게시판 쓰기 끝 -->

</div>

						</div><!-- div class="content" -->
<!-- //######################################## } content 영역 끝 -->
</form:form>

				</div>
		</div>
<jsp:include page="/WEB-INF/include/admin-tail.html" flush="true"></jsp:include>