<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/smarteditor2/workspace/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
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
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });
});

function fn_Update(){
	document.Form.action = "<c:url value='/komea/bbs/UpdateKomeaBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post" enctype="multipart/form-data">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KopmeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value=""/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>

    <!-- ##### SUB-TITLE Area Start ##### -->
    <section class="sub-title-area bg-img bg-img8 d-flex align-items-center justify-content-center">
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
												<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">게시판<span class="caret"><i class="fas fa-caret-down"></i></span></button>
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
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">신제품소개<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B001">공지사항</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B002">영문공지</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B003">전시회자료</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B004">서식다운로드</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B005">기타자료실</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B006">조합원사동정</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B007">Komea뉴스레터</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B008">신제품소개</a></li>
												</ul>
											</li>
										</ul>
								</div>
						</div>
				</div>
		</div>
		<!-- ##### Section-nav Area End ##### -->

    <!-- ##### Board Edit Section Start ##### -->
    <section class="section-area">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
						<h2>${BoardName}</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-w">

		    		<!-- 버튼 시작 { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
							<a class="btn btn-sm btn-primary" href="javascript:fn_Update()" title="수정" >수정</a>
							<a class="btn btn-sm btn-secondary" href="/komea/bbs/List.do?bCode=${bbsVO.bCode}" title="목록" >목록</a>
				        </div>
				    </div>
				    <!-- } 버튼 끝 -->

					<!-- 게시판 edit시작 { -->
					<div class="container">

						<div class="bo-w-row border-top-3 row">
							<div class="col-md-2 fth">
								<label for="title" class="col-form-label" >제목</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" path="title" name="title" id="title" value="${bbsVO.title}" class="form-control" placeholder="제목" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="uName" class="col-form-label" >작성자</label>
							</div>
							<div class="col-md-10">
								<form:input type="text" path="uName" name="uName" id="uName" value="${bbsVO.uName}" class="form-control" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth" >
								<label for="uName" class="col-form-label" >설정</label>
							</div>
							<div class="col-md-10 col-opt" >
								<div class="container">
									<div class="row">
										<div class="col-md-2 fth sm-label" >
											<label for="noticOn" class="col-form-label" >공지글 :</label>
										</div>
										<div class="col-md-2">
												<form:select path="noticOn" class="form-control">
													<form:option value="0" label="미설정"/>
													<form:option value="1" label="설정"/>
												</form:select>
										</div>
										<div class="col-md-2 fth sm-label">
											<label for="noticOn" class="col-form-label" >메인뷰 :</label>
										</div>
										<div class="col-md-2">
												<form:select path="mainOn" class="form-control">
													<form:option value="0" label="미설정"/>
													<form:option value="1" label="설정"/>
												</form:select>
										</div>
										<div class="col-md-2 fth sm-label">
											<label for="noticOn" class="col-form-label" >통합검색 노출 :</label>
										</div>
										<div class="col-md-2">
												<form:select path="secretOn" class="form-control">
													<form:option value="0" label="미설정"/>
													<form:option value="1" label="설정"/>
												</form:select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="linkOn" class="col-form-label" >링크</label>
							</div>
							<div class="col-md-10">
										<form:input type="hidden" path="linkOn" name="linkOn" id="linkOn" value=""/>
										<div class="form-check-inline">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input" value=""> 새창에서 열림
											</label>
										</div>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="title" class="col-form-label" >최하보기권한</label>
							</div>
							<div class="col-md-10">
										&nbsp;
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
									<label for="title" class="col-form-label" >내용</label>
							</div>
							<div class="col-md-10">
									<textarea id="ir1" rows="10" cols="20" class="form-control">value="${bbsVO.contents}</textarea>
							</div>
						</div>

						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >파일1</label>
							</div>
							<div class="col-md-10">
								<div class="form-check-inline">
									<input type="file" class="form-control-file mr-10" name="file1" id="file1" placeholder="파일 선택" />
									<label class="form-check-label">
										<input type="checkbox" class="form-check-input" value="" name="ext_file1" id="ext_file1" > 파일삭제 (${bbsVO.fNm1})
									</label>
								</div>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >파일2</label>
							</div>
							<div class="col-md-10">
								<input type="file" class="form-control-file" name="file2" id="file2" placeholder="파일 선택" />
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >파일3</label>
							</div>
							<div class="col-md-10">
								<div class="form-check-inline">
									<input type="file" class="form-control-file mr-10" name="file3" id="file3" placeholder="파일 선택" />
									<label class="form-check-label">
										<input type="checkbox" class="form-check-input" value="" name="ext_file3" id="ext_file3" > 파일삭제 (${bbsVO.fNm1})
									</label>
								</div>
							</div>
						</div>
						<div class="bo-w-row row">
							<div class="col-md-2 fth">
								<label for="input_file" class="col-form-label" >파일4</label>
							</div>
							<div class="col-md-10">
								<input type="file" class="form-control-file" name="file4" id="file4" placeholder="파일 선택" />
							</div>
						</div>

					</div><!-- div class="container" -->

				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
							<a class="btn btn-sm btn-primary" href="javascript:fn_Update()" title="수정" >수정</a>
							<a class="btn btn-sm btn-secondary" href="/komea/bbs/List.do?bCode=${bbsVO.bCode}" title="목록" >목록</a>
				        </div>
				    </div>

				</div>
			</div>
		</div>
   	</section>
    <!-- ##### Board Edit Section End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
