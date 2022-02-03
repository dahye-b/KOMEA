<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
});
function fn_Insert(){
	var fm = document.Form;
	
	if(fm.title.value == ""){
		alert("제목을 입력하세요.");
		fm.title.focus();
		return;
	}
	
	if(fm.title.value == ""){
		alert("제목을 입력하세요.");
		fm.title.focus();
		return;
	}
	
	if(fm.email.value == ""){
		alert("이메일을 입력하세요.");
		fm.email.focus();
		return;
	}
	
	if(fm.tel.value == ""){
		alert("연락처를 입력하세요.");
		fm.tel.focus();
		return;
	}
	if(fm.contents.value == ""){
		alert("내용을 입력하세요.");
		fm.contents.focus();
		return;
	}
	if(fm.password.value == ""){
		alert("비밀번호를 입력하세요.");
		fm.password.focus();
		return;
	}
	
	document.Form.action = "<c:url value='/komea/bbs/InsertQnaBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="toDay"/>
<form:form name="Form" commandName="bbs" method="post">
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
								<form:input type="text" class="form-control" path="name" name="name" id="name" value="GUEST"/>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label class="col-form-label required" >이메일</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" class="form-control" path="email" name="email" id="email" value=""/>
							</div>
							<div class="col-md-2 fth">
								<label class="col-form-label required" >연락처</label>
							</div>
							<div class="col-md-4">
								<form:input type="text" class="form-control" path="tel" name="tel" id="tel" value=""/>
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
						<div class="bo-w-row row">
							<div class="col-md-2 fth required">
								<label class="col-form-label" >비밀번호</label>
							</div>
							<div class="col-md-10">
								<form:input type="password" class="form-control" path="password" name="password" id="password" value=""/>
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