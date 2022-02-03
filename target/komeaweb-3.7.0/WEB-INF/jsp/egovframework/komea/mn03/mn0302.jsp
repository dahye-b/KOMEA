<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<body>
	<!-- ##### Section Area Start ##### -->
	<section class="section-area">
		<div class="container">
			<div class="row">
				<div class="section-heading col-12">
					<h2>${mnNm}</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
				<div class="section-text col-12 mb-100">

					<div class="container">
						<div class="row">
							<h5><i class="fas fa-align-justify text-info"></i> 사업소개</h5>
						</div>
					</div>

					<div class="table-responsive-md text-keep" >
						<table class="table table-bordered border-top-3" summary="정보공유 내용 입니다." >
							 <caption class="d-none" >정보공유</caption>
							 <thead>
								 <tr>
									 <th width="20%" ><strong>구분</strong></th>
									 <th width="30%" ><strong>내용</strong></th>
									 <th width="50%" ><strong>회원사혜택</strong></th>
								 </tr>
							 </thead>
							 <tbody>
								 <tr>
									 <td rowspan="5" class="text-center td-hide-md"><strong>정보공유</strong></td>
									 <td class="bg-light">
										 <strong>소식지발간</strong>
									</td>
								 	<td rowspan="2" class="text-left ">
										<p>*  신속한 정보 획득</p>
										<p>*  광고 및 제품소개 기회  제공</p>
										<p>*  조합보,  뉴스레터 발송</p>
										<p class="py-20"><br /></p>
									 </td>
								 </tr>
								 <tr>
									 <td style="border-right:1px solid #DEDEDE !important;">
										<p>∙  조합보(KME  Magazine)</p>
										<p>∙  뉴스레터(주간)</p>
										<p>∙ 조선해양기자재산업 종합통계집(KMSI)</p>
									</td>
								 </tr>
								 <tr>
									 <td><p class="text-info">세미나 및 컨퍼런스 개최</p></td>
									 <td class="text-left" >
										<p>*  최신 동향 파악/정보  획득 기회</p>
										<p>*  관련 세미나 무료 초청 등</p>
									</td>
								</tr>
								 <tr>
									 <td class="bg-light"><strong>기타</strong></td>
									 <td rowspan="2" class="text-left ">
									 	<p>*  정책 동향 파악 및 의견 건의 등</p>
									 </td>
								 </tr>
								 <tr>
								 	<td style="border-right:1px solid #DEDEDE !important;">
								 		<p>∙  정부 및 업계인사  초청 </p>
										<p>∙	간담회 개최 등</p>
									</td>
								 </tr>
							 </tbody>
						 </table>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- ##### Section Area End ##### -->


<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
