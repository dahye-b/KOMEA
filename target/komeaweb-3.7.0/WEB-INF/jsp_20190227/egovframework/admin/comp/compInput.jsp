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
function fn_Save() {
	var obj1 = $('#company').val();
	var obj2 = $('#ceo').val();
	var obj3 = $('#tel').val();
	var obj4 = $('#area').val();
	
	$.ajax({
		url : "/admin/InsertComp.do", 
		type : "POST",  
		data : "company="+obj1+"&ceo="+obj2+"&tel="+obj3+"&area="+obj4,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("조합원사를 등록 하였습니다.");
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
<form:form name="Form" commandName="comp" method="post">

<div class="content">
<div class="container_fluid">

	<div class="page-header"> 
		<h3>조합원사<small>신규입력</small></h3>
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
						<th>업체명</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="company" name="company" id="company" value=""/>
						</td>
					</tr>
					<tr>
						<th>대표</th>
						<td colspan="3">
							<form:input type="text" class="form-control" path="ceo" name="ceo" id="ceo" value=""/>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<form:input type="text" class="form-control" path="tel" name="tel" id="tel" value=""/>
						</td>
						<th>지역</th>
						<td>
							<form:select path="area" class="form-control form-control-sm">
								<form:option value="" label="국내지역선택"/>
								<form:option value="SU" label="서울"/>
								<form:option value="IN" label="인천"/>
								<form:option value="GN" label="경기도"/>
								<form:option value="GG" label="강원도"/>
								<form:option value="CB" label="층청북도"/>
								<form:option value="CN" label="충청남도"/>
								<form:option value="GW" label="대전"/>
								<form:option value="DE" label="대구"/>
								<form:option value="JB" label="전라북도"/>
								<form:option value="JN" label="전라남도"/>
								<form:option value="GZ" label="광주"/>
								<form:option value="KP" label="경상북도"/>
								<form:option value="KN" label="경상남도"/>
								<form:option value="BS" label="부산"/>
								<form:option value="JJ" label="제주도"/>
								<form:option value="US" label="울산"/>
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
	            <a href="javascript:fn_Save();" class="btn btn-sm btn-primary text-white">저장</a>
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