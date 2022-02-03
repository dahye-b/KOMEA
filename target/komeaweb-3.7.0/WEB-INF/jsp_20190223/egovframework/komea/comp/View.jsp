<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/smarteditor2/workspace/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
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
<h2>조합원사 View</h2>
<table style="border:1px solid #ccc">
<tr>
	<td>카테고리</td><td>${compVO.category}</td>
</tr>
<tr>
	<td>업체명</td><td>${compVO.company}</td>
</tr>
<tr>
	<td>영문업체명</td><td>${compVO.eCompany}</td>
</tr>
<tr>
	<td>대표자 한글명</td><td>${compVO.ceo}</td>
</tr>
<tr>
	<td>대표자 영문명</td><td>${compVO.eCeo}</td>
</tr>
<tr>
	<td>Homepage</td><td>${compVO.homepage}</td>
</tr>
<tr>
	<td>e-mail</td><td>${compVO.email}</td>
</tr>
<tr>
	<td>전화번호</td><td>${compVO.tel}</td>
</tr>
<tr>
	<td>팩스번호</td><td>${compVO.fax}</td>
</tr>
<tr>
	<td>대표주소</td><td>${compVO.head}</td>
</tr>
<tr>
	<td>인증서</td><td>${compVO.certificate}</td>
</tr>
<tr>
	<td>회사소개</td><td>${compVO.contents}</td>
</tr>
<tr>
	<td>주요생산품</td><td>${compVO.mainProducts}</td>
</tr>
</table>
<a href="http://komeaweb.cafe24.com/komea/comp/List.do" class="btn btn-warning" role="button">목록</a>
</form:form>
</body>
</html>