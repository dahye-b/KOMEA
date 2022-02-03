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
	//CKEDITOR.instances.editorTextArea.setData();
});
function fn_Update(elClickedObj) {
	
	if(document.Form.bCode.value == ""){
		alert("게시판구분을 선택하세요.");
		return;
	}
	
	if(document.Form.title.value == ""){
		alert("제목을 입력하세요.");
		return;
	}
	
	document.Form.contents.value=CKEDITOR.instances.editorTextArea.getData();
	document.Form.action = "<c:url value='/admin/UpdateBoard.do'/>";
	document.Form.submit();
}
function fn_downloadFile(obj1, obj2){
	document.Form.idx.value = obj1;
	document.Form.fNo.value = obj2;
	document.Form.action = "<c:url value='/komea/bbs/downloadFile.do'/>";
	document.Form.submit();
}

//파일삭제처리
function fn_deleteFile(obj1, obj2){
	$.ajax({
		url : "/komea/bbs/deleteFile.do", 
		type : "POST",  
		data : "idx="+obj1+"&fNo="+obj2,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("첨부파일을 삭제 하였습니다.");
				location.reload();
			}
		},
		error:function(request,status,er){
			var errorMsg= "요청 도중 오류가 발생하였습니다.\n";
			
			if(request.status == 0){errorMsg+="네트워크 연결을 확인해주십시오.";}
			else if(request.status == 401){errorMsg+="권한이 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 403){errorMsg+="접근이 거부되었습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 404){errorMsg+="요청한 페이지를 찾을 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(request.status == 500){errorMsg+="서버 내 오류가 발생하였습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'parsererror'){errorMsg+="응답 본문을 정상적으로 가져올 수 없습니다.\n관리자에게 문의해주세요.";}
			else if(status == 'timeout'){errorMsg+="응답 제한 시간을 초과하였습니다. 다시 조회해 주세요";}
			else {errorMsg+="관리자에게 문의해주세요.";}
			alert(errorMsg);
		}
	});
}
</script>
<form:form name="Form" commandName="bbs" method="post" enctype="multipart/form-data"> <!--  -->
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value=""/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	<form:input type="hidden" path="fNo" name="fNo" id="fNo" value=""/>
	<form:input type="hidden" path="uName" name="uName" id="uName" value=""/>
	
	<form:input type="hidden" path="contents" name="contents" id="contents" value=""/>
<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>게시판관리<small>수정</small></h3>
		</div>

		<!-- 게시물 읽기 시작 { -->

	    <!-- 버튼 시작 { -->
	    <h6 class="d-none">버튼</h6>
	    <div class="clearfix my-3" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/bbsList.do'/>" class="btn btn-sm btn-secondary text-white" >목록</a>
	            <a href="javascript:fn_Update(this);" class="btn btn-sm btn-primary text-white">저장</a>
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
						<th>구분</th>
						<td colspan="3">
							<strong>
							<c:if test="${bbs.bCode eq 'B001'}">[ 공지사항 ]</c:if>
							<c:if test="${bbs.bCode eq 'B002'}">[ 간행물 ]</c:if>
							<c:if test="${bbs.bCode eq 'B007'}">[ 국문뉴스레터 ]</c:if>
							<c:if test="${bbs.bCode eq 'B008'}">[ 영문뉴스레터 ]</c:if>
							<c:if test="${bbs.bCode eq 'B009'}">[ 보도자료 ]</c:if>
							<c:if test="${bbs.bCode eq 'B010'}">[ 사업공고 ]</c:if>
							<c:if test="${bbs.bCode eq 'B011'}">[ 뉴스(국문) ]</c:if>
							<c:if test="${bbs.bCode eq 'B012'}">[ News(영문) ]</c:if>
							</strong>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<form:input type="text" path="title" name="title" id="title" value="" class="form-control" placeholder="제목" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><c:out value="${bbs.uName}" /></td>
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
							<textarea id="editorTextArea" class="i_text txt_box" title="텍스트입력" rows="10" cols="1" required >${bbs.contents}</textarea>
						</td>
					</tr>
					<c:choose>
						<c:when test="${fn:length(uploadFileList) > 0}">
							<c:forEach var="uploadFileList" items="${uploadFileList}" varStatus="status">
								<tr>
									<th>첨부파일</th>
									<td colspan="3" >
										<a href="javascript:fn_downloadFile(${uploadFileList.gulIdx},${uploadFileList.fNo});" title="<c:out value="${uploadFileList.fNm}" />" >
										<i class="fas fa-paperclip text-info"></i> <c:out value="${uploadFileList.fNm}" /> <span class="text-muted" >(Size:${uploadFileList.fSize})</span></a>
										<a href="javascript:fn_deleteFile(${uploadFileList.gulIdx},${uploadFileList.fNo});">삭제</a>
									</td>
								</tr>
								<c:forEach var="a" begin="1" end="${4-fCnt}" step="1">
									<tr>
										<th>파일${a}</th>
										<td colspan="3" >
											<input type="file" class="form-control-file" name="file${a}" id="file${a}" placeholder="파일 선택" />
										</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="a" begin="1" end="4" step="1">
							<tr>
								<th>파일${a}</th>
								<td colspan="3" >
									<input type="file" class="form-control-file" name="file${a}" id="file${a}" placeholder="파일 선택" />
								</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

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