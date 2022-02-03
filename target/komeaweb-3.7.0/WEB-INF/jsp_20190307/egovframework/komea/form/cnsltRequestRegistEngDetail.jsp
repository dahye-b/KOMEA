<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="printArea">
	<div class="section-text col-12 mb-30 bo-v" >

		<h5 class=""><i class="fas fa-align-justify text-info"></i> 신청서</h5>
		<p class="mb-10">
		<span class="required"></span> 본 자료는 바이어 제출용이므로 최종 확인 후 제출해주시면 감사하겠습니다.
		</p>
		<div class="container mb-10">

			<div class="bo-v-row border-top-3 row bg-light">
				<div class="col-md-2 fth">TITLE</div>
				<div class="col-md-10"><c:out value="${CnsltCompReqInfo.eventNm}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Company Name</div>
				<div class="col-md-4"><c:out value="${mberInfo.cmpnyNm}" /></div>
				<div class="col-md-2 fth">President</div>
				<div class="col-md-4"><c:out value="${mberInfo.rprsntvEng}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Address</div>
				<div class="col-md-10"><c:out value="${mberInfo.locplcEng}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Establishment</div>
				<div class="col-md-4">
					<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
				</div>
				<div class="col-md-2 fth">Employees</div>
				<div class="col-md-4"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Tel</div>
				<div class="col-md-4"><c:out value="${mberInfo.telno}" /></div>
				<div class="col-md-2 fth">Fax</div>
				<div class="col-md-4"><c:out value="${mberInfo.fax}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Website</div>
				<div class="col-md-4"><c:out value="${mberInfo.hmpg}" /></div>
				<div class="col-md-2 fth">E-mail</div>
				<div class="col-md-4"><c:out value="${mberInfo.reprsntEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Contact Name</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerNmEng}" /></div>
				<div class="col-md-2 fth">Contact Dept./Position</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerDeptEng}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Contact Tel.</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerTlphon}" /></div>
				<div class="col-md-2 fth">Contact E-mail</div>
				<div class="col-md-4">
					<c:out value="${mberInfo.chargerEmail}" /></div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Annual Exports(3 Years)</div>
				<div class="col-md-10"><fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/> $
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Main Product</div>
				<div class="col-md-10">
				파일경로 : ${CnsltCompReqInfo.basicProductFileCours} <br/>
				파일명 : ${CnsltCompReqInfo.basicProductFileNm} <br/>
				${MainPrductEng}
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Sub Product</div>
				<div class="col-md-10">
				파일경로 : ${CnsltCompReqInfo.addProductFileCours} <br/>
				파일명 : ${CnsltCompReqInfo.addProductFileNm} <br/>
				${AddPrductEng}
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Certificate&License</div>
				<div class="col-md-10">${PatentCrtfcEng}
				</div>
			</div>
			<div class="bo-v-row row">
				<div class="col-md-2 fth">Major Customer</div>
				<div class="col-md-10">${MainBcncEng}
				</div>
			</div>
		</div>

	</div>		
</div>
