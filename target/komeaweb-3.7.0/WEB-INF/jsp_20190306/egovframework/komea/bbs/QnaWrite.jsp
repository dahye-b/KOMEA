<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace('editorTextArea');
});
function fn_Insert(){
	document.Form.cn.value=CKEDITOR.instances.editorTextArea.getData();
	document.Form.action = "<c:url value='/show/InfoCenter/InsertBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="bbs" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	
	<form:input type="hidden" path="contents" name="contents" id="contents" value=""/>
    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>열린제안</h2>
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
								<form:input type="text" class="form-control" path="title" name="title" id="title" value="" maxlength="100"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >첨부파일</label>
							</div>
							<div class="col-md-10">
								<input type="file" class="form-control-file" name="file1" id="file1" placeholder="파일 선택" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
									<label for="title" class="col-form-label" >내용</label>
							</div>
							<div class="col-md-10">
								<textarea id="editorTextArea" class="i_text txt_box" title="텍스트입력" rows="10" cols="1" required ></textarea>
							</div>
						</div>
					</div><!-- div class="container" -->

				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
							<a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="등록" >등록</a>
							<a class="btn btn-sm btn-secondary" href="<c:url value='/show/InfoCenter/List.do'/>" title="목록" >목록</a>
				        </div>
				    </div>

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>