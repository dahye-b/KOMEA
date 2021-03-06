<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<script type="text/javascript" src="/smarteditor2/workspace/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript">
function detail(obj1, obj2, obj3, obj4, obj5){
	document.Form.bCode.value = obj1;
	document.Form.idx.value = obj2;
	document.Form.block.value = obj3;
	document.Form.rlevel.value = obj4;
	document.Form.boss.value = obj5;
	document.Form.action = "<c:url value='/komea/bbs/View.do'/>";
	document.Form.submit();
}
function fn_downloadFile(obj1, obj2){
	document.Form.idx.value = obj1;
	document.Form.fNo.value = obj2;
	document.Form.action = "<c:url value='/komea/bbs/downloadFile.do'/>";
	document.Form.submit();
}
function fn_Edit(){
	document.Form.action = "<c:url value='/komea/bbs/Edit.do'/>";
	document.Form.submit();
}
function fn_Delete(){
	document.Form.action = "<c:url value='/komea/bbs/DeleteKomeaBoard.do'/>";
	document.Form.submit();
}
</script>
<body>
<form:form name="Form" commandName="bbs" method="post">
	<form:input type="hidden" path="boardGb" name="boardGb" id="boardGb" value="KomeaBoard"/>
	<form:input type="hidden" path="bCode" name="bCode" id="bCode" value=""/>
	<form:input type="hidden" path="idx" name="idx" id="idx" value=""/>
	<form:input type="hidden" path="block" name="block" id="block" value=""/>
	<form:input type="hidden" path="rlevel" name="rlevel" id="rlevel" value=""/>
	<form:input type="hidden" path="boss" name="boss" id="boss" value=""/>
	<form:input type="hidden" path="fNo" name="fNo" id="fNo" value=""/>

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
												<button type="button" href="#" class="btn dropdown-toggle btn-sub-nvi" id="menu1" data-toggle="dropdown">?????????<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul" role="menu" aria-labelledby="menu1">
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0101.do">KOMEA<small>(KOMEC)</small></a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/mn0201.do">????????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.3.1.jsp">????????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/show/WorkList.do">????????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >????????? ???????????? ?????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >?????? ??? A/S?????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="www.daum.net" target="_blank" >Kosmedia</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="sub.7.1.jsp">?????????</a></li>
													<li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bbsTy=0">?????????</a></li>
												</ul>
											</li>
											<li class="dropdown dropdown-sub-nvi">
												<button type="button" class="btn dropdown-toggle btn-sub-nvi second" id="menu2" data-toggle="dropdown">???????????????<span class="caret"><i class="fas fa-caret-down"></i></span></button>
												<ul class="dropdown-menu dropdown-menu-ul second" role="menu" aria-labelledby="menu1">
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B001">????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B002">????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B003">???????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B004">??????????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B005">???????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B006">??????????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B007">Komea????????????</a></li>
												 <li role="presentation"><a role="menuitem" tabindex="-1" href="/komea/bbs/List.do?bCode=B008">???????????????</a></li>
												</ul>
											</li>
										</ul>
								</div>
						</div>
				</div>
		</div>
		<!-- ##### Section-nav Area End ##### -->


    <!-- ##### Board View Section Start ##### -->
    <section class="section-area board-view">
        <div class="container">
            <div class="row">

            	<div class="section-heading mb-5 col-12">
						<h2>${BoardName}</h2>
						<div class="dropdown-line-subtitle"></div>
				</div>

            	<div class="section-text col-12 mb-100 bo-v">

					<!-- ?????????  view?????? { -->

		    		<!-- ?????? ?????? { -->
				    <div class="clearfix mb-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/List.do?bCode=${bbsVO.bCode}'/>" class="btn btn-sm btn-secondary" >??????</a>
				            <a href="javascript:fn_Delete()" class="btn btn-sm btn-primary" >??????</a>
				            <a href="javascript:fn_Edit()" class="btn btn-sm btn-primary" >??????</a>
				        </div>
				    </div>
				    <!-- } ?????? ??? -->

				    <!-- ?????? ?????? { -->
				    <div class="bo-v-title border-top-3" >
				        <h4 class="text-bold" ><span class="text-secondary text-center" >${bbsVO.idx}. </span> ${bbsVO.title}</h4>
						<div class="row justify-content-end" >
								<div class="col-auto" >
									<span class="text-secondary" >&middot; ????????? : </span><strong>${bbsVO.uName}</strong>
								</div>
						        <div class="col-auto" >
					        		<span class="text-secondary" >&middot; ????????? : </span><strong>${bbsVO.indate}</strong>
					        	</div>
					        	<div class="col-auto" >
					            	<span class="text-secondary" >&middot; ?????? : </span><strong>${bbsVO.cnt}</strong>
					            </div>
						</div>
				    </div>
				    <!-- } ????????? -->

					<!-- ???????????? ?????? { -->
					<div class="bo-v-file">
						<ul class="nav list-inline">
							<c:choose>
								<c:when test="${fn:length(uploadFileList) > 0}">
									<c:forEach var="uploadFileList" items="${uploadFileList}" varStatus="status">
									<li class="list-inline-item mr-15"><a href="javascript:fn_downloadFile(${uploadFileList.gulIdx},${uploadFileList.fNo});" title="<c:out value="${uploadFileList.fNm}" />" ><i class="fas fa-paperclip text-info"></i> <c:out value="${uploadFileList.fNm}" /> <span class="text-muted" >(Size:${uploadFileList.fSize})</span></a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="list-inline-item">??????????????? ????????????.</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- } ???????????? ??? -->

				    <!-- ?????? ?????? ?????? { -->
				    <div class="bo-v-content">
						<c:out value="${bbsVO.contents}" escapeXml="false" />
				    </div>
				    <!-- } ?????? ?????? ??? -->

					<div class="bo-v-navi">
							<c:choose>
							<c:when test="${fn:length(PreNextList) > 0}">
							<c:forEach var="PreNextList" items="${PreNextList}" varStatus="status">
							<div class="prev">
									<span class="font-light"><c:out value="${PreNextList.gb}" /></span>
									<a href="javascript:detail('${PreNextList.bCode}',${PreNextList.idx},${PreNextList.block},${PreNextList.rlevel},${PreNextList.boss});"><c:out value="${PreNextList.title}" /></a>
							</div>
							</c:forEach>
							</c:when>
							</c:choose>
					</div>

		    		<!-- ?????? ?????? { -->
				    <div class="mt-10" >
				        <div class="btn-group btn-group-justified float-right">
				            <a href="<c:url value='/komea/bbs/List.do?bCode=${bbsVO.bCode}'/>" class="btn btn-sm btn-secondary" >??????</a>
				            <a href="javascript:fn_Delete()" class="btn btn-sm btn-primary" >??????</a>
				            <a href="javascript:fn_Edit()" class="btn btn-sm btn-primary" >??????</a>
				        </div>
				    </div>
				    <!-- } ?????? ??? -->


				</div><!--// bo_v-->

			</div>
		</div>
   	</section>
    <!-- ##### Board View Section End ##### -->

</form:form>

<%@ include file="/WEB-INF/include/include-bottom.jsp" %>
