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
    <section class="section-area">
        <div class="container">
            <div class="row">
            	<div class="section-heading mb-5 col-12">
						<h2>해외 바이어 소개</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>
            	<div class="section-text col-12 mb-100 bo-v">
					<div id="printArea"><!-- printArea -->
						<h4 class="mb-1" ><i class="fas fa-align-justify text-info"></i> 해외 바이어 소개</h4>
						<div class="container mb-10">
									<div class="bo-v-row border-top-1 row">
										<div class="col-md-2 fth">국가</div>
										<div class="col-md-10" >${BuyerInfo.nationNm}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">업체명</div>
										<div class="col-md-4">${BuyerInfo.entrpsNm}</div>
										<div class="col-md-2 fth">대표자</div>
										<div class="col-md-4">${BuyerInfo.rprsntv}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">구분</div>
										<div class="col-md-10" >${BuyerInfo.gb}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">주소</div>
										<div class="col-md-10" >${BuyerInfo.adres}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">연락처</div>
										<div class="col-md-4">${BuyerInfo.cttpc}</div>
										<div class="col-md-2 fth">종업원</div>
										<div class="col-md-4"><fmt:formatNumber value="${BuyerInfo.employeeCn}" type="number"/> 명</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">팩스</div>
										<div class="col-md-4">${BuyerInfo.fax}</div>
										<div class="col-md-2 fth">연간매출액($)</div>
										<div class="col-md-4"><fmt:formatNumber value="${BuyerInfo.yearSales}" type="number"/></div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">홈페이지</div>
										<div class="col-md-4">${BuyerInfo.hmpg}</div>
										<div class="col-md-2 fth">대표메일</div>
										<div class="col-md-4">${BuyerInfo.email}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">주요서비스(상세)</div>
										<div class="col-md-10" >${BuyerInfo.mainSrvc}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">회사소개</div>
										<div class="col-md-10" >${BuyerInfo.buyerIntro}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">관심품목</div>
										<div class="col-md-4">${BuyerInfo.interestItem}</div>
										<div class="col-md-2 fth">참여행사이력</div>
										<div class="col-md-4">${BuyerInfo.partcptnEvent}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자명</div>
										<div class="col-md-4">${BuyerInfo.chargerNm}</div>
										<div class="col-md-2 fth">담당자부서</div>
										<div class="col-md-4">${BuyerInfo.chargerDept}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자직책</div>
										<div class="col-md-4">${BuyerInfo.chargerOfcps}</div>
										<div class="col-md-2 fth">담당자연락처</div>
										<div class="col-md-4">${BuyerInfo.chargerCttpc}</div>
									</div>
									<div class="bo-v-row row">
										<div class="col-md-2 fth">담당자이메일</div>
										<div class="col-md-4">${BuyerInfo.chargerEmail}</div>
										<div class="col-md-2 fth">첨부파일</div>
										<div class="col-md-4">${BuyerInfo.catalFileNm1}</div>
									</div>
						</div>


						<h5 class="mt-50 mb-1" ><i class="fas fa-align-justify text-info"></i> 성과누적현황</h5>
						<div class="container mb-10">
							<div class="bo-v-row border-top-1 row">
									<div class="col-md-6 fth">행사명</div>
									<div class="col-md-3 fth">상담액</div>
									<div class="col-md-3 fth">계약액</div>
							</div>
							<c:choose>
								<c:when test="${fn:length(ResultAccList) > 0}">
									<c:forEach var="ResultAccList" items="${ResultAccList}" varStatus="status">
										<div class="bo-v-row row">
											<div class="col-md-6 text-center"><c:out value="${ResultAccList.eventNm}" /></div>
											<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccList.acCnsltAmt}" type="number"/></div>
											<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccList.acCntrctAmt}" type="number"/></div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="bo-v-row row">
										<div class="col-md-12 text-center" >조회된 결과가 없습니다.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<h5 class="mt-50 mb-1" ><i class="fas fa-align-justify text-info"></i> 성과누적현황 합계표</h5>
						<div class="container mb-10">
							<div class="bo-v-row border-top-1 row">
								<div class="col-md-6 fth">합계</div>									
								<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccSum.acCnsltAmt}" type="number"/></div>
								<div class="col-md-3 text-center"><fmt:formatNumber value="${ResultAccSum.acCntrctAmt}" type="number"/></div>					
							</div>
						</div>
				</div><!-- printArea -->

					    <!-- 버튼 시작 { -->
					    <div class="clearfix mb-30 text-right" >
					        	<a href="<c:url value='/show/BuyerList.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>
						        <button type="button" onclick="javascript:printDiv('printArea');" class="btn btn-sm btn-primary" role="button">프린트</button>
					    </div>
					    <!-- } 버튼 끝 -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
