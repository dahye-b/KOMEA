<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/smarteditor2/workspace/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              //oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });

     //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		  alert(document.Form.ir1.value);
      });
});
</script>
<body>
	
<form:form name="Form" commandName="comp" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>


    <!-- ##### SUB-TITLE Area Start ##### -->
    <section class="sub-title-area bg-img bg-img2 d-flex align-items-center justify-content-center" >
        <div class="sub-title-Content">
            <h2>KOMEA</h2>
        </div>
    </section>
    <!-- ##### SUB-TITLE Area End ##### -->

		<!-- ##### Section-nav Area Start ##### -->
		<div class="section-nav sub-nav-line">
        <div class="container">
            <div class="row">
                <div class="col-12">
										<ul class="dropdown-line">
											<li class="dropdown-home">
												<button type="button" href="#" class="btn btn-home" ></button>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">조합원사<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0101.do">KOMEA<small>(KOMEC)</small></a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0201.do">조합원사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.3.1.jsp">사업소개</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/show/WorkList.do">전시행사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >기자재 수요예측 시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >수출 및 A/S시스템</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.7.1.jsp">자료실</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bbsTy=0">게시판</a></li>
												</ul>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">회원사<span class="caret"><i class="fas fa-caret-down"></i></span></button>
                        						<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0201.do">가입인사</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0202.do">회원사</a></li>
												</ul>
											</li>
										</ul>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Section-nav Area End ##### -->



    <!-- ##### Section Area Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">
            	
            	<div class="section-heading mb-5 col-12">
					<h2>조합원사</h2>
					<div class="dropdown-line-subtitle"></div>
				</div>
            	
            	<div class="section-text col-12 mb-100 bo-v">

					<!-- 게시물 보기 시작 { -->			
					<h5 class="mb-1" ><i class="fas fa-user-cog"></i> 조합원사 View</h5>
					<div class="container mb-10">

							<div class="bo-v-row border-top-3 row">
								<div class="col-md-2 fth"><strong>카테고리</strong></div>
								<div class="col-md-10">${compVO.category}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>업체명</strong></div>
								<div class="col-md-4">${compVO.company}</div>
								<div class="col-md-2 fth"><strong>영문업체명</strong></div>
								<div class="col-md-4">${compVO.eCompany}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>대표자 한글명</strong></div>
								<div class="col-md-4">${compVO.ceo}</div>
								<div class="col-md-2 fth"><strong>대표자 영문명</strong></div>
								<div class="col-md-4">${compVO.eCeo}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>Homepage</strong></div>
								<div class="col-md-4">${compVO.homepage}</div>
								<div class="col-md-2 fth"><strong>e-mail</strong></div>
								<div class="col-md-4">${compVO.email}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>전화번호</strong></div>
								<div class="col-md-4">${compVO.tel}</div>
								<div class="col-md-2 fth"><strong>팩스번호</strong></div>
								<div class="col-md-4">${compVO.fax}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>대표주소</strong></div>
								<div class="col-md-10">${compVO.head}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>인증서</strong></div>
								<div class="col-md-10">${compVO.certificate}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>회사소개</strong></div>
								<div class="col-md-10">${compVO.contents}</div>
							</div>
							<div class="bo-v-row row">
								<div class="col-md-2 fth"><strong>주요생산품</strong></div>
								<div class="col-md-10">${compVO.mainProducts}</div>
							</div>
							
					</div>	
					<!-- 게시물 보기 시작 { -->
					
					<!-- 버튼 시작 { -->
					<div class="text-right" >							
							<a href="<c:url value='/komea/mn0202.do'/>" class="btn btn-sm btn-secondary" role="button">목록</a>							
					</div>
					<!-- } 버튼 끝 -->

				</div>
            </div>
        </div>
    </section>
    <!-- ##### Section Area End ##### -->

</form:form>
<%@ include file="/WEB-INF/include/include-bottom.jsp" %>