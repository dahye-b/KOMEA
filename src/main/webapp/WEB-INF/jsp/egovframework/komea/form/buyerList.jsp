<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function buyerDetail(obj1){
	var auth_yn = "${authYn}";
	if(auth_yn == "Y"){
		$.ajax({
			url : "/show/SelectBuyerInfo.do",
			type : "POST",
			data : "buyerCd="+obj1,
			success : function(data) {
				console.log(data);
				var resultData = data.data;
				//alert("조회성공"+resultData.entrpsNm);

				var contents = '';
				 $("#detailTable").empty();
				 $("#buyerTitle").empty();
				 $("#buyerTitle").append(resultData.entrpsNm);

				contents += '<div class="bo-v-row border-top-3 row"><div class="col-md-4 fth" >국가<small>(contry)</small></div><div class="col-md-8">'+resultData.nationNm+'</div></div>';
				contents += '<div class="bo-v-row row"><div class="col-md-4 fth" >대표자<small>(Representative)</small></div><div class="col-md-8">'+resultData.chargerNm+'</div></div>';
				contents += '<div class="bo-v-row row"><div class="col-md-4 fth" >연매출<small>(Annual Sales)</small></div><div class="col-md-8">'+resultData.yearSales+' $</div></div>';
				contents += '<div class="bo-v-row row"><div class="col-md-4 fth" >홈페이지<small>(Website)</small></div><div class="col-md-8">'+resultData.hmpg+'</div></div>';
				contents += '<div class="bo-v-row row"><div class="col-md-4 fth" >회사소개<small>(Bussiness Scope)</small></div><div class="col-md-8">'+resultData.buyerIntro+'</div></div>';
				contents += '<div class="bo-v-row row"><div class="col-md-4 fth" >관심품목<small>(Interest Item)</small></div><div class="col-md-8">'+resultData.interestItem+'</div></div>';

				$("#detailTable").html(contents);

				$('#Modal2').modal('show');
			}
		});
	}else{
		alert("권한이 없습니다.");
		return;
	}
}
function fn_Delete(obj){
	
	var tmp1 = "${CnsltexhbRegistInfo.cnsltexhbCd}";
	
	$.ajax({
		url : "/show/DeleteBuyerInfo.do", 
		type : "POST",  
		data : "cnsltexhbCd="+tmp1+"&buyerCd="+obj,
		success : function(data) {
			var msg = data.msg;
			if(msg==="OK"){
				alert("삭제되었습니다.");
				window.location.reload();
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
function fn_Excel(){
	document.Form.action = "<c:url value='/show/BuyerListExcel.do'/>";
	document.Form.submit();
}
</script>

		<h5 class="mt-50"><i class="fas fa-align-left text-info"></i> 바이어리스트</h5>
		<div class="form-inline bo-search">
				<div class="form-group" >
					<a href="javascript:fn_Excel();" class="btn btn-sm btn-secondary btn-block text-white">바이어목록 엑셀저장</a>
				</div>
		</div>
		
		<div class="mb-10 bo-l" >
			 <table class="table table-bordered border-top-1 table-hover" summary="지난행사 상세보기" >
				<caption class="d-none" >참가업체 모집개요</caption>
				<thead>
					<tr>
						<th class="w-5 td-no">No</th>
						<th class="w-20 td-writer">국가</th>
						<th class="w-30 td-subject">업체명</th>
						<th class="w-10 td-file">구분</th>
						<th class="w-35 td-date">주요 서비스</th>
						<th class="w-5 td-no"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(buyerList) > 0}">
							<c:forEach var="buyerList" items="${buyerList}" varStatus="status">
								<tr>
									<td class="w-5 td-no text-center"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
									<td class="w-20 td-writer"><c:out value="${buyerList.nationNm}" /></td>
									<td class="w-30 td-subject"><a href="javascript:buyerDetail('${buyerList.buyerCd}');"><c:out value="${buyerList.entrpsNm}" /></a></td>
									<td class="w-10 text-center td-file"><c:out value="${buyerList.gb}" /></td>
									<td class="w-30 td-date text-left"><c:out value="${buyerList.mainSrvc}" /></td>
									<td class="w-5 td-no text-center">
										<c:if test="${loginInfo.compLevel eq 'A'}">
											<a href="javascript:fn_Delete('${buyerList.buyerCd}');" class="btn btn-sm btn-secondary mr-5" role="button">삭제</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="text-center" colspan="6">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
