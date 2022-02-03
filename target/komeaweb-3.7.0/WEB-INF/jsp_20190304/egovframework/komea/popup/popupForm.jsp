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
	function setCookie(name, value, expiredays){
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate()+expiredays);
		document.cookie = name+"="+escape(value)+"; path=/; expires="+todayDate.toGMTString()+";";
	}

	$("#pop_close").click(function(){
		var chk = $("#pop").is(":checked");
		if(chk){
			setCookie("popup"+${popupVO.popupNo},"done",1);
		}
		window.close();
	});
});
</script>
<body>
<div class="container-fluid nospacing">
	<div class="popup-dialog" >
		<div class="popup-content">
			<div class="popup-header">
				<h5><c:out value="${popupVO.subject}"/></h5>
				<button type="button" class="close" onClick="window.close();" >
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="popup-body">
				<c:out value="${popupVO.contents}"  escapeXml="false" />
			</div>

			<div class="popup-footer">
				<input class="PopupCheck" type="checkbox" name="pop" id="pop">1일동안 이 창을 열지 않음&nbsp;
				<button type="button" class="btn btn-sm btn-secondary" id="pop_close">닫기</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-bottom-popup.jsp" %>
