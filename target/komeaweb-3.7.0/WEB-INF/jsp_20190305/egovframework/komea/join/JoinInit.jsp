<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sprint" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
function showRegistView(){

	var chk = document.Form.agree.checked;

	if(!chk){
		alert("약관 동의는 필수 입니다. 약관동의 체크를 해주세요.");
		document.Form.agree.focus();
		return;
	}else{
		document.Form.action = "<c:url value='/komea/Join01.do'/>";
		document.Form.submit();
	}
}
function cancel(){
	document.Form.action = "<c:url value='/komea/login.do'/>";
	document.Form.submit();
}
</script>

    <!-- ##### sub-title Area Start ##### -->
    <!-- section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center" >
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section -->
    <!-- ##### sub-title Area End ##### -->

	<form:form name="Form" commandName="mber" method="post">

	<!-- ##### Section-nav Area Start ##### -->
	<!-- div class="section-nav sub-nav-line">
        <div class="container">
            <div class="row">
                <div class="col-12">
					<ul class="dropdown-line">
						<li class="dropdown-home">
							<button type="button" href="#" class="btn btn-home" ></button>
						</li>
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">KOMEA<span class="caret"><i class="fas fa-caret-down">
							</i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/InfoManage.do'/>">KOMEA<small>(KOMEC)</small></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0101.do'/>">조합원사</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0201.do'/>">사업소개</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/show/WorkView.do'/>">전시행사</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >수출 및 A/S시스템</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0801.do'/>">자료실</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value='/komea/mn0901.do'/>">게시판</a></li>
							</ul>
						</li>
						<li class="dropdown dropdown-sub-nvi">
							<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">회원가입<span class="caret"><i class="fas fa-caret-down"></i></span></button>
							<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
							</ul>
						</li>
					</ul>
                </div>
            </div>
        </div>
    </div -->
    <!-- ##### Section-nav Area End ##### -->

    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

							<div class="section-heading mb-5 col-12">
						<h2>회원가입</h2>
						<div class="dropdown-line-subtitle"></div>
						<!-- div class="line-"></div -->
				</div>
            	<div class="section-text col-12 join-terms">

					<!-- 가입약관 { -->
					<h3 class="card-title"><i class="fas fa-check"></i> 가입약관</h3>
					<div class="card bg-light" >
						<div class="card-body terms1" >
<h5>회원약관</h5>
<br />
<br />
이 약관은 한국조선해양기자재공업협동조합(이하 "조합"이라 합니다)가 제공하는 모든 서비스(이하 "서비스"라 합니다)의 이용에 관한 사항 및 기타 필요한 절차에 관한 규정에 대해 정의하는 것을 목적으로 합니다.<br />
<br />
<h6>제 2 조 (약관의 효력 및 변경)</h6>
① 이 약관은 서비스를 통하여 알리거나, 전자우편, 웹사이트의 서비스 화면 게시 등의 방법으로 회원에게 알림으로써 효력을 발생 합니다.<br />
② 조합은 이 약관의 내용을 변경할 수 있으며, 이에 대하여 제1항과 같은 방법에 의해 효력을 갖습니다.<br />
<br />
<h6>제 3 조 (약관 이외의 준칙)</h6>
이 약관에 언급되지 않은 사항이 전기통신기본법, 전기통신사업법, 기타 관련법령의 규정에 따라 적용할 수 있습니다.<br />
<br />
<h6>제 4조 (이용계약의 성립)</h6>
① 이용자가 이용신청시의 "약관동의" 버튼을 클릭 하면 이 약관에 동의하는 것으로 간주됩니다.<br />
② 이용계약은 이용자의 이용신청에 대하여 조합이 승낙함으로써 성립합니다.<br />
③ 회원이 변경된 약관에 동의하지 않을 경우, 서비스 이용을 중단하고 탈퇴할 수 있습니다.<br />
약관이 변경된 이후에도 계속적으로 서비스를 이용하는 경우에는 회원이 약관의 변경 사항에 동의한 것으로 봅니다.<br />
④ 이용계약은 회원 1인당 1개의 실명이 확인된 ID로 체결하는 것을 원칙으로 합니다.<br />
<br />
<h6>제 5조 (회원의 탈퇴 및 자격 상실)</h6>
① 회원은 조합에 언제든지 자신의 회원 등록을 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 조합은 위 요청을 받은 즉시 해당 회원의 회원등록을 말소합니다.<br />
② 회원이 다음 각 호의 사유에 해당하는 경우, 조합은 회원의 회원자격을 제한 및 정지, 상실시킬 수 있습니다.<br />
<br />
1. 가입 신청 시에 허위 내용을 등록한 경우<br />
2. 다른 사람의 조합의 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br />
3. 사회의 안녕질서 및 미풍양속을 저해할 목적으로 신청하였을 경우<br />
4. 기타 회사가 정한 이용신청 요건이 미비하였을 ??우<br />
<br />
<h6>제? 6 조 (이용신청)</h6>
① 본 서비스를 이용하기 위해서는 조합 소정의 가입신청 양식에서 요구하는 모든 회원 정보를 기록하여 신청해야 합니다.<br />
② 가입신청 양식 및 온라인 가입신청에 기재하는 모든 회원 정보는 모두 실제 데이터인 것으로 간주하며 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.<br />
<br />
<h6>제 7 조 (이용신청의 승낙)</h6>
① 조합은 제 4,5,6,조의 각 조항에 위배되는 경우를 제외하곤 서비스 이용신청을 승낙합니다.<br />
② 조합은 다음에 해당하는 경우, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다.<br />
<br />
가. 서비스 관련 설비에 여유가 없는 경우<br />
나. 기술상 지장이 있는 경우<br />
다. 기타 조합이 필요하다고 인정되는 경우<br />
③ 조합은 다음에 해당하는 경우, 가입을 승낙하지 않을 수 있습니다.<br />
가. 기업회원은 기업의 사업자등록번호가 아닌 경우<br />
나. 이용 신청 시 필요내용을 허위로 기재하여 신청한 경우<br />
다. 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청한 경우<br />
라. 기타 조합이 정한 이용신청 요건에 맞지 않을 경우<br />
마. 만14세 미만의 아동이 부모 등의 법정대리인의 동의를 얻지 않은 경우<br />
<br />
<h6>제 8 조 (회원정보의 변경)</h6>
회원은 본 서비스의 이용을 위해 자신의 정보를 성실히 관리해야 하며 회원정보의 변동사항이 있을 경우 온라인으로 이를 수정해야 하며, 변경을 하지 않아 생기는 문제의 책임은 회원에게 있습니다.<br />
<br />
<h6>제 9 조 (조합의 의무)</h6>
① 조합은 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.<br />
② 조합은 회원의 개인정보를 본인의 승낙 없이 타인에게 공개, 배포하지 않으며, 서비스관련 업무 이 외의 상업적 목적으로 사용 할 수 없습니다. 단, 다음에 해당하는 경우는 예외로 합니다.<br />
- 전기통신기본법, 전기통신 사업법 등 관계법령에 의거 국가기관의 요구가 있는 경우<br />
- 통계작성/학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우<br />
- 이벤트 참여 및 기타 보다 나은 서비스 제공을 위하여 이벤트 주최 및 후원하는 비즈니스 파트너 및 제휴사와는 회원의 일부 정보를 공유하는 경우<br />
③ 조합은 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 회원의 신청에 따라 소정의 절차를 거쳐 전자우편이나 서신 등으로 제공합니다.<br />
<br />
<h6>제 10 조 (회원의 의무)</h6>
① 회원ID와 비밀번호에 관한 모든 관리와 부정사용에 대한 결과의 책임은 회원에게 있습니다.<br />
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 조합에 그 사실을 통보해야 합니다.<br />
③ 회원ID와 비밀번호는 다른 사람에게 양도, 임대, 대여할 수 없습니다.<br />
④ 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.<br />
⑤ 회원은 조합의 사전 승인 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.<br />
<br />
<h6>제 11 조 (서비스의 범주)</h6>
이 약관은 조합에서 제공하는 모든 서비스에 기본적으로 적용되며, 다른 항의 별도조항이 요구되는 서비스에는 부속 약관을 둘 수 있습니다.<br />
<br />
<h6>제 12조 (정보의 제공)</h6>
조합은 회원이 서비스 이용 중 필요하고 인정되는 다양한 정보에 대해서 전자메일이나 서신우편 등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 가입신청 메뉴와 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.<br />
<br />
<h6>제 13조 (광고주와의 거래)</h6>
조합은 본 사이트에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하여 거래한 결과로서 발생하는 모든 손실과 손해에 대해 책임을 지지 않습니다.<br />
<br />
<h6>제 14조 (회원의 게시물)</h6>
조합은 회원이 본 서비스를 통하여 게시, 게재, 전자메일 또는 달리 전송한 내용물에 대해 일체 민,형사상의 책임을 지지 않으며, 다음의 경우에 해당될 경우 사전통지 없이 삭제할 수 있습니다.<br />
ⓛ 다른 회원이나 타인을 비방하거나, 프라이버시를 침해하거나, 중상모략으로 명예를 손상시키는 내용인 경우<br />
② 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우<br />
③ 범죄적 행위에 관련된다고 인정되는 내용일 경우<br />
④ 조합의 지적재산권, 타인의 지적재산권 등 기타권리를 침해하는 내용인 경우<br />
⑤ 기타 관계법령에 위반된다고 판단되는 경우<br />
<br />
<h6>제 15 조 (게시물에 대한 권리 및 책임)</h6>
ⓛ 본 사이트의 모든 게시물에 대한 저작권은 사전에 당사자간 명시한 별도의 의사표시가 없는 한 조합에 귀속됩니다.<br />
② 게시물에 대한 보호는 조합에서 하며, 조합의 허가 없이 타인에 의해 게시물이 다른 사이트에서 사용 또는 인용되는 것은 금지됩니다.<br />
<br />
<h6>제 16 조 (서비스 이용시간)</h6>
조합은 업무상 또는 기술상의 장애, 기타 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스 제공을 원칙으로 합니다. 다만 정기점검 등 조합이 필요한 경우 또는 설비의 장애, 서비스 이용의 폭주, 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지, 천재지변 등 불가항력으로 인하여 서비스 이용에 지장이 있는 경우, 예외적으로 서비스 이용의 전부 또는 일부에 대하여 제한할 수 있습니다.<br />
<br />
<h6>제 17 조 (서비스 이용 책임)</h6>
회원은 서비스를 이용하여 불법 상품을 판매하는 영업 활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란사이트를 통한 상업행위, 상용 S/W 불법배포 등을 할 수 없습니다.<br />
이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 조합이 책임을 지지 않습니다.<br />
<br />
<h6>제 18 조 (계약해지 및 이용제한)</h6>
ⓛ 회원이 이용계약을 해지하고자 하는 때에는 회원본인이 서비스 또는 E메일을 통하여 해지신청을 하여야 합니다<br />
② 조합은 회원이 다음에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.<br />
가. 타인의 회원 ID 및 비밀번호 등 개인정보를 도용한 경우<br />
나. 서비스 운영을 고의로 방해한 경우<br />
다. 공공질서 및 미풍양속에 반하는 경우<br />
라. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우<br />
마. 서비스의 위해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우<br />
바. 조합, 다른 회원 또는 타인의 지적재산권을 침해하는 경우<br />
사. 조합의 서비스 정보를 이용하여 얻은 정보를 조합의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우<br />
아. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우<br />
자. 본 약관을 포함하여 기타 조합이 정한 이용조건 및 관계법령을 위반한 경우<br />
<br />
<h6>제 19 조 (손해배상)</h6>
조합은 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해도 책임지지 않습니다.<br />
<br />
<h6>제 20 조 (면책조항)</h6>
① 조합은 천재지변 또는 이에 준 하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br />
② 조합은 회원ID와 비밀번호 관리 및 이용상의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임이 면제됩니다.<br />
③ 조합에서 제공하는 각 포탈사이트에서 얻은 정보와 특정전문가로부터의 질문의 대답 등으로 인해 회원에게 발생하는 손해는 조합이 책임지지 않습니다.<br />
④ 조합은 회원이 조합의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나, 서비스 자료에 대한 취사 선택 또는, 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br />
⑤ 조합은 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 그 내용에 관해서 책임을 지지 않습니다.<br />
<br />
<h6>제 21 조 (관할법원)</h6>
서비스 이용과 관련하여 소송이 제기될 경우 조합의 소재지를 관할하는 법원을 관할법원으로 합니다.<br />
<br />
<h6>[부칙]</h6>
(시행일) 이 약관은 2012년 12월 1일 부터 시행합니다.

						</div>
					</div>
					<!-- } 가입약관 -->

					<hr class="my-30" />

					<!-- 개인정보보호를 위한 이용자 동의사항 { -->
					<h3 class="card-title"><i class="fas fa-check"></i> 개인정보보호를 위한 이용자 동의사항</h3>
					<div class="card bg-light" >
						<div class="card-body terms1" >
<h6><i class="far fa-square"></i> 수집하는 개인정보 항목</h6>
<br />
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br />
<br />
&middot; 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보<br />
&middot; 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식 , 전화/팩스를 통한 회원가입<br />
<br />
<br />
<h6><i class="far fa-square"></i> 개인정보의 수집 및 이용목적</h6>
<br />
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..<br />
<br />
&middot; 서비스 제공에 관한 계약 이행<br />
<span class="pl-30">콘텐츠 제공</span><br />
&middot; 회원 관리<br />
<span class="pl-30">회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 고지사항 전달</span><br />
&middot; 마케팅 및 광고에 활용<br />
<span class="pl-30">이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계</span><br />
<br />
<br />
<h6><i class="far fa-square"></i> 개인정보의 보유 및 이용기간</h6>
<br />
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br />
<br />
&middot; 보존 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보<br />
&middot; 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br />
&middot; 보존 기간 : 5년<br />
<br />

						</div>
					</div>
					<!-- } 개인정보보호를 위한 이용자 동의사항 -->

				</div>
				<div class="section-text col-12">
					<form id="registrationForm" class="form-horizontal" >
						<div class="form-group text-center">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="agree" value="agree" /> 위 약관 및 개인정보취급방침에 모두 동의합니다.
								</label>
							</div>
						</div>

						<div class="form-group text-center">
							<a href="javascript:showRegistView();" class="btn btn-sm btn-primary" role="button">약관동의</a>
							<a href="javascript:cancel();" class="btn btn-sm btn-primary" role="button">동의안함</a>
						</div>
					</form>
				</div>

            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
