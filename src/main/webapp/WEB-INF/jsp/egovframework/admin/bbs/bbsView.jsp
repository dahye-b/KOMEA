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
function fn_List(){
	document.Form.action = "<c:url value='/admin/bbsList.do'/>";
	document.Form.submit();
}
function fn_Edit(){
	document.Form.action = "<c:url value='/admin/bbsEdit.do'/>";
	document.Form.submit();
}
function fn_Delete(){
	document.Form.action = "<c:url value='/admin/DeleteBoard.do'/>";
	document.Form.submit();
}
function fn_downloadFile(obj1, obj2){
	document.Form.idx.value = obj1;
	document.Form.fNo.value = obj2;
	document.Form.action = "<c:url value='/komea/bbs/downloadFile.do'/>";
	document.Form.submit();
}
function fn_copyUrl(){
	var url = "http://www.komea.kr/koema/BbsPopup.do?";
		url = url + "bCode="+$('#bCode').val();
		url = url + "&idx="+$('#idx').val();
		url = url + "&block="+$('#block').val();
		url = url + "&rlevel="+$('#rlevel').val();
		url = url + "&boss="+$('#boss').val();

	$('#copyUrl').val(url); 
	$('#copyUrl').select();

	try { 
		var successful = document.execCommand('copy'); 
		alert('클립보드에 주소가 복사되었습니다. Ctrl + V 로 붙여넣기 하세요.'); 
	} catch (err) { 
		alert('이 브라우저는 지원하지 않습니다.') 
	}
}
</script>
<form:form name="Form" commandName="bbs" method="post"> <!-- enctype="multipart/form-data" -->
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value=""/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	<form:input type="hidden" path="fNo" name="fNo" id="fNo" value=""/>


<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>게시판관리<small>상세보기</small></h3>
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
							<c:if test="${bbs.bCode eq 'B013'}">[ 거점기지 산업동향 정보 ]</c:if>
							<c:if test="${bbs.bCode eq 'B014'}">[ 거점기지 프로젝트 정보 ]</c:if>
							<c:if test="${bbs.bCode eq 'B015'}">[ 글로벌인증소식(api) ]</c:if>
							</strong>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><c:out value="${bbs.title}" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><c:out value="${bbs.uName}" /></td>
						<th>공지글</th>
						<td>
							<form:select path="noticOn" class="form-control" readonly="true">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
					</tr>
					<!-- 
					<tr>
						<th>메인뷰</th>
						<td>
							<form:select path="mainOn" class="form-control" readonly="true">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
						<th>통합검색 노출</th>
						<td>
							<form:select path="secretOn" class="form-control" readonly="true">
								<form:option value="0" label="미설정"/>
								<form:option value="1" label="설정"/>
							</form:select>
						</td>
					</tr>
					<tr>
						<th>링크</th>
						<td colspan="3" ><!----
							<form:input type="text" path="linkOn" name="linkOn" id="linkOn" value=""/>
							<input type="checkbox" class="form-check-input" value=""> 새창에서 열림
						</td>
					</tr>
					 -->
					<tr>
						<th>링크복사</th>
						<td colspan="3" >
							<button type="button" class="btn btn-sm btn-secondary" id="copy_link" onClick="javascript:fn_copyUrl();">링크복사</button>
							<input type="text" name="copyUrl" id="copyUrl" value="" size="90" readonly/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><c:out value="${bbs.contents}"  escapeXml="false" /></td>
					</tr>
						<c:choose>
							<c:when test="${fn:length(uploadFileList) > 0}">
								<c:forEach var="uploadFileList" items="${uploadFileList}" varStatus="status">
									<tr>
										<th>첨부파일</th>
										<td colspan="3" >
											<a href="javascript:fn_downloadFile(${uploadFileList.gulIdx},${uploadFileList.fNo});" title="<c:out value="${uploadFileList.fNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${uploadFileList.fNm}" /> <span class="text-muted" >(Size:${uploadFileList.fSize})</span></a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
									<tr>
										<th>첨부파일</th>
										<td colspan="3" >
											첨부파일이 없습니다.
										</td>
									</tr>
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