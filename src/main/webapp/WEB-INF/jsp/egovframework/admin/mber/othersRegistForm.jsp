<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<div class="page-header">
			<h3>회원관리 <small>기타회원 등록</small></h3>
		</div>
		<!-- nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">자료실</li>
			</ol>
		</nav -->


		<!-- 게시물 쓰기 시작 { -->
		<!-- h5>회원 등록 <small class="small font-weight-light text-muted" >회원등록 화면 입니다.</small></h5 -->

	    <!-- 게시물 상단 버튼 시작 { -->
	    <div class="clearfix" >
	        <div class="btn-group btn-group-justified float-right">
	            <a href="<c:url value='/admin/mberList.do'/>" class="btn btn-sm btn-secondary text-white">목록</a>
	            <a href="javascript:fn_Save();" class="btn btn-sm btn-primary text-white">저장</a>
	        </div>
	    </div>
	    <!-- } 게시물 상단 버튼 끝 -->
	    
	    <!-- 본문 제목1 시작 { -->
        <h5 class="content-title" ><i class="fas fa-list"></i> 회사정보</h5>
	    <!-- } 본문 제목1 시작 -->

		<!-- 입력양식 시작 { -->
		<div >
			<table class="table table-form table-sm" >
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>
							<label class="col-form-label">기업유형</label></th>
						<td colspan="3" >
							<label class="form-check-label">기타</label>
							<label class="form-check-label"><form:radiobutton path="ssbypGb" value="01" /> 여행사&nbsp;</label>
							<label class="form-check-label"><form:radiobutton path="ssbypGb" value="02" /> 장치사&nbsp;</label>
							<label class="form-check-label"><form:radiobutton path="ssbypGb" value="03" /> 운송사&nbsp;</label>
							<label class="form-check-label"><form:radiobutton path="ssbypGb" value="04" /> 기타</label>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">상호명</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="cmpnyNm" name="cmpnyNm" id="cmpnyNm" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">상호명 영문</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="cmpnyNmEng" name="cmpnyNmEng" id="cmpnyNmEng" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">대표자</label></th>
						<td colspan="3">
							<form:input type="text" class="form-control form-control-sm" path="rprsntv" name="rprsntv" id="rprsntv" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">대표전화</label></th>
						<td>
							<form:input type="text" class="form-control w-250" path="telno" name="telno" id="telno" value="" placeholder="예제) 051-123-4567"/>
						</td>
						<th>
							<label class="col-form-label">팩스</label></th>
						<td>
							<form:input type="text" class="form-control w-250" path="fax" name="fax" id="fax" value="" placeholder="예제) 051-123-4567" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">사업자등록번호</label></th>
						<td colspan="3" >
							<form:input type="text" class="form-control form-control-sm" path="bizNum" name="bizNum" id="bizNum" value="" maxlength="15"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">아이디</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="id" name="id" id="id" value="" maxlength="15"/><br/>
							<a href="javascript:fn_IdCheck();" class="btn btn-sm btn-primary text-white">중복확인</a><br/>
							<font color="red"><form:errors path="id"/></font>
						</td>
						<th>
							<label class="col-form-label">이메일</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="reprsntEmail" name="reprsntEmail" id="reprsntEmail" value="" maxlength="15"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">비밀번호</label></th>
						<td>
							<form:input type="password" class="form-control form-control-sm" path="password" name="password" id="password" value="" maxlength="100"/>6자리 이상의 영문/숫자 조합
						</td>
						<th>
							<label class="col-form-label">비밀번호확인</label></th>
						<td>
							<input type="password" class="form-control form-control-sm" name="cfm_password" id="cfm_password" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자 이름</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="chargerNm" name="chargerNm" id="chargerNm" value="" placeholder="국문" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">담당자 부서</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="chargerDept" name="chargerDept" id="chargerDept" value="" placeholder="국문" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자 직책</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="chargerOfcps" name="chargerOfcps" id="chargerOfcps" value="" placeholder="국문" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">담당자 연락처</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm" path="chargerTlphon" name="chargerTlphon" id="chargerTlphon" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">담당자 휴대폰</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm w-450" path="chargerHp" name="chargerHp" id="chargerHp" value="" maxlength="100"/>
						</td>
						<th>
							<label class="col-form-label">담당자 이메일</label></th>
						<td>
							<form:input type="text" class="form-control form-control-sm w-450" path="chargerEmail" name="chargerEmail" id="chargerEmail" value="" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th>
							<label class="col-form-label">소재지</label></th>
						<td colspan="3" >
							<div class="row" >
								<div class="col-md-6" >
									<form:input type="text" class="form-control form-control-sm" path="locplc" name="locplc" id="locplc" value="" maxlength="100"/>
								</div>
								<div class="col-md-6" >
									<form:input type="text" class="form-control form-control-sm" path="locplcEng" name="locplcEng" id="locplcEng" value="" maxlength="100"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
				</tbody>
			</table>
		</div>

	    <!-- 본문 제목1 시작 { -->
        <h5 class="content-title mt-4" ><i class="fas fa-list"></i> 제품 및 기타정보</h5>
	    <!-- } 본문 제목1 시작 -->

		<!-- 입력양식 시작 { -->
		<div >
			<table class="table table-form table-sm" >
				<colgroup>
					<col width="15%" />
					<col width="85%" />
				</colgroup>
				<tbody>
					<tr>
						<th><label class="col-form-label">주요업무</label></th>
						<td><textarea class="form-control form-control-sm" name="mainSkll" id="mainSkll" rows="3"></textarea></td>
					</tr>
					<tr>
						<th><label class="col-form-label">기타사항</label></th>
						<td><textarea class="form-control form-control-sm" name="etcMatter" id="etcMatter" rows="3"></textarea></td>
					</tr>
					<tr>
						<th><label class="col-form-label" for="file_nm" >회사소개서</label></th>
						<td>
							<input type="file" name="file_nm" id="file_nm"/>
						</td>
					</tr>
					<tr>
						<th><label class="col-form-label" for="file_nm2" >제무제표</label></th>
						<td>
							<input type="file" name="file_nm2" id="file_nm2"/>
							!재무제표는 최근 2년 실적현황으로 첨부 해주세요.
						</td>
					</tr>
					<tr>
						<th><label class="col-form-label" for="file_nm3" >기타첨부(선택)</label></th>
						<td>
							<input type="file" name="file_nm3" id="file_nm3"/>
						</td>
					</tr>
					<tr>
						<th><label class="col-form-label">회원탈퇴</label></th>
						<td>
							회원탈퇴는 관리자에게 문의주시기 바랍니다. (Tel. 051-972-6470)
						</td>
					</tr>
				</tbody>
			</table>
		</div>
