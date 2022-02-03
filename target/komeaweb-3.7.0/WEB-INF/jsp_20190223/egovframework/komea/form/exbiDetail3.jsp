<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<h5 class="mt-50"><i class="fas fa-align-justify text-info"></i> 참가업체 모집개요</h5>
					<div class="container mb-10">

							<div class="bo-v-row border-top-3 row">
								<div class="col-md-2 fth">참가지원기관</div>
								<div class="col-md-10">${ExbiRegistInfo.supportOrganNm}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">참가모집기간</div>
								<div class="col-md-10">
									<fmt:parseDate value="${ExbiRegistInfo.rceptBeginDe}" var="rceptBeginDe" pattern="yyyyMMdd"/>
									<fmt:parseDate value="${ExbiRegistInfo.rceptClosDe}" var="rceptClosDe" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${rceptBeginDe}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${rceptClosDe}" pattern="yyyy.MM.dd"/>
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">참가개요</div>
								<div class="col-md-10">${ExbiPartcptSumry}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">참가신청방법</div>
								<div class="col-md-10">${ExbiPartcptReqstMth}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">지원내용</div>
								<div class="col-md-10">${ExbiSportCn}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">참가비</div>
								<div class="col-md-10 no-padding">
									<div class="container">
										<div class="bo-v-row row">
											<div class="col-md-4 fth">1차납부(신청금)</div>
											<div class="col-md-4"><fmt:formatNumber value="${ExbiRegistInfo.coPayamt1}" type="number"/></div>
											<div class="col-md-4 fth">예상 총 참가금(1차+2차)</div>
										</div>
										<div class="bo-v-row row">
											<div class="col-md-4 fth">2차납부(선정확정후)</div>
											<div class="col-md-4"><fmt:formatNumber value="${ExbiRegistInfo.coPayamt2}" type="number"/></div>
											<div class="col-md-4">
												<c:set var="sum" value="0"/>
												<c:set var="sum" value="${ExbiRegistInfo.coPayamt1 + ExbiRegistInfo.coPayamt2}"/>
												<fmt:formatNumber value="${sum}" type="number"/>
											</div>
										</div>
										<div class="bo-v-row row">
											<div class="col-md-4 fth no-b-border">2차납부(선정확정후)</div>
											<div class="col-md-8 no-b-border">${ExbiRegistInfo.partcptInclsMatter}</div>
										</div>
									</div>
								</div>
							</div>

							<div class="bo-v-row row">
								<div class="col-md-2 fth">입금계좌</div>
								<div class="col-md-10">
									- 입금계좌 : ${ExbiRegistInfo.rcpmnyAcnut}<br/>
									- 예금주 : ${ExbiRegistInfo.dpstr}<br/>
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">문의처</div>
								<div class="col-md-10">
									- 담당자 : ${ExbiRegistInfo.chargerNm}<br/>
									- 이메일 : ${ExbiRegistInfo.chargerEmail}<br/>
									- 전화 : ${ExbiRegistInfo.chargerTlphon}<br/>
									- 팩스 : ${ExbiRegistInfo.chargerFax}<br/>
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">첨부파일</div>
								<div class="col-md-10 no-padding">
									<div class="container">
										<div class="bo-v-row row">
											<div class="col-md-12">
												<a href="<c:out value="${ExbiRegistInfo.attcheFilePath}" />" title="<c:out value="${ExbiRegistInfo.attcheFileNm}" />" ><i class="fas fa-paperclip text-info"></i> ${ExbiRegistInfo.attcheFileNm}</a>
											</div>
										</div>
										<div class="bo-v-row row">
											<div class="col-md-12">
												<a href="<c:out value="${ExbiRegistInfo.attcheFilePath2}" />" title="<c:out value="${ExbiRegistInfo.attcheFileNm2}" />" ><i class="fas fa-paperclip text-info"></i> ${ExbiRegistInfo.attcheFileNm2}</a>
											</div>
										</div>
										<div class="bo-v-row row">
											<div class="col-md-12 no-b-border">
												<a href="<c:out value="${ExbiRegistInfo.attcheFilePath3}" />" title="<c:out value="${ExbiRegistInfo.attcheFileNm3}" />" ><i class="fas fa-paperclip text-info"></i> ${ExbiRegistInfo.attcheFileNm3}</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth">참고사항</div>
								<div class="col-md-10">${ExbiNoticeItems}</div>
							</div>

					</div>