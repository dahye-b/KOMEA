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
	document.Form.action = "<c:url value='/admin/InsertExbi.do'/>";
	document.Form.submit();
}
</script>
<form:form name="Form" commandName="exbi" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->

<div class="content">
<div class="container_fluid">

		<div class="page-header"> 
			<h3>사업관리</h3>
		</div>
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">자료실</li>
			</ol>
		</nav>


	<!-- 게시물 쓰기 시작 { -->
		<h5><!-- i class="fas fa-list-ol"></i -->사업 등록 <small class="small font-weight-light text-muted" >사업등록 화면 입니다.</small></h5>

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
						<td colspan="3">
							<form:input type="text" class="form-control" path="bannerGb" name="bannerGb" id="bannerGb" value="" maxlength="100"/>
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
							<form:input type="text" class="form-control" path="bannerUseYn" name="bannerUseYn" id="bannerUseYn" value="" maxlength="100"/>
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