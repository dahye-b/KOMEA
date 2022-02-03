<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//제목
	$('#title').val('Re : ${bbs.title}');
	//내용
	$('#contents').val('\n\n\n[ Original Message ]\n${bbs.contents}');
});
function fn_Insert(){
	var fm = document.Form;
	
	if(fm.contents.value == ""){
		alert("내용을 입력하세요.");
		fm.contents.focus();
		return;
	}
	
	document.Form.action = "<c:url value='/komea/bbs/InsertQnaReplyBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="gulIdx" name="gulIdx" id="gulIdx" value=""/>
	<form:input type="hidden" path="srsn" name="srsn" id="srsn" value=""/>
	<form:input type="hidden" path="password" name="password" id="password" value=""/>

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
								<label class="col-form-label required" >제목</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" class="form-control" path="title" name="title" id="title" value="" maxlength="100"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label" >작성자</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" class="form-control" path="name" name="name" id="name" value="관리자"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth required">
									<label for="title" class="col-form-label" >내용</label>
							</div>
							<div class="col-md-10">
								<textarea class="form-control" name="contents" id="contents" rows="10"></textarea>
							</div>
						</div>
					</div><!-- div class="container" -->

				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
							<a class="btn btn-sm btn-primary" href="javascript:fn_Insert()" title="등록" >등록</a>
							<a class="btn btn-sm btn-secondary" href="<c:url value='/komea/bbs/QnaList.do'/>" title="목록" >목록</a>
				        </div>
				    </div>

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>