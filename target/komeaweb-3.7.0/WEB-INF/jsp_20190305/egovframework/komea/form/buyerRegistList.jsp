<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top-popup.jsp" %>
<script type="text/javascript">
function fn_egov_link_page(pageNo){
	var tmp = document.Form.cnsltexhbCd.value;
	
	document.Form.pageIndex.value = pageNo;
	document.Form.action = "<c:url value='/show/BuyerSearchPopup.do?code="+tmp+"'/>";
	document.Form.submit();
}
function fn_Search(obj){
	if(obj != null){
		document.Form.entrpsNmIndex.value = obj;
	}
	var tmp = document.Form.cnsltexhbCd.value;
	document.Form.action = "<c:url value='/show/BuyerSearchPopup.do?code="+tmp+"'/>";
	document.Form.submit();
}

function fn_Choice(obj){
	var tmp = document.Form.cnsltexhbCd.value;
	opener.parent.location="<c:url value='/show/suppBizManageBuyerInput.do?buyerCd="+obj+"&code="+tmp+"'/>";
	self.close();
}
</script>
<body>
<div class="container-fluid nospacing">
<form:form name="Form" commandName="show" method="post">
<form:input type="hidden" path="entrpsNmIndex" name="entrpsNmIndex" id="entrpsNmIndex" value=""/>
<form:input type="hidden" path="cnsltexhbCd" name="cnsltexhbCd" id="cnsltexhbCd" value="${cnsltexhbCd}"/>
	<div class="popup-dialog" >
		<div class="popup-content">
			<div class="popup-header">
				<h5>바이어검색</h5>
				<button type="button" class="close" onClick="window.close();" >
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="popup-body">
			    <!-- ##### Search Area Start ##### -->
				<div>
					<nav class="tab-alphabet nav nav-pills nav-justified">
						<a class="nav-link active" href="javascript:fn_Search('');">All</a>
						<a class="nav-link" href="javascript:fn_Search('A');">A</a>
						<a class="nav-link" href="javascript:fn_Search('B');">B</a>
						<a class="nav-link" href="javascript:fn_Search('C');">C</a>
						<a class="nav-link" href="javascript:fn_Search('D');">D</a>
						<a class="nav-link" href="javascript:fn_Search('E');">E</a>
						<a class="nav-link" href="javascript:fn_Search('F');">F</a>
						<a class="nav-link" href="javascript:fn_Search('G');">G</a>
						<a class="nav-link" href="javascript:fn_Search('H');">H</a>
						<a class="nav-link" href="javascript:fn_Search('I');">I</a>
						<a class="nav-link" href="javascript:fn_Search('J');">J</a>
						<a class="nav-link" href="javascript:fn_Search('K');">K</a>
						<a class="nav-link" href="javascript:fn_Search('L');">L</a>
						<a class="nav-link" href="javascript:fn_Search('M');">M</a>
						<a class="nav-link" href="javascript:fn_Search('N');">N</a>
						<a class="nav-link" href="javascript:fn_Search('O');">O</a>
						<a class="nav-link" href="javascript:fn_Search('P');">P</a>
						<a class="nav-link" href="javascript:fn_Search('Q');">Q</a>
						<a class="nav-link" href="javascript:fn_Search('R');">R</a>
						<a class="nav-link" href="javascript:fn_Search('S');">S</a>
						<a class="nav-link" href="javascript:fn_Search('T');">T</a>
						<a class="nav-link" href="javascript:fn_Search('U');">U</a>
						<a class="nav-link" href="javascript:fn_Search('V');">V</a>
						<a class="nav-link" href="javascript:fn_Search('W');">W</a>
						<a class="nav-link" href="javascript:fn_Search('X');">X</a>
						<a class="nav-link" href="javascript:fn_Search('Y');">Y</a>
						<a class="nav-link" href="javascript:fn_Search('Z');">Z</a>
					</nav>
		    		<div class="form-group" >
		        		<form:input path="entrpsNm" class="form-control form-control-sm" placeholder="바이어명" size="30" value="" />
		        	</div>
		        	<div class="form-group" >
		            	<a href="javascript:fn_Search('');" class="btn btn-sm btn-primary btn-block text-white" >검색</a>
		            </div>
				</div>
				<!-- ##### Search Area Start ##### -->
				
				<div class="table-responsive mt-10" >
					 <table class="table table-bordered border-top-3 text-nowrap table-hover" summary="바이어목록 입니다." >
				 		<caption class="d-none" >바이어검색</caption>
						<thead>
							<tr>
								<th width="25%"><strong>국가</strong></th>
								<th width="20%" class="td-b-hide-sm" ><strong>업체명</strong></th>
								<th width="20%" class="td-hide-md"><strong>구분</strong></th>
								<th width="25%" class="td-hide-sm"><strong>홈페이지</strong></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(resultList) > 0}">
									<c:forEach var="resultList" items="${resultList}" varStatus="status">
										<tr>
											<td class="text-left"><c:out value="${resultList.nationNm}" /></td>
											<td class="td-b-hide-sm"><a href="javascript:fn_Choice('${resultList.buyerCd}');" class="text-16"><c:out value="${resultList.entrpsNm}" /></a></td>
											<td class="text-center td-hide-md"><c:out value="${resultList.gb}" /></td>
											<td class="text-left td-hide-sm"><c:out value="${resultList.hmpg}" /></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="text-center" colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
				<!-- ##### Paging Area Start ##### -->
					<div class="mb-1 clearfix" >
						<nav class="table-responsive" >
							<ul class="pagination flex-wrap justify-content-center">
								<ui:pagination paginationInfo="${paginationInfo}" type="komeaPagination" jsFunction="fn_egov_link_page"/>
							</ul>
							<form:hidden path="pageIndex"/>
						</nav>
					</div>
					<!-- ##### Paging Area End ##### -->

			</div>

			<div class="popup-footer">
				<button type="button" class="btn btn-sm btn-secondary" onClick="window.close();" >닫기</button>
			</div>
			
		</div>
	</div>
	</form:form>
</div>
<%@ include file="/WEB-INF/include/include-bottom-popup.jsp" %>