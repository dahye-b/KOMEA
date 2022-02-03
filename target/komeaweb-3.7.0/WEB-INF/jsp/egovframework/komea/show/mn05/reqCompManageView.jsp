<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function fn_Print(){
	var sw=screen.width;
	var sh=screen.height;
	// var w=800;
	// var h=600;
	var w = 1200;
	var h = 800;
	var xpos=(sw-800)/2;
	var ypos=(sh-600)/2;

	var pHeader = "<html lang='ko'><head><meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'>";
pHeader += "<meta name='viewport' content='width=device-width, initial-scale=1'>";
pHeader += "<title>한국조선해양기자재공업협동조합</title>";
pHeader += "<link rel='icon' href='/img/core-img/favicon.ico'>";
pHeader += "<link rel='stylesheet' href='/css/style.css'>";
pHeader += "<script src='/js/jquery/jquery-2.2.4.min.js' />";
pHeader += "<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css' crossorigin='anonymous'>";
pHeader += "<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js' crossorigin='anonymous'><\/script>";
pHeader += "<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js' crossorigin='anonymous'><\/script>";
pHeader += "</head><body>";
pHeader += "<section class='section-area'><div class='container'><div class='row'><div class='section-text col-12 mb-100 bo-v show'>";

	// var pgetContent=document.getElementById("printArea").innerHTML + "<br>";
	var pgetContent=document.getElementById("printArea1").innerHTML + "<br>";

	/* var pFooter = "</body></html>"; */
	var pFooter = "</div></div></div></section>";
	pFooter = pFooter + "</body></html>";
	pContent = pHeader + pgetContent + pFooter;
console.log( pContent );
	pWin = window.open("","printExbi","width="+w+",height="+h+",top="+ypos+",left="+xpos+",status=yes,scrollbars=yes");
	pWin.document.open();
	pWin.document.write( pContent );
	pWin.document.close();
	pWin.print();
}
function printDiv(divName) {
	var printContents = document.getElementById(divName).innerHTML;
	var originalContents = document.body.innerHTML;
	document.body.innerHTML = printContents;
	window.print();
	document.body.innerHTML = originalContents;
}
</script>
<body>
<form:form name="Form" commandName="show" method="post">

    <!-- ##### Section Area Start ##### -->
    <section class="section-area" >
        <div class="container" >
            <div class="row">
            	<div class="section-heading mb-5 col-12">
					<h2>참가신청업체</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
				
				<c:choose>
					<c:when test="${ViewGb eq '0'}">
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/exbiRequestRegistDetail.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/cnsltRequestRegistDetail.jsp" />
						<jsp:include flush="true" page="/WEB-INF/jsp/egovframework/komea/form/cnsltRequestRegistEngDetail.jsp" />
					</c:otherwise>
				</c:choose>
				
			    <!-- 버튼 시작 { -->
				<div class="col-12 text-right mb-50" >
			        <a href="<c:url value='/show/ReqCompManage.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
			        <!-- a href="javascript:fn_Print();" class="btn btn-sm btn-primary" role="button">1. 프린트</a -->
			        <button type="button" onclick="javascript:printDiv('printArea');" class="btn btn-sm btn-primary" role="button">프린트</button>
			    </div>
			    <!-- } 버튼 끝 -->

            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>