<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 상담행사 참가신청내역</h5>
	<div class="container mb-10">

		<div class="bo-v-row border-top-3 row">
			<div class="col-md-2 fth">회사명</div>
			<div class="col-md-4"><c:out value="${mberInfo.cmpnyNm}" /></div>
			<div class="col-md-2 fth">회사명 영문</div>
			<div class="col-md-4"><c:out value="${mberInfo.cmpnyNmEng}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">대표자</div>
			<div class="col-md-4"><c:out value="${mberInfo.rprsntv}" /></div>
			<div class="col-md-2 fth">대표자 영문</div>
			<div class="col-md-4"><c:out value="${mberInfo.rprsntvEng}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">소재지</div>
			<div class="col-md-10">
				<c:out value="${mberInfo.locplc}" /><br/>
				<c:out value="${mberInfo.locplcEng}" />
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">종업원수</div>
			<div class="col-md-4"><fmt:formatNumber value="${mberInfo.emplyCo}" type="number"/> 명</div>
			<div class="col-md-2 fth">설립일</div>
			<div class="col-md-4">
				<fmt:parseDate value="${mberInfo.fondDe}" var="fondDe" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${fondDe}" pattern="yyyy-MM-dd"/>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">대표전화</div>
			<div class="col-md-4"><c:out value="${mberInfo.telno}" /></div>
			<div class="col-md-2 fth">팩스</div>
			<div class="col-md-4"><c:out value="${mberInfo.fax}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">홈페이지</div>
			<div class="col-md-4"><c:out value="${mberInfo.hmpg}" /></div>
			<div class="col-md-2 fth">이메일</div>
			<div class="col-md-4"><c:out value="${mberInfo.reprsntEmail}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">사업담당자 성명</div>
			<div class="col-md-4">
				<c:out value="${mberInfo.chargerNm}" />
				<c:out value="${mberInfo.chargerNmEng}" />
			</div>
			<div class="col-md-2 fth">사업담당자 부서</div>
			<div class="col-md-4">
				<c:out value="${mberInfo.chargerDept}" />
				<c:out value="${mberInfo.chargerDeptEng}" />
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">담당자이름</div>
			<div class="col-md-4">
				<c:out value="${mberInfo.chargerOfcps}" />
				<c:out value="${mberInfo.chargerOfcpsEng}" />
			</div>
			<div class="col-md-2 fth">담당자부서</div>
			<div class="col-md-4">
				<c:out value="${mberInfo.chargerTlphon}" />
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">사업담당자 이메일</div>
			<div class="col-md-10"><c:out value="${mberInfo.chargerEmail}" />
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">전년도 매출액(￦)</div>
			<div class="col-md-4">
				<fmt:formatNumber value="${mberInfo.beforeYearSalamt}" type="number"/> 백만원
			</div>
			<div class="col-md-2 fth">전년도 수출액($)</div>
			<div class="col-md-4">
				<fmt:formatNumber value="${mberInfo.beforeYearXportAcmslt}" type="number"/> $
			</div>
		</div>
	</div>
		
	<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 제품소개</h5>
	<div class="container mb-10">

		<div class="bo-v-row border-top-3 row">
			<div class="col-md-2 fth">제품세부분류</div>
			<div class="col-md-10"><c:out value="${CnsltCompReqInfo.productDetailGb}" /></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">기본제품(국문)<span class="required"></span></div>
			<div class="col-md-10">${MainPrduct}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">기본제품(영문)<span class="required"></span></div>
			<div class="col-md-10">${MainPrductEng}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">추가제품(국문)<span class="required"></span></div>
			<div class="col-md-10">${AddPrduct}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">추가제품(국문)<span class="required"></span></div>
			<div class="col-md-10">${AddPrductEng}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">특허/인증(국문)<span class="required"></span></div>
			<div class="col-md-10">${PatentCrtfc}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">특허/인증(영문)<span class="required"></span></div>
			<div class="col-md-10">${PatentCrtfcEng}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">주요거래처(국문)<span class="required"></span></div>
			<div class="col-md-10">${MainBcnc}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">주요거래처(영문)<span class="required"></span></div>
			<div class="col-md-10">${MainBcncEng}</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">상담신청 바이어 선택<span class="required"></span><br/><small>(업체당 5개사 선택가능)</small></div>
			<div class="col-md-10"></div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">사업자등록증<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.bsnmRsctftFileCours}','${CnsltCompReqInfo.bsnmRsctftFileNm}');" title="<c:out value="${CnsltCompReqInfo.bsnmRsctftFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.bsnmRsctftFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">기본제품이미지<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.basicProductFileCours}','${CnsltCompReqInfo.basicProductFileNm}');" title="<c:out value="${CnsltCompReqInfo.basicProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.basicProductFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">추가제품이미지<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.addProductFileCours}','${CnsltCompReqInfo.addProductFileNm}');" title="<c:out value="${CnsltCompReqInfo.addProductFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.addProductFileNm}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">제품카탈로그<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.prductCatlFileCours1}','${CnsltCompReqInfo.prductCatlFileNm1}');" title="<c:out value="${CnsltCompReqInfo.prductCatlFileNm1}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.prductCatlFileNm1}" /></a>
			</div>
		</div>
		<div class="bo-v-row row">
			<div class="col-md-2 fth">기타첨부<span class="required"></span></div>
			<div class="col-md-10">
				<a href="javascript:fn_downloadFile('${CnsltCompReqInfo.etcFileCours}','${CnsltCompReqInfo.etcFileNm}');" title="<c:out value="${CnsltCompReqInfo.etcFileNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${CnsltCompReqInfo.etcFileNm}" /></a>
			</div>
		</div>
	</div>