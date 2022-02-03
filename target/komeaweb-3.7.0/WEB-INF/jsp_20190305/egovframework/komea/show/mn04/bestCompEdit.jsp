<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace('editorTextArea');
});
function fn_Update(){
	document.Form.cn.value=CKEDITOR.instances.editorTextArea.getData();
	document.Form.action = "<c:url value='/show/InfoCenter/UpdateBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="show" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="bbsTy" name="bbsTy" id="bbsTy" value="6"/>
	<form:input type="hidden" path="registNo" name="registNo" id="registNo" value=""/>
	<form:input type="hidden" path="updateUserId" name="updateUserId" id="updateUserId" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="wrter" name="wrter" id="wrter" value="${loginInfo.mberCd}"/>
	<form:input type="hidden" path="writngDe" name="writngDe" id="writngDe" value="${toDay}"/>
	
	<form:input type="hidden" path="cn" name="cn" id="cn" value=""/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>우수기업선정</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-w">

					<!-- 게시판 edit시작 { -->
					<div class="container">
						<div class="bo-w-row border-top-3 row">
							<div class="col-md-2 fth">
								<label for="title" class="col-form-label" >제목</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" path="sj" name="sj" id="title" value="" class="form-control" placeholder="제목" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >작성자</label>
							</div>
							<div class="col-md-10">${loginInfo.id}
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >첨부파일</label>
							</div>
							<div class="col-md-10">
									<input type="file" class="form-control-file" name="atchFileNm" id="atchFileNm" placeholder="파일 선택" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
									<label for="title" class="col-form-label" >내용</label>
							</div>
							<div class="col-md-10">
								<textarea id="editorTextArea" class="i_text txt_box" title="텍스트입력" rows="10" cols="1" required >${show.cn}</textarea>
							</div>
						</div>
					</div><!-- div class="container" -->

				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
							<a class="btn btn-sm btn-primary" href="javascript:fn_Update();" title="저장" >저장</a>
							<a href="<c:url value='/show/InfoCenter/List.do?bbsTy=${show.bbsTy}'/>" class="btn btn-sm btn-secondary" >목록</a>
				        </div>
				    </div>

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>