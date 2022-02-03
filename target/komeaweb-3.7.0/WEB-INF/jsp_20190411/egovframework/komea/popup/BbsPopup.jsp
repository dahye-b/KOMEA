<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top-popup.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<body class="bg-light">
<div class="container-fluid nospacing ">
	<div class="popup-dialog" >
		<div class="popup-content">
			<div class="popup-header">
				<h5 class="text-white"><c:out value="${bbsVO.title}"/></h5>
				<button type="button" class="close" onClick="window.close();" >
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="popup-body">
				<c:out value="${bbsVO.contents}"  escapeXml="false" />
			</div>
			<table>
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
			</table>

			<div class="popup-footer">
				<button type="button" class="btn btn-sm btn-secondary" id="pop_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-bottom-popup.jsp" %>
