<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_PwCheck(){
	var obj1 = $('#idx').val();
	var obj2 = $('#gulIdx').val();
	var obj3 = $('#srsn').val();

	var pw = $('#pw').val();

	$.ajax({
		url : "/komea/bbs/PwCheck.do",
		type : "POST",
		data : "idx="+obj1+"&gulIdx="+obj2+"&srsn="+obj3,
		success : function(data) {
			console.log(data);
			var resultData = data.data;
			if(pw == resultData.password){
				document.Form.action = "<c:url value='/komea/bbs/QnaView.do'/>";
				document.Form.submit();
			}else{
				alert("비밀글 비밀번호가 틀립니다.");
				document.Form.pw.value="";
				document.Form.pw.focus();
				return;
			}
		}
	});
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="gulIdx" name="gulIdx" id="gulIdx" value=""/>
	<form:input type="hidden" path="srsn" name="srsn" id="srsn" value=""/>

    <!-- ##### Board View Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
					<h2>열린제안</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-w">
            		
            		<div class="container mt-30 mb-30" >

			    		<!-- 버튼 시작 { -->
					    <!-- div class="clearfix mb-10" >
					        <div class="btn-group btn-group-justified float-right">
					            <a href="<c:url value='/komea/bbs/QnaList.do'/>" class="btn btn-sm btn-secondary" >목록</a>
					        </div>
					    </div -->
					    <!-- } 버튼 끝 -->

					    <!-- 제목 시작 { -->
					    <div class="bo-w-pass">
						    <div class="border-top-3 text-center" >
							    	<p class="py-30">이 글은 비밀글 입니다. 비밀번호를 입력하여 주세요.</p>
						    </div>
						    <div class="form-group row" >
							    <label class="col-sm-4 control-label" for="pw">&dot; 비밀번호</label>
								<div class="col-sm-6">
									<input type="password" class="form-control form-control-sm" name="pw" id="pw" value="" required="" />
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-block btn-sm btn-primary" onclick="javascript:fn_PwCheck();" >확인</button>
								</div>
						    </div>
						</div>
					    <!-- } 제목끝 -->

			    		<!-- 버튼 시작 { -->
					    <div class="mt-10" >
					        <div class="btn-group btn-group-justified float-right">
					            <a href="<c:url value='/komea/bbs/QnaList.do'/>" class="btn btn-sm btn-secondary" >목록</a>
					        </div>
					    </div>
					    <!-- } 버튼 끝 -->
					    
					</div>

				</div><!--// bo-w-->

			</div>
		</div>
   	</section>
    <!-- ##### Board View Section End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>